import 'package:flutter/material.dart';
import 'package:gais/data/model/request_trip/selected_guest_model.dart';

typedef SelectedItemsCallBack = Function(
    List<SelectedGuestModel> selectedItems);

typedef ListItemBuilder = Widget Function(int index);

typedef BottomSheetListener = bool Function(
    DraggableScrollableNotification draggableScrollableNotification);

class ShowList {
  final List<SelectedGuestModel> data;
  final SelectedItemsCallBack? selectedItems;
  final ListItemBuilder? listItemBuilder;
  final bool enableMultipleSelection;
  final Widget? bottomSheetTitle;
  final Widget? submitButtonChild;
  final TextFormField? searchWidget;
  final bool isSearchVisible;
  final Color showListBackgroundColor;
  final String? searchHintText;
  final bool isDismissible;
  final BottomSheetListener? bottomSheetListener;

  ShowList({
    Key? key,
    required this.data,
    this.selectedItems,
    this.listItemBuilder,
    this.enableMultipleSelection = false,
    this.bottomSheetTitle,
    this.isDismissible = true,
    this.submitButtonChild,
    this.searchWidget,
    this.searchHintText = 'Search',
    this.isSearchVisible = true,
    this.showListBackgroundColor = Colors.transparent,
    this.bottomSheetListener,
  });
}

class CustomSearchList {
  ShowList showList;

  CustomSearchList(this.showList);

  void showModal(context) {
    showModalBottomSheet(
      isScrollControlled: true,
      enableDrag: showList.isDismissible,
      isDismissible: showList.isDismissible,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
      ),
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return MainBody(showList: showList);
          },
        );
      },
    );
  }
}

class MainBody extends StatefulWidget {
  final ShowList showList;

  const MainBody({required this.showList, Key? key}) : super(key: key);

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  final TextEditingController _editingController = TextEditingController();

  List<SelectedGuestModel> mainList = [];

  @override
  void initState() {
    super.initState();
    mainList = widget.showList.data;
    _setSearchWidgetListener();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<DraggableScrollableNotification>(
      onNotification: widget.showList.bottomSheetListener,
      child: DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.13,
        maxChildSize: 0.9,
        expand: false,
        builder: (BuildContext context, ScrollController scrollController) {
          return Column(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: widget.showList.bottomSheetTitle ?? Container()),
                    Visibility(
                      visible: widget.showList.enableMultipleSelection,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Material(
                          child: ElevatedButton(
                            onPressed: () {
                              List<SelectedGuestModel> selectedList = widget
                                  .showList.data
                                  .where(
                                      (element) => element.isSelected ?? false)
                                  .toList();
                              List<SelectedGuestModel> selectedNameList = [];

                              for (var element in selectedList) {
                                selectedNameList.add(element);
                              }

                              widget.showList.selectedItems
                                  ?.call(selectedNameList);
                              _onUnFocusKeyboardAndPop();
                            },
                            child: widget.showList.submitButtonChild ??
                                const Text('Done'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: widget.showList.isSearchVisible,
                child: widget.showList.searchWidget ??
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        controller: _editingController,
                        cursorColor: Colors.black,
                        onChanged: _buildSearchList,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.black12,
                          contentPadding: const EdgeInsets.only(
                              left: 0, bottom: 0, top: 0, right: 15),
                          hintText: widget.showList.searchHintText,
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                          prefixIcon: const IconButton(
                            icon: Icon(Icons.search),
                            onPressed: null,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              _buildSearchList("");
                              _editingController.clear();
                            },
                            child: const Icon(
                              Icons.cancel,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
              ),
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: mainList.length,
                  itemBuilder: (context, index) {
                    bool isSelected = mainList[index].isSelected ?? false;
                    return InkWell(
                      child: Container(
                        color: widget.showList.showListBackgroundColor,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                          child: ListTile(
                            title:
                                widget.showList.listItemBuilder?.call(index) ??
                                    Text(
                                      mainList[index].name,
                                    ),
                            trailing: widget.showList.enableMultipleSelection
                                ? GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        mainList[index].isSelected =
                                            !isSelected;
                                      });
                                    },
                                    child: isSelected
                                        ? const Icon(Icons.check_box)
                                        : const Icon(
                                            Icons.check_box_outline_blank),
                                  )
                                : const SizedBox(
                                    height: 0.0,
                                    width: 0.0,
                                  ),
                          ),
                        ),
                      ),
                      onTap: widget.showList.enableMultipleSelection
                          ? null
                          : () {
                              widget.showList.selectedItems
                                  ?.call([mainList[index]]);
                              _onUnFocusKeyboardAndPop();
                            },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  _buildSearchList(String userSearchTerm) {
    final results = widget.showList.data
        .where((element) =>
            element.name.toLowerCase().contains(userSearchTerm.toLowerCase()))
        .toList();
    if (userSearchTerm.isEmpty) {
      mainList = widget.showList.data;
    } else {
      mainList = results;
    }
    setState(() {});
  }

  _onUnFocusKeyboardAndPop() {
    FocusScope.of(context).unfocus();
    Navigator.of(context).pop();
  }

  void _setSearchWidgetListener() {
    TextFormField? _searchField = widget.showList.searchWidget;
    _searchField?.controller?.addListener(() {
      _buildSearchList(_searchField.controller?.text ?? '');
    });
  }
}

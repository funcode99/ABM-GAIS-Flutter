// library number_pagination;

import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';

class CustomPagination extends StatefulWidget {
  const CustomPagination(
      {super.key, required this.onPageChanged,
      required this.pageTotal,
      this.threshold = 4,
      this.pageInit = 1,
      this.colorPrimary,
      this.colorSub,
      this.controlButton,
      this.iconToFirst,
      this.iconPrevious,
      this.iconNext,
      this.iconToLast,
      this.fontSize = 15,
      this.fontFamily,
      this.margin});

  final Function(int) onPageChanged;

  final int pageTotal;

  final int pageInit;

  final int threshold;

  final Color? colorPrimary;

  final Color? colorSub;

  final Widget? controlButton;

  final Widget? iconToFirst;

  final Widget? iconPrevious;

  final Widget? iconNext;

  final Widget? iconToLast;

  final double fontSize;

  final String? fontFamily;

  final EdgeInsets? margin;

  @override
  _CustomPaginationState createState() => _CustomPaginationState();
}

class _CustomPaginationState extends State<CustomPagination> {
  late int rangeStart;
  late int rangeEnd;
  late int currentPage;
  late final Widget iconToFirst;
  late final Widget iconPrevious;
  late final Widget iconNext;
  late final Widget iconToLast;

  @override
  void initState() {
    this.currentPage = widget.pageInit;
    this.iconToFirst = widget.iconToFirst ??
        Icon(Icons.keyboard_double_arrow_left, color: widget.colorSub);
    this.iconPrevious = widget.iconPrevious ??
        Icon(Icons.keyboard_arrow_left, color: widget.colorSub);
    this.iconNext = widget.iconNext ??
        Icon(Icons.keyboard_arrow_right, color: widget.colorSub);
    this.iconToLast = widget.iconToLast ??
        Icon(Icons.keyboard_double_arrow_right, color: widget.colorSub);

    _rangeSet();

    super.initState();
  }

  Widget _defaultControlButton(Widget icon) {
    return AbsorbPointer(
      child: TextButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(5.0),
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
          minimumSize: MaterialStateProperty.all(Size(48, 48)),
          foregroundColor:
              MaterialStateProperty.all(widget.colorPrimary ?? infoColor),
          backgroundColor: MaterialStateProperty.all(widget.colorSub),
        ),
        onPressed: () {},
        child: icon,
      ),
    );
  }

  void _changePage(int page) {
    if (page <= 0) page = 1;

    if (page > widget.pageTotal) page = widget.pageTotal;

    setState(() {
      currentPage = page;
      _rangeSet();
      widget.onPageChanged(currentPage);
    });
  }

  void _rangeSet() {
    rangeStart = currentPage % widget.threshold == 0
        ? currentPage - widget.threshold
        : (currentPage ~/ widget.threshold) * widget.threshold;

    rangeEnd = rangeStart + widget.threshold;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin:
          widget.margin ?? EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: widget.colorPrimary ?? whiteColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            child: Container(
              child: iconToFirst,
            ),
            onTap: () => _changePage(0),
          ),
          GestureDetector(
            child: Container(
              child: iconPrevious,
            ),
            onTap: () => _changePage(--currentPage),
          ),
          ...List.generate(
            rangeEnd <= widget.pageTotal
                ? widget.threshold
                : widget.pageTotal % widget.threshold,
            (index) => Flexible(
              child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () => _changePage(index + 1 + rangeStart),
                child: Container(
                  margin: const EdgeInsets.all(4),
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  decoration: BoxDecoration(
                    color: (currentPage - 1) % widget.threshold == index
                        ? widget.colorPrimary ?? infoColor
                        : widget.colorSub,
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    border: Border.all(color: widget.colorSub ?? infoColor, width: 1),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.grey,
                    //     offset: Offset(0.0, 1.0), //(x,y)
                    //     blurRadius: 6.0,
                    //   ),
                    // ],
                  ),
                  child: Text(
                    '${index + 1 + rangeStart}',
                    style: TextStyle(
                      fontSize: widget.fontSize,
                      fontFamily: widget.fontFamily,
                      color: (currentPage - 1) % widget.threshold == index
                          ? widget.colorSub ?? whiteColor
                          : widget.colorPrimary,
                    ),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            child: Container(
              child: iconNext,
            ),
            onTap: () => _changePage(++currentPage),
          ),
          GestureDetector(
            child: Container(
              child: iconToLast,
            ),
            onTap: () => _changePage(widget.pageTotal),
          )
        ],
      ),
    );
  }
}

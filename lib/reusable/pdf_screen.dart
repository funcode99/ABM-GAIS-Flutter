import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class PDFScreen extends StatefulWidget {
  final String? path;
  final String fileURL;

  const PDFScreen({Key? key, this.path, required this.fileURL}) : super(key: key);

  _PDFScreenState createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> with WidgetsBindingObserver {
  late File Pfile;
  bool isLoading = false;
  String? fileExtension;

  Future<void> loadNetwork(String link) async {
    setState(() {
      isLoading = true;
    });
    var url = link;
    final response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;
    final filename = p.basename(url);
    final dir = await getApplicationDocumentsDirectory();
    var file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes, flush: true);
    setState(() {
      Pfile = file;
    });
    fileExtension = p.extension(Pfile.path);
    print("path $Pfile");
    print("extension : $fileExtension");
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    loadNetwork(widget.fileURL);
    print("fileURL : ${widget.fileURL}");
    super.initState();
  }

  final Completer<PDFViewController> _controller = Completer<PDFViewController>();
  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        title: Text("Attachment", style: appTitle),
        leading: const CustomBackButton(),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : fileExtension == ".pdf" ? Stack(
              children: <Widget>[
                PDFView(
                  filePath: Pfile.path,
                  enableSwipe: true,
                  swipeHorizontal: true,
                  autoSpacing: false,
                  pageFling: false,
                  onRender: (_pages) {
                    setState(() {
                      pages = _pages;
                      isReady = true;
                    });
                  },
                  onError: (error) {
                    print(error.toString());
                  },
                  onPageError: (page, error) {
                    print('$page: ${error.toString()}');
                  },
                  onViewCreated: (PDFViewController pdfViewController) {
                    _controller.complete(pdfViewController);
                  },
                  onPageChanged: (int? page, int? total) {
                    // print('page change: $page/$total');
                    setState(() {
                      currentPage = page;
                    });
                  },
                ),
                errorMessage.isEmpty
                    ? !isReady
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Container()
                    : Center(
                        child: Text(errorMessage),
                      )
              ],
            ) : Center(child: Image.network(widget.fileURL)),
    );
  }
}

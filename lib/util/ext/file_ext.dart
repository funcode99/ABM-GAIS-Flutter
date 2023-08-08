import 'dart:io';

extension FileExtension on File{
  String filename(){
    String fileName = path.split('/').last;
    return fileName;
  }
}

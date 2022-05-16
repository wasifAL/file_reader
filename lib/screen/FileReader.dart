import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class FileReader extends StatefulWidget {
  const FileReader({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<FileReader> createState() => _FileReader();
}

class _FileReader extends State<FileReader> {
  final String _no_content = "No Content";
  String _content = "";

  void _fileSelection() {
    setState(() async {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
          type: FileType.custom, allowedExtensions: ['txt', 'pdf', 'doc']);
      _textReader(result);
    });
  }

  void _textReader(FilePickerResult? result) async {
    if (result != null) {
      File file = File(result.files.first.path.toString());
      _content = await file.readAsString();
      print(_content);
    } else {
      _content = _no_content;
    }
  }

  @override
  Widget build(BuildContext context) {
    FilePickerResult? result;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(

          padding: EdgeInsets.fromLTRB(0, 0, 0, 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('$_content'),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Wrap(
        direction: Axis.horizontal,
        //use vertical to show  on vertical axis
        alignment: WrapAlignment.center,
        //will break to another line on overflow
        children: <Widget>[
          Container(
              margin: const EdgeInsets.all(10),
              child: FloatingActionButton(
                onPressed: _fileSelection,
                child: const Icon(Icons.attach_file_outlined),
              )),
          Container(
              margin: const EdgeInsets.all(10),
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    _content = _no_content;
                  });
                },
                backgroundColor: Colors.deepOrangeAccent,
                child: const Icon(Icons.cleaning_services_rounded),
              )), // button third

          // Add more buttons here
        ],
      ),
    );
  }
}

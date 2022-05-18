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

  Future<String> _fileSelection() async {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
          type: FileType.custom, allowedExtensions: ['txt']);
      if (result != null) {
        File file = File(result.files.first.path.toString());
        return await file.readAsString();
      }
      return _no_content;
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
                onPressed: (){
                  String result = _fileSelection() as String;
                  setState(()  {
                    _content = result;
                  });
                },
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

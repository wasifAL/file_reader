import 'package:file_reader/screen/FileReader.dart';
import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FileReader',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FileReader(title: 'File Reader'),
    );
  }
}

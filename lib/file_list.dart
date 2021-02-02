import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_file_manager/flutter_file_manager.dart';
import 'package:open_file/open_file.dart';

class FileList extends StatefulWidget {
  FileList(this.path);

  final path;

  @override
  State<StatefulWidget> createState() {
    return _FileList();
  }
}

class _FileList extends State<FileList> {
  String rootPath;
  List<Directory> directories = [];
  List<File> files = [];

  @override
  initState() {
    super.initState();
    rootPath = widget.path;
    getFiles();
  }

  void getFiles() async {
    files = await FileManager.listFiles(rootPath) ?? [];
    directories = await FileManager.listDirectories(Directory(rootPath)) ?? [];
    for (var f in files) print(f.path);
    for (var d in directories) print(d.toString());
    setState(() {}); //update the UI
  }

  onTap(BuildContext context, Directory directory) {
    var route = MaterialPageRoute(
      builder: (context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(directory.path.split('/').last),
        ),
        body: FileList(directory.path),
      ),
    );

    Navigator.of(context).push(route);
  }

  @override
  Widget build(BuildContext context) {
    return (files.length == 0 && directories.length == 0)
        ? Center(
            child: Text('No Data'),
          )
        : SingleChildScrollView(
            child: Column(
              children: [
                if (files.length > 0) Text('Files'),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: files.length,
                  itemBuilder: (context, index) {
                    final String _fileName = files[index].path.split('/').last;
                    return InkWell(
                      onTap: () => OpenFile.open(files[index].path),
                      child: ListTile(
                        title: Text(_fileName),
                        trailing: Icon(Icons.insert_drive_file_outlined),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 4,
                    );
                  },
                ),
                if (directories.length > 0) Text('Folders'),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: directories.length,
                  itemBuilder: (context, index) {
                    final String _dirName =
                        directories[index].path.split('/').last;
                    return InkWell(
                      onTap: () => onTap(context, directories[index]),
                      child: ListTile(
                        title: Text(_dirName),
                        trailing: Icon(Icons.folder_outlined),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 4,
                    );
                  },
                )
              ],
            ),
          );
  }
}

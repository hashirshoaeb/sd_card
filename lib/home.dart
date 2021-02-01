import 'package:flutter/material.dart';
import 'package:path_provider_ex/path_provider_ex.dart';
import 'package:permission_handler/permission_handler.dart';

import './file_list.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PermissionStatus status = PermissionStatus.undetermined;
  String sdCardRootDirectory = '';

  @override
  initState() {
    super.initState();
    requestPermission();
  }

  Future<void> requestPermission() async {
    if (await Permission.storage.request().isGranted) {
      setState(() {
        status = PermissionStatus.granted;
      });
      getSDCardRootDirectory();
    }
  }

  void getSDCardRootDirectory() async {
    // async function to get list of storages
    List<StorageInfo> storageInfo = await PathProviderEx.getStorageInfo();
    for (var si in storageInfo) print(si.appFilesDir);
    // storageInfo[1] for SD card, root directory
    // https://pub.dev/packages/path_provider_ex/example
    if (storageInfo.length > 1) {
      sdCardRootDirectory = storageInfo[1].rootDir;
    } else {
      print('NO SD CARD FOUND');
      sdCardRootDirectory = '';
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("File/Folder list from SD Card"),
        actions: [
          PopupMenuButton<Function>(
            onSelected: (value) => value(),
            itemBuilder: (context) {
              return [
                PopupMenuItem<Function>(
                  value: requestPermission,
                  child: Text('Request Permission'),
                ),
              ];
            },
          )
        ],
      ),
      body: (status != PermissionStatus.granted)
          ? Center(
              child: Text('Grant Storage Permission Please'),
            )
          : FileList(sdCardRootDirectory),
    );
  }
}

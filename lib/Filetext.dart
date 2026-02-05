import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';

import 'dart:io';

import 'package:permission_handler/permission_handler.dart';
class Filetext {
  
  newFile(String name ,String note ) async
  {
    File file = File('/storage/emulated/0/Download/${name}.txt');
    var status =await Permission.storage.status;
    if(!status.isGranted)
      {
        await Permission.storage.request();
      }
    await file.writeAsString(note+'\n', mode: FileMode.append,encoding: utf8);

  }
  openFile(String path)async
  {
    await OpenFilex.open(path);

  }

  saveText(File file , String note)async
  {
    var status =await Permission.storage.status;
    if(!status.isGranted)
    {
      await Permission.storage.request();
    }
    await file.writeAsString(note+'\n', mode: FileMode.append);


  }
}


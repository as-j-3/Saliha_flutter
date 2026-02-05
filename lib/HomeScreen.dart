import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:file_text/Filetext.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  TextEditingController note = TextEditingController();
  TextEditingController fileName = TextEditingController();
  FilePicker? result;
  String? file;
  Filetext fileText = Filetext();
  Filetext fileText2 = Filetext();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('الملاحظات')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: note,
              decoration: InputDecoration(
                labelText: 'Note',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: fileName,
              decoration: InputDecoration(
                labelText: 'file name ',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    fileText.newFile(fileName.text, note.text);
                    print('تم اضافه الملف مع الكتابة فيه راجع المسار ');
                  },
                  child: Text('انشاء ملف جديد '),
                ),
                ElevatedButton(

                  onPressed: () async {
                    try {
                      FilePickerResult? result = await FilePicker.platform.pickFiles(
                        type: FileType.custom,
                        allowedExtensions: ['txt'],
                      );

                      if (result != null) {
                        String originalPath = result.files.single.path!;
                        File file = File(originalPath);
                        String nameOnly = result.files.single.name;

                        String newPath = '/storage/emulated/0/Download/$nameOnly';
                        File permanentFile = await file.copy(newPath);

                        // الكتابة في الملف
                        await fileText.saveText(permanentFile, note.text);

                        //  فتح الملف ---
                        await fileText.openFile(permanentFile.path);
                        // -------------------------------
                      }
                    } catch (e) {
                      print('حدث خطأ: $e');
                    }
                    setState(() {});
                  },
                  child: const Text("اختر ملف"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

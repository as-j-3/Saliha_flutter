import 'package:excal_exampl/excel.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _ExcelScreenState();
}

class _ExcelScreenState extends State<HomeScreen> {
  // تعريف وحدات التحكم للنصوص
  final TextEditingController _bookNameController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _fileNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void _clear() {
      _bookNameController.clear();
      _authorController.clear();
      _priceController.clear();
      _fileNameController.clear(); // إذا كنتِ تريدين إبقاء اسم الملف، احذفي هذا السطر
    }
    Exalefile exaleobject=Exalefile();
    return Scaffold(
      appBar: AppBar(
        title: const Text('مصدّر ملفات الإكسل'),
        centerTitle: true,
        backgroundColor: Colors.green[700],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _bookNameController,
              decoration: InputDecoration(
                labelText: 'bookName',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _authorController,
              decoration: InputDecoration(
                labelText: 'author ',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _priceController,
              decoration: InputDecoration(
                labelText: 'price ',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _fileNameController,
              decoration: InputDecoration(
                labelText: 'fileName ',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () async{
              final bookDetails=
              [
                _bookNameController.text,
                _authorController.text,
                _priceController.text

              ];
              exaleobject.createxcelfile(bookDetails, _fileNameController.text);
              _clear();

            }, child: Text('create an excel file'))
          ],
        ),
      ),
    );
  }
}

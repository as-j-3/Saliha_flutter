import 'dart:io';
import 'package:excel/excel.dart';
import 'package:open_filex/open_filex.dart';
import 'package:permission_handler/permission_handler.dart';

class Exalefile {

  Future<void> createxcelfile(List<String> bookinfo, String fileName) async {
    String path = '/storage/emulated/0/Pictures/$fileName.xlsx';
    File file = File(path);
    Excel excel;

    // 1. التحقق: إذا كان الملف موجوداً مسبقاً، افتحه. إذا لم يكن، أنشئ واحداً جديداً.
    if (await file.exists()) {
      var bytes = file.readAsBytesSync();
      excel = Excel.decodeBytes(bytes); // يفتح الملف الحالي ببياناته القديمة
    } else {
      excel = Excel.createExcel(); // ينشئ ملفاً جديداً لأول مرة
    }

    // 2. الوصول لورقة العمل (Sheet)
    // نستخدم الورقة الأولى دائماً
    String sheetName = excel.sheets.keys.first;
    Sheet sheetObject = excel[sheetName];

    // 3. إضافة العناوين فقط إذا كان الملف جديداً (فارغاً)
    if (sheetObject.maxRows == 0) {
      sheetObject.appendRow([
        TextCellValue("اسم الكتاب"),
        TextCellValue("الكاتب"),
        TextCellValue("السعر")
      ]);
    }

    // 4. إضافة البيانات الجديدة في سطر جديد
    List<CellValue> bookData = bookinfo.map((e) => TextCellValue(e)).toList();
    sheetObject.appendRow(bookData);

    // 5. حفظ الملف بعد التعديل
    await saveExcel(excel, fileName);
  }

  Future<void> saveExcel(Excel excel, String fileName) async {
    // 1. التحقق من الحالة الحالية أولاً
    var status = await Permission.storage.status;

    // 2. إذا لم تكن ممنوحة، نطلبها
    if (!status.isGranted) {
      status = await Permission.storage.request();
    }
      var fileBytes = excel.save();

      // إنشاء الملف وحفظ البيانات
      File('/storage/emulated/0/Pictures/$fileName.xlsx')
        ..createSync(recursive: true)
        ..writeAsBytesSync(fileBytes!);
      print("تم حفظ ملف الإكسل بنجاح في التنزيلات");


  }
}
import 'dart:io';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'product_model.dart';

class ExcelReader {
  static Future<List<Product>> readExcel() async {
    List<Product> products = [];

    FilePickerResult? result =
    await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['xlsx']);

    if (result == null) return [];

    File file = File(result.files.single.path!);
    var bytes = file.readAsBytesSync();

    var excel = Excel.decodeBytes(bytes);

    for (var table in excel.tables.keys) {
      for (int i = 1; i < excel.tables[table]!.rows.length; i++) {
        var row = excel.tables[table]!.rows[i];

        products.add(
            Product(
              id: row[0]?.value?.toString() ?? '',
              name: row[1]?.value?.toString() ?? '',
              price: double.tryParse(row[2]?.value?.toString() ?? '0') ?? 0,
              category: row[3]?.value?.toString() ?? '',
              stock: int.tryParse(row[4]?.value?.toString() ?? '0') ?? 0,
            )

        );
      }
    }

        return products;
      }

}

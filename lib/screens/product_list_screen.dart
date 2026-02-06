import 'package:flutter/material.dart';
import '../excel/excel_reader.dart';
import '../excel/product_model.dart';
import '../widgets/product_card.dart';

class ProductListScreen extends StatefulWidget {
  final List<Product> products;

  const ProductListScreen({super.key, required this.products});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  late List<Product> products;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    products = widget.products;

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffECECF1),
      body: Column(
        children: [
          /// Header Gradient
          Container(
            padding: const EdgeInsets.only(
                top: 60, right: 20, left: 20, bottom: 20),
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff8E2DE2), Color(0xff4A6CF7)],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text("قائمة المنتجات",
                    style:
                    TextStyle(color: Colors.white, fontSize: 22)),
                Text("${widget.products.length} منتج",
                    style: const TextStyle(color: Colors.white70)),
              ],
            ),
          ),
          if (products.isNotEmpty)
            TextButton.icon(
                onPressed: ()  async
                {
                  final products = await ExcelReader.readExcel();

                  if (products.isEmpty) return;
                },
                icon: const Icon(Icons.file_open, size: 18),
                label: const Text(" اضغط هنا لإعادة اختيار الملف"),
              ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.products.length,
              itemBuilder: (_, i) =>
                  ProductCard(product: widget.products[i], index: i),
            ),
          ),

        ],
      ),

    );
  }
}

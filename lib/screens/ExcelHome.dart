
import 'package:excal_exampl/screens/product_list_screen.dart';
import 'package:flutter/material.dart';

import '../excel/excel_reader.dart';
import '../widgets/FeatureItem.dart';

class ExcelHome extends StatelessWidget {
  const ExcelHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE9E9EF),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// Icon Box
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xff8E2DE2),
                        Color(0xff4A6CF7),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      )
                    ],
                  ),
                  child: const Icon(
                    Icons.description_outlined,
                    color: Colors.white,
                    size: 40,
                  ),
                ),

                const SizedBox(height: 24),
                /// Title
                const Text(
                  " Excel قارئ ملفات ",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff1F2A44),
                  ),
                ),
                const SizedBox(height: 10),
                /// Subtitle
                const Text(
                  "قم بقراءة ملف اكسل  لعرض بيانات المنتجات بطريقة جميلة ومنظمة",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                  ),
                ),

                const SizedBox(height: 40),

                /// Card Container
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      /// Gradient Button
                      Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xff8E2DE2),
                              Color(0xff4A6CF7),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                          ),
                          onPressed: () async {

                            final products = await ExcelReader.readExcel();

                            if (products.isEmpty) return;

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ProductListScreen(products: products),
                              ),
                            );
                          },

                          icon: const Icon(Icons.upload_outlined,color: Colors.white,),
                          label: const Text(
                            "Excel قراءة من ملف  ",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),
                          ),

                        ),
                      ),

                      const SizedBox(height: 24),

                      const FeatureItem(
                        text: "يحتوي الملف على أسماء المنتجات",
                      ),
                      const FeatureItem(
                        text: "يحتوي الملف على أسعار المنتجات",
                      ),
                      const FeatureItem(
                        text: "يحتوي الملف على فئة المنتجات",
                      ),
                      const FeatureItem(
                        text: "يحتوي الملف على عدد المخزون المنتجات",
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


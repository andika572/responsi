import 'package:flutter/material.dart';
import 'package:responsi/detail_page.dart';
import 'package:responsi/model/meals_model.dart';

import 'api_data_source.dart';
import 'model/kategori_model.dart';

class MealsPage extends StatefulWidget {
  final Categories kategoriModel;

  const MealsPage({required this.kategoriModel, Key? key}) : super(key: key);

  @override
  State<MealsPage> createState() => _MealsPageState();
}

class _MealsPageState extends State<MealsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Meals'),
      ),
     body: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
              Image.network(
                Meals.strMealThumb!,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
               ),
              SizedBox(height: 10),
               Text(
                 Meals.strMeal!,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
      //
      // SizedBox(height: 10),
      // Text(newsModel.publishedAt!),
      // SizedBox(height: 10),
      // Text(newsModel.summary!),
      // SizedBox(height: 60,)
    // Tambahkan informasi lainnya sesuai kebutuhan
    ],
    ),
    ),
    )
    );
  }
}

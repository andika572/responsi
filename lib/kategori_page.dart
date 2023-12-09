import 'package:flutter/material.dart';
import 'package:responsi/meals_page.dart';
import 'package:responsi/model/kategori_model.dart';
import 'api_data_source.dart';

class KategoriPage extends StatefulWidget {
  const KategoriPage({super.key});

  @override
  State<KategoriPage> createState() => _KategoriPageState();
}

class _KategoriPageState extends State<KategoriPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        title: const Text('Meal Categories'),
      ),
      body: _buildListCategoriesBody(),
    );
  }
  Widget _buildListCategoriesBody() {
    return Container(
      child: FutureBuilder(
          future: ApiDataSource.instance.loadCategories(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              return _buildErrorSection();
            }
            if (snapshot.hasData) {
              Kategori categories = Kategori.fromJson(snapshot.data);
              return _buildSuccessSection(categories);
            }
            return _buildLoadingSection();
          }),
    );
  }

  Widget _buildErrorSection() {
    return Center(
      child: Text("Error"),
    );
  }

  Widget _buildSuccessSection(Kategori data) {
    return ListView.builder(
        itemCount: data.categories!.length,
        itemBuilder: (BuildContext context, int index) {
          return _BuildItemUsers(data.categories![index]);
        });
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _BuildItemUsers(Categories kategoriModel) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MealsPage(kategoriModel: kategoriModel),
          ),
        );
      },
      child: Card(
        color: Colors.deepOrange,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 120,
              child: Image.network(kategoriModel.strCategoryThumb!),
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 150,
                    child: Text(kategoriModel.strCategory!, style: TextStyle(fontSize: 15,),)
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


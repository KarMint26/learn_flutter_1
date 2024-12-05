import 'package:first_project/services/recipes_service.dart';
import 'package:first_project/models/recipes_model.dart';
import 'package:first_project/ui/detail_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  RecipeService _recipeService = RecipeService();
  late Future<List<RecipeModel>> futureRecipes;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureRecipes = _recipeService.getAllRecipe();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"),),
      body: FutureBuilder<List<RecipeModel>>(
        future: futureRecipes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(),);
          } else if(snapshot.hasError){
            return Center(child: Text("Error load data ${snapshot.error}"),);
          }else if(!snapshot.hasData){
            return Center(child: Text("Tidak ada data"),);
          }else{
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3
                ), 
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final data = snapshot.data![index];
                return CustomCard(
                  id: data.id, 
                  title: data.title, 
                  img: data.photoUrl, 
                  likes_count: data.likesCount, 
                  comments_count: data.commentsCount
                  );
              },
              );
          }
          
        }
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final int id;
  final String title;
  final String img;
  final int likes_count;
  final int comments_count;

  CustomCard({
    required this.id,
    required this.title,
    required this.img,
    required this.likes_count,
    required this.comments_count,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigasi ke halaman detail, kirimkan ID resep
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(recipeId: id),
          ),
        );
      },
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          children: [
            Image.network(
              img,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 100,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Icon(Icons.star),
                    Text("$likes_count"),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.comment),
                    Text("$comments_count"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

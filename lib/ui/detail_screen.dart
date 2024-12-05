import 'package:first_project/models/recipes_model.dart';
import 'package:first_project/services/recipes_service.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final int recipeId;
  const DetailScreen({Key? key, required this.recipeId}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<RecipeModel> futureRecipe;
  RecipeService _recipeService = RecipeService();

  @override
  void initState() {
    super.initState();
    futureRecipe = _recipeService.getRecipeById(widget.recipeId); // Mendapatkan data resep berdasarkan ID
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Recipe", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        backgroundColor: const Color.fromARGB(255, 45, 107, 240),
      ),
      body: FutureBuilder<RecipeModel>(
        future: futureRecipe,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData) {
            return Center(child: Text("Recipe not found"));
          } else {
            final recipe = snapshot.data!;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Gambar Resep
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      recipe.photoUrl,
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 16),

                  // Judul Resep
                  Text(
                    recipe.title,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 8),

                  // Like & Comment Count
                  Row(
                    children: [
                      Icon(Icons.thumb_up, size: 18, color: Colors.blue),
                      SizedBox(width: 5),
                      Text("${recipe.likesCount} Likes", style: TextStyle(fontSize: 16)),
                      SizedBox(width: 20),
                      Icon(Icons.comment, size: 18, color: Colors.orange),
                      SizedBox(width: 5),
                      Text("${recipe.commentsCount} Comments", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  SizedBox(height: 20),

                  // Deskripsi
                  Text(
                    "Description:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    recipe.description,
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 20),

                  // Bahan-bahan
                  Text(
                    "Ingredients:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    recipe.ingredients,
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 20),

                  // Cara Memasak
                  Text(
                    "Cooking Method:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    recipe.cookingMethod,
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:progressive_image/progressive_image.dart';
import 'package:recipe_app/pages/recipedetails.dart';
import 'package:recipe_app/recipes.dart';

class Favourites extends StatefulWidget {
  const Favourites({Key? key}) : super(key: key);

  @override
  FavouritesState createState() => FavouritesState();
}

class FavouritesState extends State<Favourites> {
  // List<Recipe> favorites = []; // List to store favorite recipes

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Column(
          children: [
            Text(
              "Favourites",
              style: GoogleFonts.sofia(
                textStyle: const TextStyle(fontSize: 30, color: Color(0xFFFA8072)),
              ),
            ),
            //Display the favorite recipes
            // ListView.builder(
            //   shrinkWrap: true,
            //   itemCount: favorites.length,
            //   itemBuilder: (context, index) {
            //     return ListTile(
            //       title: Text(favorites[index].title),
            //       // Add more details if needed
            //     );
            //   },
            // ),
            getRecipes(context),
          ],
        ),
      ),
    );
  }
}
Widget getRecipes(context) {
  List<Recipe> favoriteRecipes =
  recipes.where((recipe) => recipe.favourite).toList();
  return Expanded(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              children: List<Widget>.generate(
                  favoriteRecipes.length,
                      (index) => Container(
                      padding: const EdgeInsets.all(2.0),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>
                                        RecipeDetails(recipe: favoriteRecipes[index])));
                          },
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Stack(children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: ProgressiveImage(
                                        placeholder: const AssetImage(
                                            'assets/placeholder.png'),
                                        thumbnail:
                                        AssetImage(favoriteRecipes[index].image),
                                        image: AssetImage(favoriteRecipes[index].image),
                                        height: 100,
                                        width: 150,
                                        alignment: Alignment.center,
                                        fit: BoxFit.cover),
                                  ),
                                  Align(
                                      alignment: Alignment.topRight,
                                      child: PopupMenuButton(
                                          child: Container(
                                            padding: const EdgeInsets.only(
                                              top: 5,
                                            ),
                                            height: 36,
                                            width: 48,
                                            alignment: Alignment.topRight,
                                            child: const Icon(Icons.more_vert,
                                                size: 35,
                                                color: Color(0xFFFA8072)),
                                          ),
                                          onSelected: (value) {},
                                          itemBuilder: (context) => [
                                            PopupMenuItem(
                                                onTap: () {},
                                                child: Column(children: [
                                                  FloatingActionButton
                                                      .extended(
                                                    onPressed: () {},
                                                    label: const Text(
                                                      "Edit",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    icon: const Icon(
                                                        Icons.edit_outlined,
                                                        color: Color(
                                                            0xFFFA8072)),
                                                    elevation: 0.0,
                                                    backgroundColor:
                                                    Colors.white,
                                                  ),
                                                  FloatingActionButton
                                                      .extended(
                                                    onPressed: () {},
                                                    label: const Text(
                                                      "Delete",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    icon: const Icon(
                                                        Icons
                                                            .delete_outline,
                                                        color: Color(
                                                            0xFFFA8072)),
                                                    elevation: 0.0,
                                                    backgroundColor:
                                                    Colors.white,
                                                  )
                                                ]))
                                          ])),
                                ]),
                                Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                        padding: const EdgeInsets.only(
                                            top: 10, bottom: 5),
                                        constraints: const BoxConstraints(),
                                        onPressed: () {},
                                        icon: favoriteRecipes[index].favourite
                                            ? const Icon(
                                          FluentIcons.heart_28_filled,
                                          size: 25,
                                          color: Color(0xFFFA8072),
                                        )
                                            : const Icon(
                                          FluentIcons.heart_28_regular,
                                          size: 25,
                                        ),
                                      ),
                                      Text("${favoriteRecipes[index].duration} min",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500))
                                    ]),
                                Flexible(
                                  child: Text(
                                    favoriteRecipes[index].title,
                                    style: GoogleFonts.sofia(
                                        textStyle: const TextStyle(
                                          fontSize: 15,
                                        )),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    favoriteRecipes[index].description,
                                    style: const TextStyle(
                                      fontSize: 10,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ])))))));
}
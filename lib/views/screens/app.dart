import 'package:flutter/material.dart';
import 'package:recipes/views/screens/recipe.dart';
import 'package:recipes/views/screens/recipe_detail.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      title: 'Recipe Calculator',
      theme: ThemeData(
          colorScheme: theme.colorScheme.copyWith(
            primary: Colors.grey,
            secondary: Colors.black,
          ),
          fontFamily: 'Poppins'),
      home: const MyHomePage(
        title: 'Recipe Calculator',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final title;
  const MyHomePage({
    super.key,
    required this.title,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: Recipe.samples.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return RecipeDetail(recipe: Recipe.samples[index]);
                    },
                  ),
                );
              },
              child: buildRecipeCard(Recipe.samples[index]),
            );
          },
        ),
      ),
    );
  }

  Widget buildRecipeCard(Recipe recipe) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image(
              image: AssetImage(recipe.imageUrl),
            ),
            SizedBox(
              height: 14.0,
            ),
            Text(
              recipe.label,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      ),
    );
  }
}

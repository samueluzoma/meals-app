import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widget/category_grid_item.dart';
import 'package:meals_app/models/category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context, Category category) {
    // to be able to point to each data in the categories of dummy_data.dart
    final filteredMeals = dummyMeals
        .where(
          (meal) => meal.categories.contains(category.id),
        )
        .toList();

    //for navigating to other screen
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Pick your category'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(21), //adding padding to the grid items
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          // An alternative to this for...loop is using the map functon
          //availableCategories.map((category)=>CategoryGridItem(category: category)).toList();
          for (final eachCategory in availableCategories)
            CategoryGridItem(
              category: eachCategory,
              //for for the naviagtor funtion
              onSelectCategory: () {
                _selectCategory(context, eachCategory);
              },
            ),
        ],
      ),
    );
  }
}

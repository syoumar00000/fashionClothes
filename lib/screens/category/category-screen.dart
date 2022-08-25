import 'package:fashion/providers/category-provider.dart';
import 'package:fashion/styles/spacing-style.dart';
import 'package:fashion/widgets/navigation/default-appbar.dart';
import 'package:fashion/widgets/navigation/main-bottombar.dart';
import 'package:flutter/material.dart';
import 'package:fashion/widgets/category/category-card.dart';
import 'package:fashion/widgets/input/searchbar.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final categoryState = Provider.of<CategoryProvider>(context, listen: false);
    final categories = categoryState.items;

    return Scaffold(
      appBar: const DefaultAppBar(
        title: "Find your favorites",
        showBackButton: false,
      ),
      body: Padding(
        padding: kBodyPadding,
        child: Column(
          children: [
            const SearchBar(
              navigate: true,
            ),
            Expanded(
              child: GridView.builder(
                primary: false,
                padding: const EdgeInsets.symmetric(vertical: 14),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 4 / 3,
                  crossAxisCount: 2,
                ),
                itemCount: categories.length,
                itemBuilder: (BuildContext context, int index) {
                  final category = categories[index];

                  return CategoryCard(category: category);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const MainBottomBar(
        currentIndex: 1,
      ),
    );
  }
}

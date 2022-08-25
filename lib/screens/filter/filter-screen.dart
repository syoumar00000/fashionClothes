import 'package:fashion/models/category.dart';
import 'package:fashion/providers/category-provider.dart';
import 'package:fashion/providers/product-provider.dart';
import 'package:fashion/styles/spacing-style.dart';
import 'package:fashion/styles/text-style.dart';
import 'package:fashion/widgets/input/full-black-button.dart';
import 'package:fashion/widgets/navigation/default-appbar.dart';
import 'package:flutter/material.dart';
import 'package:fashion/screens/filter/widgets/filter-range.dart';
import 'package:provider/provider.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  RangeValues _priceRangeValues = const RangeValues(0, 100);
  RangeValues _caloryRangeValues = const RangeValues(0, 1000);
  RangeValues _durationRangeValues = const RangeValues(0, 60);
  RangeValues _categoryRangeValues = const RangeValues(0, 60);
  List<Category> _selectedCategory = [];

  @override
  Widget build(BuildContext context) {
    final categoryState = Provider.of<CategoryProvider>(context);
    final categories = categoryState.items;

    return Scaffold(
      appBar: DefaultAppBar(
        title: "Fiters",
        showBackButton: true,
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            padding: kBodyPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Cuisines",
                  style: kHeadline6(context),
                ),
                kSpaceH(1),
                //category select chips
                Wrap(
                  spacing: 2,
                  children: categories
                      .map(
                        (e) => ActionChip(
                          backgroundColor: _selectedCategory.contains(e)
                              ? Colors.red
                              : Colors.grey.shade300,
                          label: Text(
                            e.title!,
                            style: TextStyle(
                                color: _selectedCategory.contains(e)
                                    ? Colors.white
                                    : Colors.black),
                          ),
                          onPressed: () {
                            setState(() {
                              if (_selectedCategory.contains(e))
                                _selectedCategory.remove(e);
                              else
                                _selectedCategory.add(e);
                            });
                          },
                        ),
                      )
                      .toList(),
                ),
                //filter ranges
                kSpaceH(1),
                //price range
                FilterRange(
                  title: "Price in \$",
                  rangeValues: _priceRangeValues,
                  onChanged: (rangeValues) {
                    setState(() {
                      _priceRangeValues = rangeValues;
                    });
                  },
                ),
                kSpaceH(1),
                //cook duration range
                FilterRange(
                  title: "Cook Duration in Min.",
                  min: 0,
                  max: 60,
                  division: 12,
                  rangeValues: _durationRangeValues,
                  onChanged: (rangeValues) {
                    setState(() {
                      _durationRangeValues = rangeValues;
                    });
                  },
                ),
                kSpaceH(1),
                //calorie range
                FilterRange(
                  title: "Calories in cal.",
                  min: 0,
                  max: 2000,
                  division: 20,
                  rangeValues: _caloryRangeValues,
                  onChanged: (rangeValues) {
                    setState(() {
                      _caloryRangeValues = rangeValues;
                    });
                  },
                ),
                kSpaceH(1),
                FilterRange(
                  title: "Category in int.",
                  min: 0,
                  max: 60,
                  division: 20,
                  rangeValues: _categoryRangeValues,
                  onChanged: (rangeValues) {
                    setState(() {
                      _categoryRangeValues = rangeValues;
                    });
                  },
                ),
              ],
            ),
          ),
          //apply filter button
          SizedBox(
            width: kScreenWitdh(context) - 25,
            child: FullBlackButton(
              height: 45,
              width: double.infinity,
              onPressed: () {
                Provider.of<ProductProvider>(context, listen: false)
                    .filterProducts(
                  categoryIds: _selectedCategory.map((e) => e.id!).toList(),
                  categoryIdRange: _selectedCategory.map((e) => e.id!).toList(),
                  priceRange: [
                    _priceRangeValues.start,
                    _priceRangeValues.end,
                  ],
                  cookDurationRange: [
                    _durationRangeValues.start,
                    _durationRangeValues.end,
                  ],
                  caloryRange: [
                    _caloryRangeValues.start,
                    _caloryRangeValues.end,
                  ],
                );
                Navigator.pushNamed(context, "/search");
              },
              label: "Apply",
            ),
          ),
        ],
      ),
    );
  }
}

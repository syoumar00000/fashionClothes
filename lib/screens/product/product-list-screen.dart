import 'package:fashion/providers/product-provider.dart';
import 'package:fashion/screens/category/category-screen.dart';
import 'package:fashion/styles/button-style.dart';
import 'package:fashion/styles/spacing-style.dart';
import 'package:fashion/styles/text-style.dart';
import 'package:fashion/widgets/input/searchbar.dart';
import 'package:fashion/widgets/navigation/default-appbar.dart';
import 'package:flutter/material.dart';
import 'package:fashion/widgets/product/product-card.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    final productState = Provider.of<ProductProvider>(context, listen: true);
    final filteredProducts = productState.filteredItems;

    return Scaffold(
      appBar: DefaultAppBar(
        title: "${filteredProducts.length} product(s) found",
      ),
      body: Padding(
        padding: kBodyPadding,
        child: Column(
          children: [
            SearchBar(
              navigate: true,
            ),
            Expanded(
              child: filteredProducts.isNotEmpty
                  //display a product if search result not empty
                  ? GridView.builder(
                      primary: false,
                      padding: EdgeInsets.symmetric(vertical: 14),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 8 / 11,
                        crossAxisCount: 2,
                      ),
                      itemCount: filteredProducts.length,
                      itemBuilder: (BuildContext context, int index) {
                        final product = filteredProducts[index];

                        return ProductCard(product: product);
                      },
                    )
                  //else tell user that nothing found
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            "No items found",
                            style: kHeadline6(context),
                          ),
                        ),
                        kSpaceH(4),
                        //button to go to browse screen
                        SizedBox(
                          width: kScreenWitdh(context) - 25,
                          child: ElevatedButton(
                            style: kBlackButtonStyle,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CategoryScreen(),
                                ),
                              );
                            },
                            child: Text(
                              "Get more foods",
                              style: kHeadline6(context, Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

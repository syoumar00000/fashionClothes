import 'package:fashion/providers/favorite-provider.dart';
import 'package:fashion/styles/button-style.dart';
import 'package:fashion/styles/spacing-style.dart';
import 'package:fashion/styles/text-style.dart';
import 'package:fashion/widgets/navigation/default-appbar.dart';
import 'package:fashion/widgets/navigation/main-bottombar.dart';
import 'package:fashion/widgets/product/product-card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoriteState = Provider.of<FavoriteProvider>(context, listen: true);
    final products = favoriteState.items;

    return Scaffold(
      appBar: const DefaultAppBar(
        title: "Wishlist",
      ),
      body: products.isNotEmpty
          ? Padding(
              padding: kBodyPadding,
              child: GridView.builder(
                shrinkWrap: true,
                primary: false,
                padding: const EdgeInsets.symmetric(vertical: 4),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 8 / 11,
                  crossAxisCount: 2,
                ),
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProductCard(
                    product: products[index],
                  );
                },
              ),
            )
          : Container(
              padding: kBodyPadding,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  Text(
                    "No favorite found",
                    style: kHeadline6(context),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: kBlackButtonStyle,
                      child: Text(
                        "Get more items",
                        style: kSubtitle1(context, Colors.white),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "/category");
                      },
                    ),
                  ),
                  kSpaceH(1)
                ],
              ),
            ),
      bottomNavigationBar: const MainBottomBar(
        currentIndex: 1,
      ),
    );
  }
}

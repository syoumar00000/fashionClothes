import 'package:fashion/providers/product-provider.dart';
import 'package:fashion/styles/input-style.dart';
import 'package:fashion/styles/spacing-style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MySearchBar extends StatelessWidget {
  //navigate to search results if user is on another page
  final bool? navigate;

  const MySearchBar({Key? key, this.navigate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();

    return Row(
      children: [
        Expanded(
          child: Container(
            height: 38,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: TextField(
                      controller: searchController,
                      textInputAction: TextInputAction.search,
                      onSubmitted: (value) {
                        Provider.of<ProductProvider>(context, listen: false)
                            .searchProduct(value);

                        if (navigate == true)
                          Navigator.pushReplacementNamed(context, "/search");
                      },
                      decoration: noBorderInputDecoration.copyWith(
                        hintText: "What do you want to search ?",
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  child: Container(
                    width: 35,
                    height: 35,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: Icon(
                      Icons.search,
                      size: 22,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(0, 0),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: CircleBorder(),
                    primary: Colors.white,
                    elevation: 0,
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: () {
                    print("jesuisici");
                    print("navigate---$navigate");
                    print("searchController---${searchController.text}");

                    Provider.of<ProductProvider>(context, listen: false)
                        .searchProduct(searchController.text);
                    if (navigate == true)
                      Navigator.pushReplacementNamed(context, "/search");
                  },
                )
              ],
            ),
          ),
        ),
        kSpaceW(0.5),
        IconButton(
          icon: Icon(
            Icons.tune,
          ),
          iconSize: 22,
          splashRadius: 25,
          onPressed: () {
            if (navigate == true) Navigator.pushNamed(context, "/filter");
          },
        )
      ],
    );
  }
}

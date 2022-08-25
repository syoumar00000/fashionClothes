import 'package:fashion/models/product.dart';
import 'package:fashion/screens/product/widgets/product-size-button.dart';
import 'package:flutter/material.dart';
import 'package:fashion/screens/product/widgets/product-cart-button.dart';
import 'package:fashion/screens/product/widgets/product-image.dart';
import 'package:fashion/styles/spacing-style.dart';

//product details screen
class ProductScreen extends StatefulWidget {
  final Product product;
  const ProductScreen({Key? key, required this.product}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  //List<String> size = ["S", "M", "L", "XL", "XXL"];
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              ProductImage(
                product: widget.product,
              ),
              Padding(
                padding: kBodyPadding,
                child: Column(
                  children: [
                    kSpaceH(1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //product title
                        Text(
                          widget.product.title!,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        //product price
                        Text(
                          widget.product.priceString(widget.product.prices![0]),
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              ?.copyWith(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    kSpaceH(2),
                    // Product size
                    Wrap(
                      children:
                          List.generate(widget.product.size!.length, (index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                              right: 16,
                            ),
                            child: ButtonComponent(
                              size: 50,
                              color: selectedIndex == index
                                  ? Colors.white
                                  : Colors.black,
                              backgroundColor: selectedIndex == index
                                  ? Colors.black
                                  : Colors.grey.shade200,
                              borderColor: selectedIndex == index
                                  ? Colors.black
                                  : Colors.grey.shade200,
                              text: widget.product.size![index].label,
                            ),
                          ),
                        );
                      }),
                    ),
                    kSpaceH(2),
                    //product description
                    Text(widget.product.description!),
                    kSpaceH(2),
                    //Divider(),
                    //product details
                    // ProductDetailsItem(
                    //   icon: Icons.category_outlined,
                    //   title: "Category",
                    //   value: widget.product.category!.title!,
                    // ),
                    // Divider(),
                    // ProductDetailsItem(
                    //   icon: Icons.timelapse_outlined,
                    //   title: "Cook duration",
                    //   value: widget.product.cookDuration.toString() + " min",
                    // ),
                    // Divider(),
                    // ProductDetailsItem(
                    //   icon: Icons.bolt,
                    //   title: "Energy",
                    //   value: widget.product.calories.toString() + " cal",
                    // ),
                    // Divider(),
                    // ProductDetailsItem(
                    //   icon: Icons.receipt_outlined,
                    //   title: "Order count",
                    //   value: widget.product.orderCount.toString(),
                    // ),
                    //Divider(),
                  ],
                ),
              )
            ],
          ),
        ),
        //add to cart button
        bottomNavigationBar: ProductCartButton(
          product: widget.product,
        ),
      ),
    );
  }
}

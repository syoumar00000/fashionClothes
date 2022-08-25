import 'package:fashion/models/product.dart';
import 'package:fashion/providers/favorite-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteButton extends StatefulWidget {
  final Product product;
  const FavoriteButton({Key? key, required this.product}) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Consumer<FavoriteProvider>(builder: (
        context,
        favoriteState,
        child,
      ) {
        return Icon(
          !favoriteState.isFavorite(widget.product)
              ? Icons.favorite_border
              : Icons.favorite,
          color: favoriteState.isFavorite(widget.product)
              ? Colors.black
              : Colors.grey,
        );
      }),
      onPressed: () {
        setState(() {
          Provider.of<FavoriteProvider>(context, listen: false)
              .toggle(widget.product);
        });
      },
      color: Colors.grey,
      iconSize: 26,
    );
  }
}

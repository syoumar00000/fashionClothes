import 'package:fashion/screens/account/account-screen.dart';
import 'package:fashion/screens/wishlist/wishlist-screen.dart';
import 'package:flutter/material.dart';
import 'package:fashion/screens/cart/cart-screen.dart';
import 'package:fashion/screens/category/category-screen.dart';
import 'package:fashion/screens/home/home-screen.dart';
import 'package:fashion/widgets/navigation/cart-icon.dart';
import 'package:fashion/widgets/navigation/main-bottombar-item.dart';

class MainBottomBar extends StatefulWidget {
  final int currentIndex;
  const MainBottomBar({Key? key, this.currentIndex = 0}) : super(key: key);

  @override
  _MainBottomBarState createState() => _MainBottomBarState();
}

class _MainBottomBarState extends State<MainBottomBar>
    with AutomaticKeepAliveClientMixin<MainBottomBar> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
  }

  void onChange(int currentIndex) {
    setState(() {
      _currentIndex = currentIndex;
    });

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        switch (_currentIndex) {
          case 0:
            return const HomeScreen();
          case 1:
            return const WishListScreen();
          case 2:
            return const CartScreen();
          case 3:
            return const AccountScreen();
          default:
            return const HomeScreen();
        }
      }),
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MainBottomBarItem(
            index: 0,
            currentIndex: _currentIndex,
            icon: Image.asset(
              "assets/icons/home.png",
              width: 20,
              color: (_currentIndex == 0) ? Colors.black : Colors.grey,
            ),
            //Icon(Icons.home_outlined),
            title: "Home",
            onPressed: onChange,
          ),
          MainBottomBarItem(
            index: 1,
            currentIndex: _currentIndex,
            icon: Image.asset(
              "assets/icons/coeur.png",
              width: 15,
              color: (_currentIndex == 1) ? Colors.black : Colors.grey,
            ),
            //const Icon(Icons.favorite_border),
            title: "Favorite",
            onPressed: onChange,
          ),
          MainBottomBarItem(
            index: 2,
            currentIndex: _currentIndex,
            icon: CartIcon(
              color: (_currentIndex == 2) ? Colors.black : Colors.grey,
            ),
            title: "Cart",
            onPressed: onChange,
          ),
          MainBottomBarItem(
            index: 3,
            currentIndex: _currentIndex,
            icon: Image.asset(
              "assets/icons/utilisateur.png",
              width: 15,
              color: (_currentIndex == 3) ? Colors.black : Colors.grey,
            ),
            //const Icon(Icons.person_outline),
            title: "Account",
            onPressed: onChange,
          )
        ],
      ),
    );
  }
}

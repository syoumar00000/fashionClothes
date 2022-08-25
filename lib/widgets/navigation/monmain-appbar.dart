import 'package:fashion/providers/product-provider.dart';
import 'package:fashion/widgets/input/my-searchbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MonMainAppbar extends StatefulWidget implements PreferredSizeWidget {
  const MonMainAppbar({Key? key}) : super(key: key);

  @override
  State<MonMainAppbar> createState() => _MonMainAppbarState();

  @override
  Size get preferredSize => Size.fromHeight(150);
}

class _MonMainAppbarState extends State<MonMainAppbar> {
  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    double myWidth = MediaQuery.of(context).size.width;
    double myHeight = MediaQuery.of(context).size.height / 4;
    return Container(
      alignment: Alignment.topLeft,
      //color: Colors.white,
      height: myHeight,
      width: myWidth,
      child: Padding(
        padding:
            const EdgeInsets.only(top: 50.0, left: 10, right: 10, bottom: 10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: myHeight / 3.5,
                    width: myWidth / 2,
                    color: Colors.transparent,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Hi, Oumar",
                                style: TextStyle(fontSize: 18),
                              )),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Good Morning",
                                style: TextStyle(fontSize: 18),
                              )),
                        ]),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 17,
                    width: 17,
                    child: InkWell(
                      onTap: () {
                        Provider.of<ProductProvider>(context, listen: false)
                            .searchProduct(searchController.text);
                        Navigator.pushReplacementNamed(context, "/search");
                      },
                      child: Image.asset(
                        "assets/icons/rechercher.png",
                        width: 17,
                      ),
                    ),
                  ),
                  // IconButton(
                  //   icon: Icon(Icons.search_outlined),
                  //   onPressed: () {
                  //     Provider.of<ProductProvider>(context, listen: false)
                  //         .searchProduct(searchController.text);
                  //     Navigator.pushReplacementNamed(context, "/search");
                  //   },
                  // ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    height: 17,
                    width: 17,
                    child: InkWell(
                      onTap: () {
                        Provider.of<ProductProvider>(context, listen: false)
                            .searchProduct(searchController.text);
                        Navigator.pushReplacementNamed(
                            context, "/notifications");
                      },
                      child: Image.asset(
                        "assets/icons/cloche.png",
                        width: 17,
                      ),
                    ),
                  ),
                  // IconButton(
                  //   icon: Icon(Icons.notifications_outlined),
                  //   onPressed: () {
                  //     Provider.of<ProductProvider>(context, listen: false)
                  //         .searchProduct(searchController.text);
                  //     Navigator.pushReplacementNamed(context, "/notifications");
                  //   },
                  // ),
                  const SizedBox(
                    width: 3,
                  ),
                ],
              ),
              // MySearchBar(),
              Row(
                children: const <Widget>[
                  Text(
                    "Choose Your Style",
                    style: TextStyle(fontSize: 35),
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}

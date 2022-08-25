// ignore_for_file: prefer_const_constructors
import 'package:fashion/mockups/categories-mockup.dart';
import 'package:fashion/mockups/products-mockup.dart';
import 'package:fashion/models/product.dart';
import 'package:fashion/providers/category-provider.dart';
import 'package:fashion/providers/product-provider.dart';
import 'package:fashion/providers/promotion-provider.dart';
import 'package:fashion/screens/home/widgets/home-products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainTabBar extends StatefulWidget {
  const MainTabBar({Key? key}) : super(key: key);

  @override
  State<MainTabBar> createState() => _MainTabBarState();
}

class _MainTabBarState extends State<MainTabBar> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final promotionState =
        Provider.of<PromotionProvider>(context, listen: false);
    final categoryState = Provider.of<CategoryProvider>(context, listen: false);
    final productState = Provider.of<ProductProvider>(context, listen: false);

    //sort products by orderCount
    final _productsByOrders = [...productState.items];
    _productsByOrders.sort((a, b) => b.orderCount!.compareTo(a.orderCount!));
    //sort products by category
    /* final _productsByCategory = [...categoryState.items];
    _productsByCategory.sort((a,b)=>b.) */
    //sort products by most added to favorite
    final _productsByFavorites = [...productState.items];
    _productsByFavorites
        .sort((a, b) => b.favoriteCount!.compareTo(a.favoriteCount!));

    //women products filter
    final _featuredProducts = productState.items
        .where((element) => element.category!.id == 2)
        .toList()
        // .getRange(0, 4)
        .toList();
    //get all products
    final List<Product> _allArticles = productMockup.map((product) {
      //get product category from static category mockup data
      product.category = categoryMockup
          .firstWhere((category) => category.id == product.category!.id);
      return product;
    }).toList();

    //men products filter
    final _discountedProducts = productState.items
        .where((element) => element.category!.id == 1)
        .toList()
        //.getRange(0, 4)
        .toList();
    //children products filter
    final _childrenProducts = productState.items
        .where((element) => element.category!.id == 3)
        .toList()
        //.getRange(0, 4)
        .toList();

    //most ordered products filter
    //final _mostOrderedProducts = _productsByOrders.getRange(0, 4).toList();
    final _mostOrderedProducts = _productsByOrders.toList();

    //most added to favorite products filter
    //final _favoriteProducts = _productsByFavorites.getRange(0, 4).toList();
    final _favoriteProducts = _productsByFavorites.toList();
    TabController _tabController = TabController(length: 4, vsync: this);
    return
        //Container(
        //height: double.infinity,
        //MediaQuery.of(context).size.height + 50,
        //child:
        Column(
      children: [
        Container(
          child: Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
                labelPadding: const EdgeInsets.only(left: 20, right: 15),
                labelColor: Colors.black,
                controller: _tabController,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: CircleTabIndicator(color: Colors.black, radius: 4),
                tabs: const [
                  Tab(
                    text: "All Categories",
                  ),
                  Tab(
                    text: "Women",
                  ),
                  Tab(
                    text: "Men",
                  ),
                  Tab(
                    text: "Children",
                  ),
                ]),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, bottom: 10),
          height: MediaQuery.of(context).size.height,
          width: double.maxFinite,
          child: TabBarView(
              physics: ScrollPhysics(),
              controller: _tabController,
              children: [
                HomeProducts(
                  products: _allArticles,
                  onMorePress: () {},
                ),
                HomeProducts(
                  products: _featuredProducts,
                  onMorePress: () {},
                ),
                HomeProducts(
                  products: _discountedProducts,
                  onMorePress: () {},
                ),
                HomeProducts(
                  products: _childrenProducts,
                  onMorePress: () {},
                ),
              ]),
        )
      ],
    );
    // );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}

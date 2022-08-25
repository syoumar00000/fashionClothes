import 'package:flutter/material.dart';
import 'package:fashion/screens/about/about-screen.dart';
import 'package:fashion/screens/about/policy-screen.dart';
import 'package:fashion/screens/account/account-edit-screen.dart';
import 'package:fashion/screens/account/account-screen.dart';
import 'package:fashion/screens/address/address-search-screen.dart';
import 'package:fashion/screens/address/address-list-screen.dart';
import 'package:fashion/screens/authentication/signin-screen.dart';
import 'package:fashion/screens/authentication/signup-screen.dart';
import 'package:fashion/screens/cart/cart-screen.dart';
import 'package:fashion/screens/category/category-screen.dart';
import 'package:fashion/screens/credit-card/credit-card-form-screen.dart';
import 'package:fashion/screens/credit-card/credit-card-list-screen.dart';
import 'package:fashion/screens/faq/faq-screen.dart';
import 'package:fashion/screens/filter/filter-screen.dart';
import 'package:fashion/screens/home/home-screen.dart';
import 'package:fashion/screens/notification/notification-screen.dart';
import 'package:fashion/screens/order/order-list-screen.dart';
import 'package:fashion/screens/product/product-list-screen.dart';
import 'package:fashion/screens/support/support-screen.dart';
import 'package:fashion/screens/wishlist/wishlist-screen.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  "/about": (BuildContext context) => AboutScreen(),
  "/account": (BuildContext context) => AccountScreen(),
  "/account-edit": (BuildContext context) => AccountEditScreen(),
  "/category": (BuildContext context) => CategoryScreen(),
  "/address-list": (BuildContext context) => AddressListScreen(),
  "/address-search": (BuildContext context) => AddressSearchScreen(),
  "/cart": (BuildContext context) => CartScreen(),
  "/credit-card-list": (BuildContext context) => CreditCardListScreen(),
  "/credit-card-form": (BuildContext context) => CreditCardFormScreen(),
  "/faq": (BuildContext context) => FaqScreen(),
  "/filter": (BuildContext context) => FilterScreen(),
  "/home": (BuildContext context) => HomeScreen(),
  "/order-list": (BuildContext context) => OrderListScreen(),
  "/notifications": (BuildContext context) => NotificationScreen(),
  "/policy": (BuildContext context) => PolicyScreen(),
  "/search": (BuildContext context) => ProductListScreen(),
  "/signin": (BuildContext context) => SignInScreen(),
  "/signup": (BuildContext context) => SignUpScreen(),
  "/support": (BuildContext context) => SupportScreen(),
  "/wishlist": (BuildContext context) => WishListScreen(),
};

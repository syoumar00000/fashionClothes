import 'package:fashion/providers/address-provider.dart';
import 'package:fashion/providers/cart-provider.dart';
import 'package:fashion/providers/category-provider.dart';
import 'package:fashion/providers/customer-provider.dart';
import 'package:fashion/providers/faq-provider.dart';
import 'package:fashion/providers/favorite-provider.dart';
import 'package:fashion/providers/notification-provider.dart';
import 'package:fashion/providers/order-provider.dart';
import 'package:fashion/providers/payment-provider.dart';
import 'package:fashion/providers/product-provider.dart';
import 'package:fashion/providers/promotion-provider.dart';
import 'package:provider/provider.dart';

final providers = [
  ChangeNotifierProvider<AddressProvider>(create: (_) => AddressProvider()),
  ChangeNotifierProvider<CartProvider>(create: (_) => CartProvider()),
  ChangeNotifierProvider<CategoryProvider>(create: (_) => CategoryProvider()),
  ChangeNotifierProvider<CustomerProvider>(create: (_) => CustomerProvider()),
  ChangeNotifierProvider<FaqProvider>(create: (_) => FaqProvider()),
  ChangeNotifierProvider<FavoriteProvider>(create: (_) => FavoriteProvider()),
  ChangeNotifierProvider<OrderProvider>(create: (_) => OrderProvider()),
  ChangeNotifierProvider<NotificationProvider>(
      create: (_) => NotificationProvider()),
  ChangeNotifierProvider<PaymentProvider>(create: (_) => PaymentProvider()),
  ChangeNotifierProvider<ProductProvider>(create: (_) => ProductProvider()),
  ChangeNotifierProvider<PromotionProvider>(create: (_) => PromotionProvider()),
];

import 'package:fashion/configs/app-config.dart';
import 'package:fashion/providers/address-provider.dart';
import 'package:fashion/providers/category-provider.dart';
import 'package:fashion/providers/customer-provider.dart';
import 'package:fashion/providers/faq-provider.dart';
import 'package:fashion/providers/notification-provider.dart';
import 'package:fashion/providers/order-provider.dart';
import 'package:fashion/providers/payment-provider.dart';
import 'package:fashion/providers/product-provider.dart';
import 'package:fashion/providers/promotion-provider.dart';
import 'package:fashion/screens/onboarding/my-onboarding-screen.dart';
import 'package:fashion/styles/spacing-style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    //initialize app startup data
    //future for fake load time
    Future.delayed(const Duration(milliseconds: 3000), () async {
      Provider.of<AddressProvider>(context, listen: false).getAll();
      Provider.of<CategoryProvider>(context, listen: false).getAll();
      Provider.of<CustomerProvider>(context, listen: false).get();
      Provider.of<NotificationProvider>(context, listen: false).getAll();
      Provider.of<ProductProvider>(context, listen: false).getAll();
      Provider.of<PromotionProvider>(context, listen: false).getAll();
      Provider.of<FaqProvider>(context, listen: false).getAll();
      Provider.of<PaymentProvider>(context, listen: false)
          .getAllPaymentMethod();
      Provider.of<OrderProvider>(context, listen: false).getAll();

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MyOnboardingScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor.withAlpha(500),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Image.asset(
            kAppLogo, //located in lib/configs/app-config.dart
            width: 150,
          ),
          kSpaceH(2),
          Text(
            kAppTitle, //located in lib/configs/app-config.dart
            style: Theme.of(context)
                .textTheme
                .headline5
                ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          kSpaceH(4),
          const Spacer(),
          const LinearProgressIndicator(
            minHeight: 8,
          ),
        ],
      ),
    );
  }
}

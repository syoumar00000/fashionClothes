import 'package:fashion/screens/account/widgets/account-appbar.dart';
import 'package:flutter/material.dart';
import 'package:fashion/screens/account/widgets/profil-item.dart';
import 'package:fashion/styles/spacing-style.dart';
import 'package:fashion/widgets/navigation/main-bottombar.dart';
import 'package:ionicons/ionicons.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AccountAppBar(
        image: "assets/icons/utilisateur.png",
        username: "Oumar Sy",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            kSpaceH(1),
            ProfilItem(
              title: "Orders",
              icon: const Icon(Icons.list_alt),
              onTap: () => Navigator.pushNamed(context, "/order-list"),
            ),
            ProfilItem(
              title: "Wishlist",
              icon: Image.asset(
                "assets/icons/coeur.png",
                width: 20,
                //color: Colors.grey.shade400,
              ),
              //const Icon(Icons.favorite_outline),
              onTap: () => Navigator.pushNamed(context, "/wishlist"),
            ),
            ProfilItem(
              title: "Payment Cards",
              icon: const Icon(Icons.credit_card_outlined),
              onTap: () => Navigator.pushNamed(context, "/credit-card-form"),
            ),
            ProfilItem(
              title: "Link Paypal account",
              icon: const Icon(Ionicons.logo_paypal),
              onTap: () {},
            ),
            ProfilItem(
              title: "Adresses",
              icon: const Icon(Icons.near_me_outlined),
              onTap: () => Navigator.pushNamed(context, "/address-list"),
            ),
            ProfilItem(
              title: "Support",
              icon: const Icon(Icons.contact_support_outlined),
              onTap: () => Navigator.pushNamed(context, "/support"),
            ),
            ProfilItem(
              title: "FAQ",
              icon: Image.asset(
                "assets/icons/interrogatoire.png",
                width: 20,
                //color: Colors.grey.shade400,
              ),
              //const Icon(Icons.help_outline),
              onTap: () => Navigator.pushNamed(context, "/faq"),
            ),
            ProfilItem(
              title: "Policy",
              icon: const Icon(Icons.rule_outlined),
              onTap: () => Navigator.pushNamed(context, "/policy"),
            ),
            ProfilItem(
              title: "About",
              icon: Image.asset(
                "assets/icons/info-icon.png",
                width: 20,
                //color: Colors.grey.shade400,
              ),
              //const Icon(Icons.info_outline),
              onTap: () => Navigator.pushNamed(context, "/about"),
            ),
            ProfilItem(
              title: "Sign Out",
              icon: const Icon(Icons.logout),
              onTap: () => Navigator.pushNamed(context, "/signin"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const MainBottomBar(
        currentIndex: 3,
      ),
    );
  }
}

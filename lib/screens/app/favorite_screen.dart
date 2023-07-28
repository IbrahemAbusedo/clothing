import 'package:clothing/screens/app/widgets/favorite_product_item.dart';
import 'package:clothing/screens/app/widgets/screen_appbar.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize:  Size.fromHeight(60),
        child: ScreenAppBar(leadingIconVisible: false,title: 'Favorite'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
            child: GridView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsetsDirectional.only(bottom: 10),
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: (154 / 190),
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 18,
              ),
              children: const [
                 FavoriteProductItem(
                    image: ImageManager.shirt1Image,
                    imageTitle: 'Long Sleeve Shirts',
                    price: '\$165'),
                FavoriteProductItem(
                    image: ImageManager.shirt2Image,
                    imageTitle: 'Casual Henley Shirts',
                    price: '\$275'),
                FavoriteProductItem(
                    image: ImageManager.shirt3Image,
                    imageTitle: 'Curved Hem Shirts',
                    price: '\$100'),
                 FavoriteProductItem(
                    image: ImageManager.shirt4Image,
                    imageTitle: 'Casual Nolin',
                    price: '\$100'),
                 FavoriteProductItem(
                    image: ImageManager.shirt5Image,
                    imageTitle: 'Long Sleeve Shirts',
                    price: '\$165'),
                 FavoriteProductItem(
                    image: ImageManager.shirt6Image,
                    imageTitle: 'Long Sleeve Shirts',
                    price: '\$165'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

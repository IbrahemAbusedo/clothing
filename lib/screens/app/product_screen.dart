import 'package:clothing/constants.dart';
import 'package:clothing/screens/app/widgets/search_product_item.dart';
import 'package:flutter/material.dart';
import '../../routes/app_router.dart';
import '../../routes/screen_name.dart';
import 'widgets/search_field.dart';
import 'drawer/drawerClass.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.place_outlined, size: 13),
            Text(' 15/2 New Texas'),
          ],
        ),
        leading: IconButton(
            onPressed: () => _scaffoldKey.currentState?.openDrawer(),
            icon: const Icon(
              Icons.sort_rounded,
              size: 36,
            )),
        actions: const [
          Padding(
            padding: EdgeInsets.all(15),
            child: Icon(
              Icons.notifications,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      drawer: const DrawerClass(),
      body: ListView(
        padding: const EdgeInsets.only(right: 20, left: 20, top: 25),
        scrollDirection: Axis.vertical,
        children: [
          const SearchField(),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Recent searches',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                IconButton(
                  padding: EdgeInsets.zero,
                  visualDensity: const VisualDensity(
                      horizontal: VisualDensity.minimumDensity,
                      vertical: VisualDensity.minimumDensity),
                  icon: const Icon(Icons.arrow_forward_ios, size: 12),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          const Divider(
            height: 24,
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 22),
            child: Text(
              'Search results showing for “Shirt”',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          GridView(
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
            children: [
              const SearchProductItem(
                  image: ImageManager.shirt1Image,
                  imageTitle: 'Long Sleeve Shirts',
                  price: '\$165'),
              SearchProductItem(
                  onTap: () =>
                      AppRouter.goTo(screenName: ScreenName.itemScreen),
                  image: ImageManager.shirt2Image,
                  imageTitle: 'Casual Henley Shirts',
                  price: '\$275'),
              const SearchProductItem(
                  image: ImageManager.shirt3Image,
                  imageTitle: 'Curved Hem Shirts',
                  price: '\$100'),
              const SearchProductItem(
                  image: ImageManager.shirt4Image,
                  imageTitle: 'Casual Nolin',
                  price: '\$100'),
              const SearchProductItem(
                  image: ImageManager.shirt5Image,
                  imageTitle: 'Long Sleeve Shirts',
                  price: '\$165'),
              const SearchProductItem(
                  image: ImageManager.shirt6Image,
                  imageTitle: 'Long Sleeve Shirts',
                  price: '\$165'),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:clothing/constants.dart';
import 'package:clothing/screens/app/widgets/product_category.dart';
import 'package:clothing/screens/app/widgets/new_product_item.dart';
import 'package:flutter/material.dart';
import '../../routes/app_router.dart';
import '../../routes/screen_name.dart';
import 'widgets/search_field.dart';
import 'drawer/drawerClass.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _HomeScreenState extends State<HomeScreen> {
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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.vertical,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              'Explore',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20, bottom: 30),
            child: Text(
              'best Outfits for you',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),
          ),
          const SearchField(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 35),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 75,
              ),
              child: GridView(
                scrollDirection: Axis.horizontal,
                // padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 17,
                ),
                children: [
                  const ProductCategory(
                      image: ImageManager.dressImage,
                      imageTitle: StringManager.dress),
                  ProductCategory(
                    image: ImageManager.shirtImage,
                    imageTitle: StringManager.shirt,
                    onTap: () {
                      AppRouter.goTo(screenName: ScreenName.productScreen);
                    },
                  ),
                  const ProductCategory(
                      image: ImageManager.pantImage,
                      imageTitle: StringManager.pants),
                  const ProductCategory(
                      image: ImageManager.tShirtImage,
                      imageTitle: StringManager.tShirt),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'New Arrival',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  visualDensity: const VisualDensity(
                      horizontal: VisualDensity.minimumDensity,
                      vertical: VisualDensity.minimumDensity),
                ),
                child: const Text(
                  'See All',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                ),
                onPressed: () {},
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 190,
              ),
              child: GridView(
                scrollDirection: Axis.horizontal,
                // padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: (190 / 154),
                  crossAxisCount: 1,
                  mainAxisSpacing: 13,
                ),
                children: const [
                  ProductItem(
                      image: ImageManager.shirt1Image,
                      imageTitle: 'Long Sleeve Shirts',
                      price: '\$165'),
                  ProductItem(
                      image: ImageManager.shirt2Image,
                      imageTitle: 'Casual Henley Shirts',
                      price: '\$275'),
                  ProductItem(
                      image: ImageManager.shirt5Image,
                      imageTitle: 'Long Sleeve Shirts',
                      price: '\$165'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

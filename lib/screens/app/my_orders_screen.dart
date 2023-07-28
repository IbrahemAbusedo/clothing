import 'package:clothing/constants.dart';
import 'package:clothing/screens/app/widgets/my_cart_order.dart';
import 'package:clothing/screens/app/widgets/screen_appbar.dart';
import 'package:flutter/material.dart';
class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const PreferredSize(
        preferredSize:  Size.fromHeight(60),
        child: ScreenAppBar(title: 'My Orders',leadingIconVisible: false , bottomPadding: 0),
      ),
      body: ListView(
        children: [
          TabBar(
            labelColor: const Color(ColorManager.mainColor),
            indicatorColor: const Color(ColorManager.mainColor),
            indicatorWeight: 5,
            unselectedLabelColor: Colors.grey,
            padding: const EdgeInsets.only(right: 20 ,left: 20,top: 10, bottom:27),
            controller: _tabController,
            onTap: (int index) {
              setState(() {
                _tabController.index = index;
              });
            },
            tabs: const[
               Tab(text: 'Completed'),
               Tab(text: 'Cancelled'),
            ],
          ),
          IndexedStack(
            index: _tabController.index,
            children: [
              Visibility(
                visible: _tabController.index == 0,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: const [
                          MyCartOrder(
                            image: ImageManager.shirt2Image,
                            title: 'Henley Shirts',
                            subTitle: 250,
                            isMyOrdersScreen: true,
                            date: 'Today',
                          ),
                          MyCartOrder(
                            image: ImageManager.shirt4Image,
                            title: 'Casual Shirts',
                            subTitle: 145,
                            isMyOrdersScreen: true,
                            date: '20 Jan’2021',
                          ),
                          MyCartOrder(
                            image: ImageManager.shirt3Image,
                            title: 'Casual Nolin',
                            subTitle: 225,
                            isMyOrdersScreen: true,
                            date: '20 Jan’2021',
                          ),
                          MyCartOrder(
                            image: ImageManager.shirt5Image,
                            title: 'Casual Nolin',
                            subTitle: 225,
                            isMyOrdersScreen: true,
                            date: '20 Jan’2021',
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(height: 150),
                  ],
                ),
              ),
              Visibility(
                visible: _tabController.index == 1,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: const [
                          MyCartOrder(
                            image: ImageManager.shirt2Image,
                            title: 'Henley Shirts',
                            subTitle: 250,
                            isMyOrdersScreen: true,
                            date: 'Today',
                          ),
                          MyCartOrder(
                            image: ImageManager.shirt4Image,
                            title: 'Casual Shirts',
                            subTitle: 145,
                            isMyOrdersScreen: true,
                            date: '20 Jan’2021',
                          ),
                          MyCartOrder(
                            image: ImageManager.shirt3Image,
                            title: 'Casual Nolin',
                            subTitle: 225,
                            isMyOrdersScreen: true,
                            date: '20 Jan’2021',
                          ),
                          MyCartOrder(
                            image: ImageManager.shirt5Image,
                            title: 'Casual Nolin',
                            subTitle: 225,
                            isMyOrdersScreen: true,
                            date: '20 Jan’2021',
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(height: 150),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

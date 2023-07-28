import 'package:clothing/constants.dart';
import 'package:clothing/screens/app/widgets/pilling_info_row.dart';
import 'package:clothing/screens/app/widgets/pofile_item.dart';
import 'package:clothing/screens/app/widgets/screen_appbar.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: ScreenAppBar(leadingIconVisible: false,title: 'Profile', popUpMenuVisible: true),
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 230,
                  child: Image.asset(
                    ImageManager.profileBg, width: double.infinity,
                    fit: BoxFit.cover,),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 22,bottom: 4),
                  child: Text('Alex Nikiforov',style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),),
                ),
                const Text('alex@msn.com',style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      ProfileItem(icon: ImageManager.progressImage,iconName: 'Progress order',value: '10+'),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 9),
                        child: ProfileItem(icon: ImageManager.promoCodeImage,iconName: 'Promo-codes',value: '5'),
                      ),
                      ProfileItem(icon: ImageManager.reviewsImage,iconName: 'Reviews',value: '4.5K'),
                    ],
                  ),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding:  EdgeInsets.only(top: 49,left: 23,bottom: 16),
                    child:  Text('Personal Information',style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black12,
                        width: 0.6,
                      ),
                    ),
                    child: Column(
                      children: const [
                        PillingInfoRow(title: 'Name :                                                  ', cost: 'Chris Harison'),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 13),
                          child: PillingInfoRow(title: 'Email:                                             ', cost: 'chris@gmail.com'),
                        ),
                        PillingInfoRow(title: 'Location:                                                   ', cost: 'San Diego'),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 13),
                          child: PillingInfoRow(title: 'Zip Code:                                                          ', cost: '1200'),
                        ),
                        PillingInfoRow(title: 'Phone Number                        :', cost: '(+1) 5484 4757 84'),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const Positioned(
              top: 101,
              right: 130,
              left: 130,
              child: CircleAvatar(
                radius: 67,
                foregroundImage: AssetImage(ImageManager.personImage),
              ),
            ),
          ],
        )
    );
  }
}



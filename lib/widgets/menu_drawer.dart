import 'package:flutter/material.dart';
import 'package:solehub/core/constants/app_colors.dart';
import 'package:solehub/screens/auth/register_screen.dart';
import 'package:solehub/screens/wishlist/wishlist_screen.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.text,
      child: SafeArea(
        child: Padding(
            padding: EdgeInsets.only(left: 20, top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle
                  ),
                  height: 64,
                    width: 64,
                    child: Image.asset('assets/images/preview/profile.jpg', fit: BoxFit.cover)
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text('Hey', style: TextStyle(fontFamily: 'Airbnb Cereal', fontWeight: FontWeight.w500, fontSize: 20, color: AppColors.subText ),),
              Text('Somya Sharma', style: TextStyle(fontFamily: 'Airbnb Cereal', fontWeight: FontWeight.w500, fontSize: 24, color: AppColors.white ),),
        
              SizedBox(
                height: 40,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.person, color: AppColors.subText,),
                  title: const Text('Profile', style: TextStyle(fontFamily: 'Airbnb Cereal', fontWeight: FontWeight.w500, fontSize: 16, color: AppColors.white ),),
                  onTap: () {},
                ),
        
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.home_filled, color: AppColors.subText,),
                  title: const Text('home Page', style: TextStyle(fontFamily: 'Airbnb Cereal', fontWeight: FontWeight.w500, fontSize: 16, color: AppColors.white ),),
                  onTap: () {
                    Navigator.pushNamed(context, '/home');
                  },
                ),
        
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.shopping_cart, color: AppColors.subText,),
                  title: const Text('My Cart', style: TextStyle(fontFamily: 'Airbnb Cereal', fontWeight: FontWeight.w500, fontSize: 16, color: AppColors.white ),),
                  onTap: () {
                    Navigator.pushNamed(context, '/cart');
                  },
                ),
        
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.favorite_border_outlined, color: AppColors.subText,),
                  title: const Text('Favorite', style: TextStyle(fontFamily: 'Airbnb Cereal', fontWeight: FontWeight.w500, fontSize: 16, color: AppColors.white ),),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> WishlistScreen()));
                  },
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.local_shipping_outlined, color: AppColors.subText,),
                  title: const Text('Orders', style: TextStyle(fontFamily: 'Airbnb Cereal', fontWeight: FontWeight.w500, fontSize: 16, color: AppColors.white ),),
                  onTap: () {},
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.notifications_active_outlined, color: AppColors.subText,),
                  title: const Text('Notifications', style: TextStyle(fontFamily: 'Airbnb Cereal', fontWeight: FontWeight.w500, fontSize: 16, color: AppColors.white ),),
                  onTap: () {},
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  thickness: 1.2,
                  color: AppColors.subText,
                  endIndent: 100,
                ),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.logout, color: AppColors.subText,),
                  title: const Text('Sign Out', style: TextStyle(fontFamily: 'Airbnb Cereal', fontWeight: FontWeight.w500, fontSize: 16, color: AppColors.white ),),
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> RegisterScreen()));
                  },
                )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

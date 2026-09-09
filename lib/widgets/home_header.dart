import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Builder(
          builder: (context) {
            return IconButton(onPressed: (){
              Scaffold.of(context).openDrawer();
            }, icon: Icon(Icons.menu, size: 40,));
          }
        ),
        Spacer(),
        Column(
          children: [
            Text('Store location', style: TextStyle(fontFamily: 'Airbnb Cereal', fontWeight: FontWeight.w400, fontSize: 18),),
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.red,),
                Text('Mohali, Punjab', style: TextStyle(fontFamily: 'Airbnb Cereal', fontWeight: FontWeight.w500, fontSize: 16),),
              ],
            ),
          ],
        ),
        Spacer(),
        IconButton(onPressed: (){}, icon: Icon(Icons.shopping_bag_outlined, size: 40,))
      ],
    );
  }
}

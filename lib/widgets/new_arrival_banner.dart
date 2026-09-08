import 'package:flutter/material.dart';
import 'package:solehub/core/constants/app_colors.dart';


class NewArrivalBanner extends StatelessWidget {
  const NewArrivalBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('New Arrivals', style: TextStyle(fontFamily: 'Airbnb Cereal', fontWeight: FontWeight.w500, color: AppColors.text, fontSize: 16 ),),
            Spacer(),
            Text('See all', style: TextStyle(fontFamily: 'Airbnb Cereal', fontWeight: FontWeight.w400, color: AppColors.primary, fontSize: 16 ),),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('BEST CHOICE', style: TextStyle(fontFamily: 'Airbnb Cereal', fontWeight: FontWeight.w500, fontSize: 12, color: AppColors.primary,),),
                  Text('NIKE JORDAN', style: TextStyle(fontFamily: 'Ai  rbnb Cereal', fontWeight: FontWeight.w500, fontSize: 16, color: AppColors.text, height: 2)),
                  Text('493.00', style: TextStyle(fontFamily: 'Airbnb Cereal', fontWeight: FontWeight.w500, fontSize: 14, color: AppColors.text, height: 2)),
                ],
              ),
              Spacer(),
              Image.asset('assets/images/preview/Jordan.png')
            ],
          ),
        )
      ],
    );
  }
}

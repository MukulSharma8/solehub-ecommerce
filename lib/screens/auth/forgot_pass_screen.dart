import 'package:flutter/material.dart';
import 'package:solehub/core/constants/app_colors.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({super.key});

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreen();
}

class _ForgotPassScreen extends State<ForgotPassScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 108, left: 44, right: 44),
                  child: Column(
                    children: [
                      Text(
                        'Password Recovery',
                        style: TextStyle(
                          fontFamily: 'Airbnb Cereal',
                          fontWeight: FontWeight.w500,
                          fontSize: 28,
                          color: AppColors.text
                        ),
                      ),
                      Text(
                        "Please Enter your Email Address To Receive a Verification Code",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Airbnb Cereal',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: AppColors.subText
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Email Address', style: TextStyle(fontFamily: 'Airbnb Cereal', fontWeight: FontWeight.w500, fontSize: 16, color: AppColors.text)),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.white,
                          hintText: 'alissonbecker@gmail.com',
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(50)
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),

                    ],
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 54,
                        width: double.infinity,
                        child: ElevatedButton(onPressed: (){},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary
                          ),
                          child: Text('Continue', style: TextStyle(color: Colors.white, fontSize: 18),),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

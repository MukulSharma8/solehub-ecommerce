import 'package:flutter/material.dart';
import 'package:solehub/core/constants/app_colors.dart';

import '../../services/user_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}
class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool hidePass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  width: 247,
                  margin: EdgeInsets.only(top: 98, left: 44, right: 44),
                  child: Column(
                    children: [
                      Text(
                        'Create Account',
                        style: TextStyle(
                          fontFamily: 'Airbnb Cereal',
                          fontWeight: FontWeight.w500,
                          fontSize: 28,
                          color: AppColors.text
                        ),
                      ),
                      Text(
                        "Let's Create Account Together",
                        style: TextStyle(
                          fontFamily: 'Airbnb Cereal',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                            color: AppColors.subText
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text('Your Name', style: TextStyle(fontFamily: 'Airbnb Cereal', fontWeight: FontWeight.w500, fontSize: 16, color: AppColors.text),),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.white,
                          hintText: 'Alisson Becker',
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(50)
                          ),
                        ),
                      ),
                        SizedBox(
                          height: 20,
                        ),
                      Text('Email Address', style: TextStyle(fontFamily: 'Airbnb Cereal', fontWeight: FontWeight.w500, fontSize: 16, color: AppColors.text)),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: emailController,
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
                          height: 20,
                        ),
                      Text('Password', style: TextStyle(fontFamily: 'Airbnb Cereal', fontWeight: FontWeight.w500, fontSize: 16)),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: passwordController,
                          obscureText: hidePass,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColors.white,
                            hintText: 'password',
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(50)
                            ),
                            suffixIcon: IconButton(onPressed: (){
                              setState(() {
                                hidePass = !hidePass;
                              });
                            }, icon: Icon(hidePass ? Icons.visibility_off : Icons.visibility,))
                          ),
                        ),
                        SizedBox(
                          height: 30,
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
                        width: 335,
                        child: ElevatedButton(onPressed: () async {
                          if (nameController.text.isEmpty ||
                              emailController.text.isEmpty ||
                              passwordController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Please fill all fields"),
                              ),
                            );
                            return;
                          }
                          String? error = await UserService().register(
                            nameController.text,
                            emailController.text,
                            passwordController.text,
                          );
                          if (error == null) {
                            Navigator.pushReplacementNamed(
                              context,
                              '/login',
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(error),
                              ),
                            );
                          }
                        },
                          child: Text('Sign Up', style: TextStyle(color: Colors.white, fontSize: 18),),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 54,
                        width: 335,
                        child: ElevatedButton(onPressed: (){},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.white
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/icons/google_logo.png', height: 24, width: 24,),
                              SizedBox(width: 10,),
                              Text('Sign in with google', style: TextStyle(fontSize: 18),),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account?",
                            style: TextStyle(fontFamily: 'Airbnb Cereal', fontWeight: FontWeight.w400, color: AppColors.subText, fontSize: 15),),
                          GestureDetector(
                            onTap: (){Navigator.pushReplacementNamed(context, '/login');},
                            child: Text('Sign In',
                                style: TextStyle(fontFamily: 'Airbnb Cereal', fontWeight: FontWeight.w500, color: AppColors.text, fontSize: 15)),
                          )
                        ],
                      ),
                      // Text.rich(
                      //   TextSpan(
                      //     text: "Already have an account?",
                      //     style: TextStyle(fontFamily: 'Airbnb Cereal', fontWeight: FontWeight.w400, color: AppColors.subText, fontSize: 15),
                      //     children: [
                      //       TextSpan(
                      //         text: 'Sign In',
                      //         style: TextStyle(fontFamily: 'Airbnb Cereal', fontWeight: FontWeight.w500, color: AppColors.text, fontSize: 15)
                      //       )
                      //     ]
                      //   ),
                      // )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

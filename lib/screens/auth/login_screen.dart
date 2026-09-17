import 'package:flutter/material.dart';
import 'package:solehub/core/constants/app_colors.dart';
import '../../services/user_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool hidePass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
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
                              'Hello Again!',
                              style: TextStyle(
                                fontFamily: 'Airbnb Cereal',
                                fontWeight: FontWeight.w500,
                                fontSize: 28,
                                color: AppColors.text
                              ),
                            ),
                            Text(
                              "Welcome Back you've Been Missed!",
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
                              controller: emailController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: AppColors.white,
                                hintText: 'alissonbecker@gmail.com',
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
                              height: 20,
                            ),
                            Text('Password', style: TextStyle(fontFamily: 'Airbnb Cereal', fontWeight: FontWeight.w500, fontSize: 16, color: AppColors.text)),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: AppColors.white,
                                hintText: 'password',
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(50)
                                ),
                              ),
                            ),
                            SizedBox(height: 5,),
                            Row(
                              children: [
                                Spacer(),
                                Text('Recovery Password', style: TextStyle(fontFamily: 'Airbnb Cereal', fontWeight: FontWeight.w400, color: AppColors.subText),)
                              ],
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
                                if (emailController.text.isEmpty ||
                                    passwordController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Please fill all fields"),
                                    ),
                                  );
                                  return;
                                }
                                bool success = await UserService().login(
                                  emailController.text,
                                  passwordController.text,
                                );
                                if (success) {
                                  Navigator.pushReplacementNamed(
                                    context,
                                    '/home',
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Invalid email or password"),
                                    ),
                                  );
                                }
                              },
                                child: Text('Login', style: TextStyle(color: Colors.white, fontSize: 18),),
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Text.rich(
                TextSpan(
                    text: "Don't have an account?",
                    style: TextStyle(fontSize: 15, fontFamily: 'Airbnb Cereal', fontWeight: FontWeight.w400, color: AppColors.subText),
                    children: [
                      TextSpan(
                          text: 'Sign Up For Free',
                          style: TextStyle(fontSize: 15, fontFamily: 'Airbnb Cereal', fontWeight: FontWeight.w500, color: AppColors.text)
                      )
                    ]
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

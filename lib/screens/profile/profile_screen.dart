import 'package:flutter/material.dart';
import 'package:solehub/core/constants/app_colors.dart';
import 'package:solehub/core/constants/user_constants.dart';
import 'package:solehub/models/user.dart';
import 'package:solehub/services/user_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? user;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  Future<void> loadUser() async {
    try {
      User data = await UserService().getUser(
        UserConstants.userId,
      );

      setState(() {
        user = data;
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.text,
            size: 20,
          ),
        ),
        title: const Text(
          'Profile',
          style: TextStyle(
            fontFamily: 'Airbnb Cereal',
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.text,
          ),
        ),
      ),

      body: isLoading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : user == null
          ? const Center(
        child: Text(
          'Failed to load profile',
          style: TextStyle(
            fontFamily: 'Airbnb Cereal',
            color: AppColors.subText,
          ),
        ),
      )
          : SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [

            const SizedBox(height: 20),

            // Profile picture
            Container(
              width: 110,
              height: 110,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/preview/profile.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 14),

            // Name
            Text(
              user!.name,
              style: const TextStyle(
                fontFamily: 'Airbnb Cereal',
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.text,
              ),
            ),

            const SizedBox(height: 32),

            // Full Name
            _ProfileField(
              title: 'Full Name',
              value: user!.name,
              icon: Icons.person_outline,
            ),

            const SizedBox(height: 16),

            // Email
            _ProfileField(
              title: 'Email',
              value: user!.email,
              icon: Icons.email_outlined,
            ),

            const SizedBox(height: 16),

            // Password
            const _ProfileField(
              title: 'Password',
              value: '••••••••',
              icon: Icons.lock_outline,
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileField extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _ProfileField({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.subText,
            size: 22,
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Airbnb Cereal',
                    fontSize: 12,
                    color: AppColors.subText,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  value,
                  style: const TextStyle(
                    fontFamily: 'Airbnb Cereal',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColors.text,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
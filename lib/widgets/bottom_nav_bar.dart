import 'package:flutter/material.dart';
import 'package:solehub/core/constants/app_colors.dart';
import 'package:solehub/screens/wishlist/wishlist_screen.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int selectedIndex = 0;

  final Color backgroundColor = AppColors.white;
  final Color activeColor = AppColors.primary;
  final Color inactiveColor = AppColors.text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 105,
      child: Stack(
        clipBehavior: Clip.none,
        children: [

          // Bottom navigation background
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: ClipPath(
              clipper: BottomNavClipper(),
              child: Container(
                height: 90,
                color: backgroundColor,
              ),
            ),
          ),

          // Navigation icons
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SizedBox(
              height: 90,
              child: Row(
                children: [

                  // Home
                  Expanded(
                    child: _navItem(
                      onPressed: (){
                        setState(() {
                          selectedIndex =0;
                        });
                      },
                      index: 0,
                      icon: Icons.home_outlined,
                      activeIcon: Icons.home,
                    ),
                  ),

                  // Wishlist
                  Expanded(
                    child: _navItem(
                      onPressed: (){
                        setState(() {
                          selectedIndex = 1;
                        });
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> WishlistScreen()));
                        setState(() {
                          selectedIndex =0;
                        });
                      },
                      index: 1,
                      icon: Icons.favorite_border,
                      activeIcon: Icons.favorite,
                    ),
                  ),

                  // Empty space for center button
                  const SizedBox(width: 80),

                  // Notification
                  Expanded(
                    child: _navItem(
                      onPressed: (){
                        setState(() {
                          selectedIndex=3;
                        });
                      },
                      index: 3,
                      icon: Icons.notifications_none_outlined,
                      activeIcon: Icons.notifications,
                    ),
                  ),

                  // Profile
                  Expanded(
                    child: _navItem(
                      onPressed:(){
                        setState(() {
                          selectedIndex=4;
                        });
                      },
                      index: 4,
                      icon: Icons.person_outline,
                      activeIcon: Icons.person,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Center shopping bag button
          Positioned(
            top: -30,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = 2;
                  });
                },
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    color: activeColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.white,
                    size: 36,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _navItem({
    required int index,
    required IconData icon,
    required IconData activeIcon,
    required VoidCallback onPressed,
  }) {
    final bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: onPressed,
      child: Center(
        child: Icon(
          isSelected ? activeIcon : icon,
          size: 30,
          color: isSelected ? activeColor : inactiveColor,
        ),
      ),
    );
  }
}
class BottomNavClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();

    path.moveTo(0, 0);

    // Left side
    path.lineTo(size.width * 0.35, 0);

    // Curve going down toward center
    path.cubicTo(
      size.width * 0.40,
      0,
      size.width * 0.39,
      35,
      size.width * 0.46,
      40,
    );

    // Center bottom curve
    path.cubicTo(
      size.width * 0.48,
      55,
      size.width * 0.52,
      55,
      size.width * 0.54,
      40,
    );

    // Curve going back up
    path.cubicTo(
      size.width * 0.61,
      35,
      size.width * 0.60,
      0,
      size.width * 0.65,
      0,
    );

    // Right side
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
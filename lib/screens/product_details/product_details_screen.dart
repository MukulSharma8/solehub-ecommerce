import 'package:flutter/material.dart';
import 'package:solehub/core/constants/app_colors.dart';
import 'package:solehub/models/products.dart';
import 'package:solehub/core/routes/app_routes.dart';
import '../../core/constants/user_constants.dart';
import '../../services/cart_service.dart';

class ProductDetailScreen extends StatefulWidget {
  final Products product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantity = 1;
  int selectedGalleryIndex = 0;
  int selectedSizeIndex = 2; // "40" is selected by default in the design

  final List<String> gallery = [
    'assets/images/preview/Jordan.png',
    'assets/images/preview/Jordan.png',
    'assets/images/preview/Jordan.png',
  ];

  final List<String> sizes = ['38', '39', '40', '41', '42', '43'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Stack(
          children:[ Column(
            children: [
              _TopBar(),
              _HeroImage(image: widget.product.image,),
              Expanded(
                child: Column(
                  children: [
                    _DetailsCard(
                      name: widget.product.name,
                      price: widget.product.price,
                      description: widget.product.description,
                      gallery: widget.product.gallery,
                      sizes: widget.product.sizes,
                      selectedGalleryIndex: selectedGalleryIndex,
                      selectedSizeIndex: selectedSizeIndex,
                      onGalleryTap: (i) =>
                          setState(() => selectedGalleryIndex = i),
                      onSizeTap: (i) => setState(() => selectedSizeIndex = i),
                    ),
                  ],
                ),
              ),
            ],
          ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: BottomBar(
                product: widget.product,
                price: widget.product.price,
                selectedSize: widget.product.sizes[selectedSizeIndex],
                quantity: quantity,
              )
            ),
      ]
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _RoundIconButton(
            icon: Icons.arrow_back_ios_new_rounded,
            onTap: () => Navigator.pop(context),
          ),
          const Text(
            "Men's Shoes",
            style: TextStyle(
              fontFamily: 'Airbnb Cereal',
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: AppColors.text,
            ),
          ),
          _RoundIconButton(
            icon: Icons.shopping_bag_outlined,
            onTap: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
        ],
      ),
    );
  }
}

class _RoundIconButton extends StatelessWidget {
  const _RoundIconButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: const CircleBorder(),
      elevation: 1,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Icon(icon, size: 18, color: AppColors.text),
        ),
      ),
    );
  }
}

class _HeroImage extends StatelessWidget {
  final String image;
  const _HeroImage({required this.image});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: Image.network(
        image,
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => const Icon(
          Icons.sports_basketball_outlined,
          size: 100,
          color: Color(0xFF5B9EE1),
        ),
      ),
    );
  }
}

class _DetailsCard extends StatelessWidget {
  const _DetailsCard({
    required this.name,
    required this.description,
    required this.price,
    required this.gallery,
    required this.sizes,
    required this.selectedGalleryIndex,
    required this.selectedSizeIndex,
    required this.onGalleryTap,
    required this.onSizeTap,
  });

  final String name;
  final int price;
  final String description;
  final List<String> gallery;
  final List<int> sizes;
  final int selectedGalleryIndex;
  final int selectedSizeIndex;
  final ValueChanged<int> onGalleryTap;
  final ValueChanged<int> onSizeTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'BEST SELLER',
              style: TextStyle(
                fontFamily: 'Airbnb Cereal',
                fontWeight: FontWeight.w600,
                fontSize: 12,
                letterSpacing: 0.5,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              name,
              style: TextStyle(
                fontFamily: 'Airbnb Cereal',
                fontWeight: FontWeight.w500,
                fontSize: 22,
                color: AppColors.text,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '\$${price}',
              style: TextStyle(
                fontFamily: 'Airbnb Cereal',
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: AppColors.text,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: 'Airbnb Cereal',
                fontWeight: FontWeight.w400,
                fontSize: 13,
                height: 1.4,
                color: AppColors.subText,
              ),
            ),
            const SizedBox(height: 22),
            const Text(
              'Gallery',
              style: TextStyle(
                fontFamily: 'Airbnb Cereal',
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: AppColors.text,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: List.generate(gallery.length, (index) {
                final bool selected = index == selectedGalleryIndex;
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: GestureDetector(
                    onTap: () => onGalleryTap(index),
                    child: Container(
                      width: 56,
                      height: 56,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: selected
                            ? const Color(0xFF5B9EE1)
                            : const Color(0xFFF2F4F7),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Image.asset(
                        gallery[index],
                        errorBuilder: (context, error, stackTrace) => Icon(
                          Icons.image_outlined,
                          size: 20,
                          color: selected ? Colors.white : AppColors.subText,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 22),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Size',
                  style: TextStyle(
                    fontFamily: 'Airbnb Cereal',
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: AppColors.text,
                  ),
                ),
                Text(
                  'EU   US   UK',
                  style: TextStyle(
                    fontFamily: 'Airbnb Cereal',
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: AppColors.subText,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(sizes.length, (index) {
                final bool selected = index == selectedSizeIndex;
                return GestureDetector(
                  onTap: () => onSizeTap(index),
                  child: Container(
                    width: 36,
                    height: 36,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: selected
                          ? const Color(0xFF5B9EE1)
                          : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      sizes[index].toString(),
                      style: TextStyle(
                        fontFamily: 'Airbnb Cereal',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: selected ? Colors.white : AppColors.text,
                      ),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 26),
          ],
        ),
      ),
            ),
    );
  }
}
class BottomBar extends StatelessWidget {
  final int price;
  final Products product;
  final int selectedSize;
  final int quantity;

  const BottomBar({
    super.key,
    required this.product,
    required this.selectedSize,
    required this.quantity,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '\$${price}',
                  style: TextStyle(
                    fontFamily: 'Airbnb Cereal',
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: AppColors.subText,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  '\$849.69',
                  style: TextStyle(
                    fontFamily: 'Airbnb Cereal',
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: AppColors.text,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
          onPressed: () async {
            await CartService().addToCart(
              UserConstants.userId,
              product.id,
              selectedSize,
              quantity
            );
          ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
          content: Text("Added to cart"),
          ),
          );
          },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF5B9EE1),
              padding: const EdgeInsets.symmetric(
                horizontal: 28,
                vertical: 16,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 0,
            ),
            child: const Text(
              'Add To Cart',
              style: TextStyle(
                fontFamily: 'Airbnb Cereal',
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

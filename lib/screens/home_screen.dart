import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:in_1/providers/product_provider.dart';
import 'package:in_1/screens/orders_screen.dart';
import 'package:in_1/screens/product_detail_screen.dart';
import 'package:in_1/screens/profile_screen.dart';
import 'package:provider/provider.dart';
import '../providers/order_provider.dart';

// ================== HOME SCREEN ==================
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeContentPage(),
    const OrdersScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.article_outlined), label: "Orders"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: "Profile"),
        ],
      ),
    );
  }
}



class HomeContentPage extends StatelessWidget {
  const HomeContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Home",
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_cart_outlined, size: 24),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔍 Search bar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F7FA),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    hintText: "Search for items",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // 🏷 Categories
              SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    CategoryChip(label: "All", selected: true),
                    CategoryChip(label: "Electronics"),
                    CategoryChip(label: "Home Goods"),
                    CategoryChip(label: "Sports"),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // ⭐ Featured Items
              Text(
                "Featured Items",
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),

              Row(
                children: provider.relatedProducts.take(2).map((product) {
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                ProductDetailsScreen(product: product),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ItemCard(
                          imagePath: product.image,
                          title: product.name,
                          subtitle: product.description,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),

              // 📦 Popular Rentals
              Text(
                "Popular Rentals",
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),

              // First Row: 2 products
              Row(
                children: provider.relatedProducts.skip(2).take(2).map((product) {
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                ProductDetailsScreen(product: product),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ItemCard(
                          imagePath: product.image,
                          title: product.name,
                          subtitle: product.description,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),

              // Second Row: 1 product aligned under first product
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 24, // same width as one item in first row (16px padding + 8px inner)
                    child: GestureDetector(
                      onTap: () {
                        final product = provider.relatedProducts.skip(4).first;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProductDetailsScreen(product: product),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ItemCard(
                          imagePath: provider.relatedProducts.skip(4).first.image,
                          title: provider.relatedProducts.skip(4).first.name,
                          subtitle: provider.relatedProducts.skip(4).first.description,
                        ),
                      ),
                    ),
                  ),
                  // Empty space for alignment
                  const SizedBox(width: 16),
                ],
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

// 🏷 Category Chip Widget
class CategoryChip extends StatelessWidget {
  final String label;
  final bool selected;
  const CategoryChip({super.key, required this.label, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(
        label,
        style: GoogleFonts.inter(
          color: selected ? Colors.white : Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

// 🖼 Item Card Widget
class ItemCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;

  const ItemCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            height: 140,
            width: double.infinity,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: GoogleFonts.inter(
            fontSize: 12,
            color: Colors.grey[600],
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

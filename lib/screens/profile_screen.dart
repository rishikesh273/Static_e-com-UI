import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Profile",
          style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // User avatar
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/images/apartment1.png"), // placeholder image
            ),
            const SizedBox(height: 16),
            Text(
              "John Doe",
              style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 4),
            Text(
              "johndoe@example.com",
              style: GoogleFonts.inter(fontSize: 14, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 24),

            // Profile options
            Expanded(
              child: ListView(
                children: [
                  _profileOption(Icons.person_outline, "Account Details"),
                  _profileOption(Icons.shopping_bag_outlined, "Orders"),
                  _profileOption(Icons.settings_outlined, "Settings"),
                  _profileOption(Icons.help_outline, "Help & Support"),
                  _profileOption(Icons.logout, "Logout"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileOption(IconData icon, String label) {
    return ListTile(
      leading: Icon(icon, color: Colors.black87),
      title: Text(
        label,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }
}

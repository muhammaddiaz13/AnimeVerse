import 'package:flutter/material.dart';
import 'package:iklc_anime_verse/screens/detail_screen.dart';
import 'package:iklc_anime_verse/screens/favorite_screen.dart';
import 'package:iklc_anime_verse/screens/home_screen.dart';
import 'package:iklc_anime_verse/screens/profile_screen.dart';
import 'package:iklc_anime_verse/screens/signin_screen.dart';
import 'package:iklc_anime_verse/screens/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anime Verse',
      theme: ThemeData(
        fontFamily: 'Urbanist',
      ),
      home: const ScreenNavigatorMenu(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ScreenNavigatorMenu extends StatelessWidget {
  const ScreenNavigatorMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final screens = [
      {'name': '1. Sign In Screen', 'widget': const SignInScreen()},
      {'name': '2. Sign Up Screen', 'widget': const SignUpScreen()},
      {'name': '3. Home Screen', 'widget': const HomeScreen()},
      {'name': '4. Detail Screen', 'widget': const DetailScreen()},
      {'name': '5. Favorite Screen', 'widget': const FavoriteScreen()},
      {'name': '6. Profile Screen', 'widget': const ProfileScreen()},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Navigasi Tugas Lab 2'),
        backgroundColor: const Color(0xFF0F172A),
        foregroundColor: Colors.white,
      ),
      body: Container(
        color: const Color(0xFF0F172A),
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: screens.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1E293B),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => screens[index]['widget'] as Widget,
                    ),
                  );
                },
                child: Text(
                  screens[index]['name'] as String,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
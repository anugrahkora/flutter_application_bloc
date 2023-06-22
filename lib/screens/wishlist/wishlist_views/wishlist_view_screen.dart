import 'package:flutter/material.dart';

class WishlistViewScreen extends StatefulWidget {
  const WishlistViewScreen({super.key});

  @override
  State<WishlistViewScreen> createState() => _WishlistViewScreenState();
}

class _WishlistViewScreenState extends State<WishlistViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(title: const Text('Wishlist'),)
    );
  }
}
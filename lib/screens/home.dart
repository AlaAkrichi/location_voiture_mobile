import 'package:flutter/material.dart';
import 'package:location_voiture/widgets/BottomNav.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text("home page "),
      ),
      body: const Center(child: Text("home page ")),
      bottomNavigationBar: const BottomNavigation(index:0 ),
    );
}
}
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  final int index;

  const BottomNavigation({required this.index,super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: widget.index,
        onTap: (int tappedIndex){
          navigateToScreen(tappedIndex);
        },
        items: const   [
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "locateurs"),
        BottomNavigationBarItem(icon: Icon(Icons.car_rental), label: "Voiture"),
        BottomNavigationBarItem(icon: Icon(Icons.history_sharp), label: "Historique"),
      ],);
  }
  void navigateToScreen(int index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/'); // replace with your route
        break;
      case 1:
        Navigator.pushNamed(context, '/cars'); // replace with your route
        break;
      case 2:
        Navigator.pushNamed(context, '/locateurs'); // replace with your route
        break;
      // Add more cases for additional items if needed
      default:
        break;
    }
}
}
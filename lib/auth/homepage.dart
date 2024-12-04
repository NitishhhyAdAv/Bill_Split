import 'package:billsplit_apk/auth/billsplit/billsplit.dart';
import 'package:billsplit_apk/auth/billsplit/billsplit_homepage.dart';
import 'package:flutter/material.dart';


  

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const DashboardPage(),
    const AboutPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Text("📊"),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Text("👤"),
            label: "About",
          ),
        ],
      ),
    );
  }
}

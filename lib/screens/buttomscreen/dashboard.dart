import 'package:flutter/material.dart';
import 'package:mero_gahana/screens/buttomscreen/cartScreen.dart';
import 'package:mero_gahana/screens/buttomscreen/home.dart';
import 'package:mero_gahana/screens/buttomscreen/profile.dart';
import 'package:mero_gahana/screens/searchscreen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  static const String route = "dashboardScreen";


  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex=0;
  List<Widget>lstbottomscreen=[
    const HomeScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mero Gahana"),
        actions: [
          IconButton(
            onPressed: () {
              // method to show the search bar
              showSearch(
                context: context,
                // delegate to customize the search bar
                delegate: CustomSearchDelegate()
              );
            },
            icon: const Icon(Icons.search),
          )
        ],
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shop),label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle),label: 'Profile'),
        ],
        backgroundColor: Colors.amber,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: (index){
          setState(() {
            _selectedIndex=index;
          });
        },
      ),
        body: lstbottomscreen[_selectedIndex],
    );
  }
}
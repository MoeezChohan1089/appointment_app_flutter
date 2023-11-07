part of '../pages.dart';

class BottomNavigationBarUserScreen extends StatefulWidget {
  @override
  _BottomNavigationBarUserScreenState createState() =>
      _BottomNavigationBarUserScreenState();
}

class _BottomNavigationBarUserScreenState extends State {
  int _selectedIndex = 1;

  final _buildScreens = [
    ListTransactionUser(),
    MainPage(),
    ProfileUser(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildScreens[_selectedIndex],
      bottomNavigationBar: SnakeNavigationBar.color(
        behaviour: SnakeBarBehaviour.floating,
        currentIndex: _selectedIndex,
        elevation: 4,
        padding: const EdgeInsets.all(12),
        snakeViewColor: AppTheme.dangerColor,
        selectedItemColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        snakeShape: SnakeShape.circle,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_rounded),
            label: 'Transaction',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_accessibility_rounded),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

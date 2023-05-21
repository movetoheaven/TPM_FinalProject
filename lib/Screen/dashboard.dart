
import 'package:flutter/material.dart';
import 'package:fp_themeal/Screen/login.dart';
import 'package:fp_themeal/Screen/news.dart';
import 'package:fp_themeal/Screen/profile.dart';
import 'package:fp_themeal/Screen/time.dart';
import 'money.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    DashboardPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text('Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              final SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.remove('userId');
              Navigator.pop(context,
                MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2, // Number of columns
      children: [
        buildDashboardItem(
          context,
          Icons.newspaper,
          Colors.blue,
          'News',
          () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NewsListScreen()));
          },
        ),
        buildDashboardItem(
          context,
          Icons.money,
          Colors.green,
          'Money Exchange',
          () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CurrencyConverterMenu()));
          },
        ),
        buildDashboardItem(
          context,
          Icons.timelapse,
          Colors.red,
          'Convert Time',
          () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => TimeConverter()));
          },
        ),
      ],
    );
  }

  Widget buildDashboardItem(
    BuildContext context,
    IconData icon,
    Color color,
    String label,
    VoidCallback onTap,
  ) {
    return Container(
      padding: EdgeInsets.all(40),
      color: color,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 70,
              color: Colors.white,
            ),
            SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import './RequestAssistancePage.dart';
import './AssistanceHistoryPage.dart';

class UserDashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      drawer: Drawer(
        child: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.white, // Set drawer background color
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: Text('Your Name'), // Replace with user's name
                accountEmail: Text('user@example.com'), // Replace with user's email
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white, // Background color of the circular avatar
                  child: Stack(
                    children: <Widget>[
                      Icon(
                        Icons.safety_check, // Replace with your desired icon
                        size: 60.0, // Adjust the size as needed
                        color: Colors.black, // Adjust the color as needed
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Dashboard'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.history),
                title: Text('Assistance History'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AssistanceHistoryPage()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Log Out'),
                onTap: () {
                  // Log out logic goes here
                },
              ),
            ],
          ),
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2, // 2 columns
        childAspectRatio: 1.0, // Square aspect ratio
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          _buildDashboardItem(
            context,
            'Request Assistance',
            Icons.handshake_rounded,
                () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => RequestAssistancePage()));
            },
          ),
          _buildDashboardItem(
            context,
            'Assistance History',
            Icons.people_alt_rounded,
                () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AssistanceHistoryPage()));
            },
          ),
          // Add more dashboard items as needed
        ],
      ),
    );
  }

  Widget _buildDashboardItem(BuildContext context, String label, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 4.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: 64.0, color: Colors.black), // Set icon color to black
            SizedBox(height: 8.0),
            Text(
              label,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
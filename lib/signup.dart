import 'package:flutter/material.dart';
import './main.dart';
import 'llcTheme.dart'; // Import the custom theme
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.llcTheme,
      home: SignUp(),
    );
  }
}

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  int _currentPageIndex = 0; // Default to "User" tab

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Limitless Care'),
        backgroundColor: AppTheme.llcTheme.primaryColor,
      ),
      body: _buildPage(_currentPageIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex,
        onTap: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        unselectedItemColor: Colors.black, // Set unselected icon color to black
        selectedItemColor: Colors.green, // Set selected icon color to green
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'User',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business), // Change the icon for the service provider
            label: 'Service Provider',
          ),
        ],
      ),
    );
  }

  Widget _buildPage(int index) {
    if (index == 0) {
      return _buildUserPage();
    } else {
      return _buildServiceProviderPage();
    }
  }

  Widget _buildUserPage() {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background_image.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 16.0),
            Text(
              'The first step in improving your day to day life starts here.',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            SizedBox(height: 16.0),
            _buildTextField("Email", Icons.email),
            _buildTextField("Username", Icons.person),
            _buildTextField("Password", Icons.lock),
            _buildTextField("Confirm Password", Icons.lock),
            _buildTextField("Age", Icons.calendar_today),
            _buildGenderDropdown(),
            SizedBox(height: 16.0),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    AppTheme.llcTheme.primaryColor),
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 20, vertical: 12)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                )),
                textStyle: MaterialStateProperty.all(TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Row(
                      children: [
                        Icon(Icons.check, color: Colors.green),
                        SizedBox(width: 8.0),
                        Text('Sign Up successful',
                            style: TextStyle(color: Colors.green)),
                      ],
                    ),
                    backgroundColor: Colors.black,
                    duration: Duration(seconds: 3),
                  ),
                );
                // Add your signup logic here
              },
              child: Text('Sign Up'),
            ),
            SizedBox(height: 8.0),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
                // Navigate to login page or perform some action
              },
              child: Text(
                'Already have an account? Login',
                style: TextStyle(
                    color: AppTheme.llcTheme.primaryColor,
                    fontFamily: 'Arial',
                    fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceProviderPage() {
    return SingleChildScrollView(
      child: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Thank you for choosing to render your service available on Limitless care, and for taking part in making day to day life more bearable. Please fill in the following details to sign up as a service provider',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 16.0),
              _buildTextField("Email", Icons.email),
              _buildTextField("Company Name", Icons.abc_sharp),
              _buildTextField("Company Registration Number", FontAwesomeIcons.idCard),
              _buildTextField("Address", FontAwesomeIcons.locationPin),
              _buildTextField("Number of caregivers available", FontAwesomeIcons.hashtag),
              _buildTextField("Username", Icons.person),
              _buildTextField("Password", Icons.lock),
              _buildTextField("Confirm Password", Icons.lock),
              SizedBox(height: 16.0),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      AppTheme.llcTheme.primaryColor),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 20, vertical: 12)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  )),
                  textStyle: MaterialStateProperty.all(TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
                ),
                onPressed: () {
                  _showSignUpToast(); // Call the function to show the toast
                  // Add your signup logic here
                },
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSignUpToast() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.check, color: Colors.green),
            SizedBox(width: 8.0),
            Text('Sign Up successful for Service Provider',
                style: TextStyle(color: Colors.green)),
          ],
        ),
        backgroundColor: Colors.black,
        duration: Duration(seconds: 3),
      ),
    );
  }

  Widget _buildTextField(String label, IconData icon) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(
            icon,
            color: Colors.black, // Change the icon color to black
          ),
          filled: true,
          fillColor: Colors.transparent,
          hintStyle: AppTheme.llcTheme.inputDecorationTheme.hintStyle,
          enabledBorder: AppTheme.llcTheme.inputDecorationTheme.enabledBorder,
          focusedBorder: AppTheme.llcTheme.inputDecorationTheme.focusedBorder,
          labelStyle: AppTheme.llcTheme.inputDecorationTheme.labelStyle,
        ),
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppTheme.llcTheme.primaryColor,
            AppTheme.llcTheme.secondaryHeaderColor,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(24.0),
      ),
    );
  }

  Widget _buildGenderDropdown() {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppTheme.llcTheme.primaryColor,
            AppTheme.llcTheme.secondaryHeaderColor,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: 'Gender',
          prefixIcon: Icon(
            Icons.person_outline,
            color: Colors.black, // Change the icon color to black
          ),
          filled: true,
          fillColor: Colors.transparent,
          hintStyle: AppTheme.llcTheme.inputDecorationTheme.hintStyle,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24.0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24.0),
            borderSide: BorderSide.none,
          ),
          labelStyle: AppTheme.llcTheme.inputDecorationTheme.labelStyle
              ?.copyWith(color: Colors.black),
        ),
        items: ['Male', 'Female', 'Prefer not to say'].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(color: Colors.black), // Set text color to black
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          // Handle dropdown value change
        },
      ),
    );
  }
}

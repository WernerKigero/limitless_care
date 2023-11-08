import 'package:flutter/material.dart';
import 'llcTheme.dart'; // Import the custom theme

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.llcTheme,
      home: SignUp(),
    );
  }
}

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Limitless Care'),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background_image.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
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
                  backgroundColor: MaterialStateProperty.all(AppTheme.llcTheme.primaryColor),
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
                          Text('Sign Up successful', style: TextStyle(color: Colors.green)),
                        ],
                      ),
                      backgroundColor: Colors.white,
                      duration: Duration(seconds: 3),
                    ),
                  );
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

  Widget _buildTextField(String label, IconData icon) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(
            icon,
            color: AppTheme.llcTheme.primaryColor,
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
            AppColors.secondaryColor,
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
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: 'Gender',
          prefixIcon: Icon(
            Icons.person_outline,
            color: AppTheme.llcTheme.primaryColor,
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
          labelStyle: AppTheme.llcTheme.inputDecorationTheme.labelStyle,
        ),
        items: ['Male', 'Female', 'Prefer not to say'].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? newValue) {
          // Handle dropdown value change
        },
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppTheme.llcTheme.primaryColor,
            AppColors.secondaryColor,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(24.0),
      ),
    );
  }
}

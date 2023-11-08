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
        backgroundColor: AppColors
            .primaryColor, // Use the primary color as the app bar background
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background_image.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(16.0), // Padding for the whole content
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 16.0), // Space above the header

              Text(
                'The first step in improving your day to day life starts here.',
                style: TextStyle(
                  fontSize: 14, // Text size 14px
                ),
              ),
              SizedBox(height: 16.0), // Space below the header

              _buildTextField(context, "Email", Icons.email),
              _buildTextField(context, "Username", Icons.person),
              _buildTextField(context, "Password", Icons.lock),
              _buildTextField(context, "Confirm Password", Icons.lock),
              _buildTextField(context, "Age", Icons.calendar_today),
              _buildGenderDropdown(context),

              SizedBox(height: 16.0), // Space between fields and button

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
                    fontSize: 14, // Button text size 14px
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Button text color
                  )),
                ),
                onPressed: () {
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

  Widget _buildTextField(BuildContext context, String label, IconData icon) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0), // Margin between text fields
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(
            icon,
            color: AppTheme.llcTheme.primaryColor, // Icon color
          ),
          filled: true,
          fillColor: Colors.transparent,
          // Set this to transparent
          hintStyle: AppTheme.llcTheme.inputDecorationTheme.hintStyle,
          enabledBorder: AppTheme.llcTheme.inputDecorationTheme.enabledBorder,
          focusedBorder: AppTheme.llcTheme.inputDecorationTheme.focusedBorder,
          labelStyle: AppTheme.llcTheme.inputDecorationTheme.labelStyle,
        ),
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppTheme.llcTheme.primaryColor, // Deep blue
            AppColors.secondaryColor, // Use AppColors.secondaryColor here
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(
            24.0), // Apply the border radius here
      ),
    );
  }


  Widget _buildGenderDropdown(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0), // Margin for the gender dropdown
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: 'Gender',
          prefixIcon: Icon(
            Icons.person_outline,
            color: AppTheme.llcTheme.primaryColor, // Icon color
          ),
          filled: true,
          fillColor: Colors.transparent,
          // Set this to transparent
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
            AppTheme.llcTheme.primaryColor, // Deep blue
            AppColors.secondaryColor, // Use AppColors.secondaryColor here
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(
            24.0), // Apply the border radius here
      ),
    );
  }
}
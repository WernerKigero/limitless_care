import 'package:flutter/material.dart';
import './signup.dart';
import './UserDashboardPage.dart';
import './main.dart';
class AppColors {
  static const Color primaryColor = Color(0xFF3B5998); // Deep Blue
  static const Color secondaryColor = Color(0xFFCCCCCC); // Light Grey
  static const Color accentColor = Color(0xFF66A3D2); // Light Blue
  static const Color altsecond = Color(0xFFD700); // Dark Gold

// Add more colors as needed
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isUsernameFocused = false;
  bool _isPasswordFocused = false;

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page', style: TextStyle(color: AppColors.primaryColor)),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to Limitless Care',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: 20.0),

            _buildRoundedTextField('Username', _usernameController, _isUsernameFocused),
            SizedBox(height: 20.0),
            _buildRoundedTextField('Password', _passwordController, _isPasswordFocused, isPassword: true),

            SizedBox(height: 20.0),

            _buildRoundedButton(
              text: 'Login',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserDashboardPage()),
                );
                // Add login logic here
              },
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    // Add forgot password logic here
                  },
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(color: AppColors.primaryColor),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUp()),
                    );
                    // Add sign-up logic here
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: AppColors.primaryColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoundedTextField(String labelText, TextEditingController controller, bool isFocused, {bool isPassword = false}) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primaryColor,AppColors.secondaryColor],
        ),
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: TextField(
        controller: controller,
        style: TextStyle(color: isFocused ? AppColors.secondaryColor : AppColors.secondaryColor),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            fontSize: 24,
            color: isFocused ? Colors.black : Colors.black,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24.0),
            borderSide: BorderSide(color: Colors.black),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24.0),
            borderSide: BorderSide(color: isFocused ? Colors.black : Colors.black),
          ),
          border: InputBorder.none,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
        ),
        obscureText: isPassword,
        onChanged: (text) {
          setState(() {
            if (controller == _usernameController) {
              _isUsernameFocused = text.isNotEmpty;
            } else if (controller == _passwordController) {
              _isPasswordFocused = text.isNotEmpty;
            }
          });
        },
        onTap: () {
          setState(() {
            if (controller == _usernameController) {
              _isUsernameFocused = true;
            } else if (controller == _passwordController) {
              _isPasswordFocused = true;
            }
          });
        },
        onEditingComplete: () {
          setState(() {
            if (controller == _usernameController && _isUsernameFocused && controller.text.isEmpty) {
              _isUsernameFocused = false;
            } else if (controller == _passwordController && _isPasswordFocused && controller.text.isEmpty) {
              _isPasswordFocused = false;
            }
          });
        },
      ),
    );
  }

  Widget _buildRoundedButton({String text = '', void Function()? onPressed}) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
          ),
        ),
      ),
    );
  }
}

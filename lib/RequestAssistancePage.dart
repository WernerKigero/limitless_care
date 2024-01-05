import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RequestAssistancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Request Assistance'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 16.0),
            Text(
              'This is where you request daily assistance',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            _buildAssistanceTextField('Request Title', FontAwesomeIcons.heading),
            _buildMultilineTextField('Assistance Description', FontAwesomeIcons.comment, 5),
            _buildMultilineTextField('Additional Notes to Caregiver', FontAwesomeIcons.stickyNote, 5),
            _buildAssistanceTextField('Hours of Assistance Needed', FontAwesomeIcons.clock),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Add your logic for handling the button press
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(LlcTheme.primaryColor),
                padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 20, vertical: 12)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0), // Non-const constructor
                )),
                textStyle: MaterialStateProperty.all(TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )),
              ),
              child: Text('Request Assistance'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAssistanceTextField(String label, IconData icon) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      child: TextField(
        style: TextStyle(color: Colors.black), // Text color inside the text field
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(
            icon,
            color: Colors.black,
          ),
          filled: true,
          fillColor: LlcTheme.primaryColor, // Use primaryColor for the text field background
          hintStyle: LlcTheme.inputDecorationTheme.hintStyle,
          enabledBorder: LlcTheme.inputDecorationTheme.enabledBorder,
          focusedBorder: LlcTheme.inputDecorationTheme.focusedBorder,
          labelStyle: LlcTheme.inputDecorationTheme.labelStyle,
        ),
      ),
    );
  }

  Widget _buildMultilineTextField(String label, IconData icon, int maxLines) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      child: TextField(
        maxLines: maxLines,
        style: TextStyle(color: Colors.black), // Text color inside the text field
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(
            icon,
            color: Colors.black,
          ),
          filled: true,
          fillColor: LlcTheme.primaryColor, // Use primaryColor for the text field background
          hintStyle: LlcTheme.inputDecorationTheme.hintStyle,
          enabledBorder: LlcTheme.inputDecorationTheme.enabledBorder,
          focusedBorder: LlcTheme.inputDecorationTheme.focusedBorder,
          labelStyle: LlcTheme.inputDecorationTheme.labelStyle,
        ),
      ),
    );
  }
}

class LlcTheme {
  static const Color primaryColor = Color(0xFF01796F);
  static const Color secondaryColor = AppColors.lightGrey;

  static const InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    hintStyle: TextStyle(color: Colors.black),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(24.0)), // Non-const constructor
      borderSide: BorderSide(color: Colors.black),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(24.0)), // Non-const constructor
      borderSide: BorderSide(color: Colors.black),
    ),
    labelStyle: TextStyle(color: Colors.black),
  );
}

class AppColors {
  static const Color lightGrey = Color(0xFFCCCCCC);
}

void main() {
  runApp(MaterialApp(
    home: RequestAssistancePage(),
  ));
}

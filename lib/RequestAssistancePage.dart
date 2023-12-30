import 'package:flutter/material.dart';

import 'llcTheme.dart';
class RequestAssistancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Request Assistance'),
      ),
      body: Center(
        child: Text('This is the Request Assistance page.'),
      ),
    );
  }
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
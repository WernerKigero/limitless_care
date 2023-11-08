import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AssistanceHistoryPage(),
    );
  }
}

class ExpandableCard extends StatefulWidget {
  @override
  _ExpandableCardState createState() => _ExpandableCardState();
}

class _ExpandableCardState extends State<ExpandableCard> {
  bool isExpanded = false;

  void toggleExpansion() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: toggleExpansion,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF3B5998), // Deep blue
                  Color(0xFFCCCCCC), // Light Grey
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.0),
                topRight: Radius.circular(24.0),
              ),
            ),
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Title',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        if (isExpanded)
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24.0),
                bottomRight: Radius.circular(24.0),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Description: This is a sample description text that can be expanded and collapsed.',
                    style: TextStyle(fontSize: 14.0),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        // Request action
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color(0xFF4CAF50)), // Green
                      ),
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      label: Text(
                        'Request Again',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Edit request action
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color(0xFFFF5722)), // Red
                      ),
                      icon: Icon(Icons.edit, color: Colors.white),
                      label: Text(
                        'Edit Request',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Delete request action
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color(0xFFE91E63)), // Pink
                      ),
                      icon: Icon(Icons.delete, color: Colors.white),
                      label: Text(
                        'Delete Request',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class AssistanceHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assistance History'),
      ),
      body: ExpandableCard(),
    );
  }
}

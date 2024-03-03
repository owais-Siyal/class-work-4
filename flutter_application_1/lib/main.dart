import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _selectedOption = 'Shared'; // Default selected option

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Home'),
              SizedBox(height: 4),
              Row(
                children: [
                  _buildAppBarOption('Recent'),
                  _buildAppBarOption('Shared'),
                  _buildAppBarOption('Starred'),
                ],
              ),
            ],
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Alert message
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 104, 102, 102),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Your Dropbox is almost full. Upgrade now for more space.',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          // Handle close button action
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.0),
                // List of files/folders
                ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    buildFileItem('Python Programming', 'Feb 8, 2021'),
                    buildFileItem('VenD Interview Questions', 'Aug 16, 2020'),
                    buildFileItem('Wonder Tree', 'Nov 10, 2015'),
                    buildFileItem('programming_hub', 'Dec 26 ,2019'),
                    buildFileItem('MS Thesis- Spring 2018', 'Feb 7, 2018'),
                    buildFileItem('Applied prog', 'Nov 11, 2019'),
                    buildFileItem('Research Topics', 'June 01, 2019'),
                    buildFileItem('CA - Research', 'May 24, 2017'),
                    // Add more items here...
                  ],
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: ClipOval(
          child: Material(
            color: const Color.fromARGB(255, 2, 58, 103),
            child: InkWell(
              onTap: () {
                // Handle add button action
              },
              child: SizedBox(
                width: 56,
                height: 56,
                child: Icon(Icons.add, color: Colors.white),
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }

  Widget buildFileItem(String title, String date) {
    return Row(
      children: [
        // Image before each list item
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Image.asset(
            'images/logo.png', // Replace 'your_image.png' with your image asset path
            width: 24, // Adjust size as needed
            height: 24, // Adjust size as needed
          ),
        ),
        Expanded(
          child: ListTile(
            title: Text(title),
            subtitle: Text('Shared on $date'),
            trailing: PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Text('Option 1'),
                  value: 1,
                ),
                PopupMenuItem(
                  child: Text('Option 2'),
                  value: 2,
                ),
                // Add more options...
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAppBarOption(String option) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedOption = option;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          option,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight:
                _selectedOption == option ? FontWeight.bold : FontWeight.normal,
            decoration: _selectedOption == option
                ? TextDecoration.underline
                : TextDecoration.none,
          ),
        ),
      ),
    );
  }
}

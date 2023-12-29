// lib/profile_page.dart

import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://wallpapers.com/images/hd/black-girl-aesthetic-i0rq9rnk6muntue2.jpg',
              ),
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Riza Marjorie Marron',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8), // Adjusted the space here
                Text('rizamarjorie.marron@wvsu.edu.ph'),
              ],
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton.icon(
                  onPressed: () {
                    // Implement history functionality
                  },
                  icon: Icon(Icons.history, color: Colors.black),
                  label: Text('History', style: TextStyle(color: Colors.black)),
                ),
                SizedBox(height: 10),
                TextButton.icon(
                  onPressed: () {
                    // Implement downloads functionality
                  },
                  icon: Icon(Icons.file_download, color: Colors.black),
                  label: Text('My Downloads',
                      style: TextStyle(color: Colors.black)),
                ),
                SizedBox(height: 10),
                TextButton.icon(
                  onPressed: () {
                    // Implement settings functionality
                  },
                  icon: Icon(Icons.settings, color: Colors.black),
                  label:
                      Text('Settings', style: TextStyle(color: Colors.black)),
                ),
                SizedBox(height: 10),
                TextButton.icon(
                  onPressed: () {
                    // Implement feedbacks functionality
                  },
                  icon: Icon(Icons.feedback, color: Colors.black),
                  label:
                      Text('Feedback', style: TextStyle(color: Colors.black)),
                ),
                SizedBox(height: 10),
                TextButton.icon(
                  onPressed: () {
                    // Implement logout functionality
                  },
                  icon: Icon(Icons.exit_to_app, color: Colors.black),
                  label: Text('Logout', style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

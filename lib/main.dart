import 'package:demo/EditProfileScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AvootaProfileApp());
}

class AvootaProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Image.network(
          'https://avoota.com/public/assets/images/logo/avoota_logo8.webp', // Add Avoota logo here.
          height: 40,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Info Card
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        'https://i.imgur.com/BoN9kdC.png', // Placeholder profile image.
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi Username',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '90XXXXXXX',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Spacer(),
                    TextButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  EditProfileScreen()), // Replace with your EditProfileScreen widget
                                  
                        );

                        // Edit profile action
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
                      },
                      icon: Icon(Icons.edit, color: Colors.blue),
                      label: Text('Edit Profile'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // My Toolkit Section
              Text(
                'My Toolkit',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              ListTile(
                leading: Icon(Icons.book, color: Colors.black),
                title: Text('View/Manage Bookings'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigate to bookings
                },
              ),
              ListTile(
                leading: Icon(Icons.favorite_border, color: Colors.black),
                title: Text('Wishlist'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigate to wishlist
                },
              ),
              SizedBox(height: 20),

              // Payment Info Section
              Text(
                'Payment Info',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              ListTile(
                leading: Icon(Icons.credit_card, color: Colors.black),
                title: Text('Saved Cards'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigate to saved cards
                },
              ),
              ListTile(
                leading:
                    Icon(Icons.account_balance_wallet, color: Colors.black),
                title: Text('UPI'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigate to UPI settings
                },
              ),
              SizedBox(height: 20),

              // Settings Section
              Text(
                'Settings',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              ListTile(
                leading: Icon(Icons.devices, color: Colors.black),
                title: Text('Account & Devices'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigate to account settings
                },
              ),
              ListTile(
                leading: Icon(Icons.logout, color: Colors.black),
                title: Text('Logout'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Handle logout
                },
              ),
            ],
          ),
        ),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'My Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 2, // Since we are on the Profile page
        selectedItemColor: Colors.blue,
        onTap: (index) {
          // Handle tab switching
        },
      ),
    );
  }
}

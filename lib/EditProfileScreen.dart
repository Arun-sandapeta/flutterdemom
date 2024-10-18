import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  EditProfileScreenState createState() => EditProfileScreenState();
}

class EditProfileScreenState extends State<EditProfileScreen> {
  // Controllers for the text fields
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Back button functionality
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Profile Picture Section
            Center(
              child: Stack(
                alignment: Alignment.center,
                
                children: [

                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/profile_image.png'), // Placeholder image
                  ),
                  Positioned(
                    bottom: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            // Remove photo action
                          },
                          child: Text('Remove Photo', style: TextStyle(color: Colors.red)),
                        ),
                        TextButton(
                          onPressed: () {
                            // Upload new photo action
                          },
                          child: Text('Upload New'),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),

            // General Details Section
            Text('General Details', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),

            _buildTextField('Full Name', _fullNameController),
            Row(
              children: [
                Expanded(child: _buildTextField('Date of Birth', null, suffixIcon: Icons.calendar_today)),
                SizedBox(width: 10),
                Expanded(child: _buildDropdown('Gender')),
              ],
            ),
            _buildDropdown('Marital Status'),
            _buildDropdown('Nationality'),
            _buildDropdown('City'),
            _buildDropdown('State'),

            SizedBox(height: 20),

            // Contact Details Section
            Text('Contact Details', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            _buildTextField('Email', _emailController),
            _buildTextField('Phone Number', _phoneController),

            SizedBox(height: 30),

            // Save Changes Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Save changes action
                  print("Full Name: ${_fullNameController.text}");
                  print("Email: ${_emailController.text}");
                  print("Phone Number: ${_phoneController.text}");
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.red, // Button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Save Changes',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController? controller, {IconData? suffixIcon}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        items: ['Option 1', 'Option 2', 'Option 3'].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (newValue) {
          // Handle dropdown value change
        },
      ),
    );
  }
}

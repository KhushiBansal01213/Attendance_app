import 'package:attendance_app/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomizedTile extends StatelessWidget {
  final String name;
  final String email;
  final VoidCallback onCalendarTap;
  final VoidCallback onLocationTap;
  final VoidCallback onTap;

  // Constructor for the widget to accept dynamic data and callbacks
  CustomizedTile({
    required this.name,
    required this.email,
    required this.onCalendarTap,
    required this.onLocationTap,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 10, vertical: 5), // Add padding around each tile
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, // White background color for each tile
          borderRadius: BorderRadius.circular(10), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.black12, // Slight shadow for better visibility
              blurRadius: 6,
              offset: Offset(0, 2), // Shadow position
            ),
          ],
        ),
        child: ListTile(
          leading: CircleAvatar(
            radius: 20, // Size of the avatar
            backgroundColor: Colors.grey[200], // Background color of the avatar
            child: Icon(
              Icons.person, // The person icon
              size: 24, // Icon size
              color: Colors.grey, // Icon color
            ),
          ),
          title: Text(name),
          subtitle: Text(email),
          trailing: Row(
            mainAxisSize:
                MainAxisSize.min, // Ensures the row takes minimal space
            children: [
              // Calendar Icon
              IconButton(
                icon: Icon(Icons.calendar_today, color: Colors.grey),
                onPressed: onCalendarTap, // Use the callback for calendar tap
              ),

              // Location Icon
              IconButton(
                icon: Icon(Icons.location_on, color: AppColors.purple),
                onPressed: onLocationTap, // Use the callback for location tap
              ),
            ],
          ),
          onTap: onTap, // Use the callback for the main tile tap
        ),
      ),
    );
  }
}

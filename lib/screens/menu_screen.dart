import 'package:attendance_app/assets/fake_users.dart';
import 'package:attendance_app/screens/map.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:attendance_app/services/auth_services.dart';
import 'login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:attendance_app/utils/constants.dart';
import 'package:attendance_app/custom/customized_tiles.dart';

class MenuScreen extends StatelessWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    User? currentUser = _authService.getCurrentUser();
    final members = MockData.getFakeMembers(); // Access mock data directly

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ATTENDANCE',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.background,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: Text(
                  currentUser?.displayName ?? "User",
                ),
                accountEmail: Text(currentUser?.email ?? ""),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: ClipOval(
                    child: Image.network(
                      'https://avatars.githubusercontent.com/u/583231?v=4', // Replace with user's image link
                      fit: BoxFit.cover,
                      width: 90,
                      height: 90,
                    ),
                  ),
                ),
                decoration: const BoxDecoration(
                  color: Color(0xFF6C56F9), // Purple background color
                )),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Attendance',
                  style: TextStyle(color: AppColors.textColor)),
              onTap: () {
                // Navigate to Attendance Screen
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.directions_run), // Activity Icon
              title: Text("Activity"),
              onTap: () {
                // Handle activity navigation
              },
            ),
            ListTile(
              leading: Icon(Icons.schedule), // Timesheet Icon
              title: Text("Timesheet"),
              onTap: () {
                // Handle timesheet navigation
              },
            ),
            ListTile(
              leading: Icon(Icons.report), // Report Icon
              title: Text("Report"),
              onTap: () {
                // Handle report navigation
              },
            ),
            ListTile(
              leading: Icon(Icons.location_city), // Jobsite Icon
              title: Text("Jobsite"),
              onTap: () {
                // Handle jobsite navigation
              },
            ),
            ListTile(
              leading: Icon(Icons.group), // Team Icon
              title: Text("Team"),
              onTap: () {
                // Handle team navigation
              },
            ),
            ListTile(
              leading: Icon(Icons.time_to_leave), // Time Off Icon
              title: Text("Time Off"),
              onTap: () {
                // Handle time off navigation
              },
            ),
            ListTile(
              leading: Icon(Icons.schedule), // Schedules Icon
              title: Text("Schedules"),
              onTap: () {
                // Handle schedules navigation
              },
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: AppColors.errorColor,
              ),
              title: Text('Sign Out',
                  style: TextStyle(color: AppColors.textColor)),
              onTap: () async {
                await _authService.signOut();
                Get.offAll(LoginScreen());
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: members.length,
        itemBuilder: (context, index) {
          final member = members[index];
          return CustomizedTile(
            name: member['name'],
            email: member['email'],
            onCalendarTap: () {
              // Handle calendar icon tap
            },
            onLocationTap: () {
              // Pass the member ID to MapScreen
              Get.to(() => MapScreen(memberId: member['id']));
            },
            onTap: () {
              // Handle member tap
            },
          );
        },
      ),
    );
  }
}

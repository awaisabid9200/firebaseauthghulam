import 'package:firebase_auth/firebase_auth.dart';
import '../Static/Colors.dart';
import '../Static/TextStyleWidgets.dart';
import 'package:flutter/material.dart';
import '../Static/BottomNavbar.dart';
import '../Widgets/CustomProfileSetting.dart';
import 'LoginScreen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset('assets/icons/back.png')),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      'Profile',
                      style: AuthTextstyle.mediumTextStyle,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      final logoutConfirmed = await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Logout Confirmation'),
                            content: Text('Are you sure you want to logout?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(
                                      false); // Dismiss the dialog and return false
                                },
                                child: Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () async {
                                  await FirebaseAuth.instance.signOut();
                                  Navigator.of(context).pop(
                                      true); // Dismiss the dialog and return true
                                },
                                child: Text('Logout'),
                              ),
                            ],
                          );
                        },
                      );
                      if (logoutConfirmed == true) {
                        // User confirmed logout
                        // Navigate to the login screen or perform any other action
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      }
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/point.png'),
                        ),
                      ),
                      child: Icon(
                        Icons.login,
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              Stack(
                children: [
                  Container(
                    height: 180,
                    width: 190,
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    alignment: AlignmentDirectional.topEnd,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle, // Make the container circular
                      border: Border.all(color: AppColors.LandSColor),
                      image: DecorationImage(
                        image: AssetImage('assets/images/dummyprofile.jpg'),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 25,
                    top: 130,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(360),
                          color: AppColors.navcolor),
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  )
                ],
              ),
              Text(
                "Lucky Martin",
                style: AuthTextstyle.mediumTextStyle,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 49,
                width: 129,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      spreadRadius: 0,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'India',
                      style: AuthTextstyle.mediumTextStyle,
                    ),
                    Icon(
                      Icons.flag,
                      color: Colors.green,
                    )
                  ],
                ),
              ),
              CustomProfileList(
                imagePath: 'assets/icons/steps.png',
                customText: 'Account Setting',
              ),
              CustomProfileList(
                imagePath: 'assets/icons/steps.png',
                customText: 'Notification',
              ),
              CustomProfileList(
                imagePath: 'assets/icons/steps.png',
                customText: 'Support',
              ),
              CustomProfileList(
                imagePath: 'assets/icons/steps.png',
                customText: 'Privacy Policy',
              ),
              CustomProfileList(
                imagePath: 'assets/icons/steps.png',
                customText: 'Edit Account',
              ),
              CustomProfileList(
                imagePath: 'assets/icons/steps.png',
                customText: 'Appointment',
              ),
              CustomProfileList(
                imagePath: 'assets/icons/steps.png',
                customText: 'Cradit',
              ),
            ]),
          ),
        ),
      ),
      floatingActionButton: CustomFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomAppBar(), // Use your custom BottomAppBar
    );
  }
}

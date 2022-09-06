import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shuttle_track/screens/drawer_items/About.dart';
import 'package:shuttle_track/screens/drawer_items/Complaint.dart';
import 'package:shuttle_track/screens/drawer_items/People.dart';
import 'package:shuttle_track/screens/drawer_items/drawer_item.dart';
import 'package:shuttle_track/screens/login.dart';
import 'package:gap/gap.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            children: [
              headerWidget(),
              const Gap(20),
              DrawerItem(
                name: "CodeGrammer",
                icon: Icons.people,
                onpressed: () => onItemPressed(context, index: 0),
              ),
              const Gap(10),
              DrawerItem(
                name: "Complaints",
                icon: Icons.message,
                onpressed: () => onItemPressed(context, index: 1),
              ),
              const Gap(10),
              DrawerItem(
                name: "About",
                icon: Icons.info,
                onpressed: () => onItemPressed(context, index: 2),
              ),
              const Gap(10),
              DrawerItem(
                name: "Log out",
                icon: Icons.logout,
                onpressed: () => onItemPressed(context, index: 3),
              )
            ],
          ),
        ),
      ),
    );
  }

  void onItemPressed(BuildContext context, {required int index}) {
    Navigator.pop(context);
    switch (index) {
      case 0:
        Navigator.push(context,
            PageTransition(child: const People(), type: PageTransitionType.rightToLeft));
        break;
      case 1:
        Navigator.push(context,
            PageTransition(child: const Complaint(), type: PageTransitionType.rightToLeft));
        break;
      case 2:
        Navigator.push(
            context, 
            PageTransition(child: const About(), type: PageTransitionType.rightToLeft));
        break;
      case 3:
        Navigator.push(context,
            PageTransition(child: const LoginPage(), type: PageTransitionType.rightToLeft));
        break;
      default:
        Navigator.pop(context);
        break;
    }
  }

  Widget headerWidget() {
    return Row(
      children: [
        const CircleAvatar(
          backgroundColor: Color.fromARGB(255, 225, 225, 225),
          radius: 30,
          child: Icon(
            Icons.person,
            size: 50,
            color: Color.fromARGB(255, 172, 172, 172),
          ),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Codegrammer",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "codegrammer@email.com",
              style: TextStyle(fontSize: 14),
            )
          ],
        ),
      ],
    );
  }
}

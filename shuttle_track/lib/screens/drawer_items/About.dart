import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shuttle_track/screens/drawer_items/drawer_item.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            children: [
              headerWidget(),
              const Gap(20),
              DrawerItem(
                name: "Rate the app",
                icon: Icons.star,
                onpressed: () => onItemPressed(context, index:0)
              ),
              const Gap(10),
              DrawerItem(
                name: "Like us on Facebook",
                icon: Icons.facebook,
                onpressed: () => onItemPressed(context, index:0),
              ),
              const Gap(10),
              DrawerItem(
                name: "Legal",
                icon: Icons.house,
                onpressed: () => onItemPressed(context, index:0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void onItemPressed(BuildContext context, {required int index}) {
    Navigator.pop(context);
    switch (index) {
      // case 0:
      //   Navigator.push(
      //       context, MaterialPageRoute(builder: (context) => const People()));
      //   break;
      // case 1:
      //   Navigator.push(
      //       context, MaterialPageRoute(builder: (context) => const Complaint()));
      //   break;
      // case 2:
      //   Navigator.push(
      //       context, MaterialPageRoute(builder: (context) => const About()));
      //   break;
      // case 3:
      //   Navigator.push(
      //       context, MaterialPageRoute(builder: (context) => const LoginPage()));
      //   break;
      default:
        Navigator.pop(context);
        break;
    }
  }

Widget headerWidget() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: const [
      Text("About",
          style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold)),
      Gap(10),
      Text(
        "Version 1.0",
        style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 97, 96, 96)),
      )
    ],
  );
}

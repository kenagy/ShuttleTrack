import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shuttle_track/screens/bottomnavigation/Search.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      height: 140,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 244, 244, 244),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                PageTransition(child: const Search(), type: PageTransitionType.bottomToTop));
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration:  BoxDecoration(
                color: const Color.fromARGB(255, 233, 233, 233),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 212, 212, 212),
                      shape: BoxShape.circle
                    ),
                    child: const Icon(Icons.search, color: Colors.black, size: 28,),
                  ),
                  const SizedBox(width: 10,),
                  const Text("Where to?", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
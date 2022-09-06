import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shuttle_track/screens/bottom_bar.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 142, 233, 111),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.car_rental, size: 100),
              const Gap(30),
              //Hello
              const Text(
                "Hello",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34),
              ),
              const Gap(10),
              const Text(
                "Welcome Back!",
                style: TextStyle(fontSize: 20),
              ),
              const Gap(20),
              //email textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Email"),
                    ),
                  ),
                ),
              ),
              const Gap(15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Password"),
                    ),
                  ),
                ),
              ),
              const Gap(15),

              //sign in
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BottomBar()));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
              const Gap(10),

              //not a member? sign in
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Not a member?",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    " Register now",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

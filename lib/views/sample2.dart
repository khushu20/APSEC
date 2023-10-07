import 'package:ap_sec/res/colors.dart';
import 'package:ap_sec/res/text_constants.dart';
import 'package:ap_sec/views/sample_screen.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class SampleLoginScreen extends StatefulWidget {
  const SampleLoginScreen({super.key});

  @override
  State<SampleLoginScreen> createState() => _SampleLoginScreenState();
}

class _SampleLoginScreenState extends State<SampleLoginScreen> {
  final mobileNoController = TextEditingController();

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SampleScreen(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.08,
                  vertical: MediaQuery.of(context).size.height * 0.35,
                ),
                child: Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.35,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15),
                            child: TextField(
                              controller:
                                  userNameController, // Assign the controller
                              decoration: InputDecoration(
                                labelText: 'User ID',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: TextField(
                              controller: passwordController,
                              obscureText: true, // Assign the controller
                              decoration: InputDecoration(
                                labelText: 'Password',
                              ),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Color.fromARGB(221, 200, 204, 232),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Positioned(
                      right: MediaQuery.of(context).size.width * 0.35,
                      bottom: MediaQuery.of(context).size.height / 70,
                      child: Container(
                        height: 40,
                        width: 100,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Login",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                        color: Colors.amber,
                      ),
                    )
                  ],
                ),
              ),

              // Add other widgets below the centered container as needed.
            ],
          ),
        ),
      ],
    );
  }
}

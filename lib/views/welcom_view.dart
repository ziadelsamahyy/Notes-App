import 'package:flutter/material.dart';

import 'notes_view.dart';
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                    height: 600,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          height: 300,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/1.jpeg"),
                            ),
                          ),
                        ),
                        const Text(
                          "Start Now",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Poppins'),
                        ),
                        const SizedBox(
                          height:40,
                        ),
                        const Text(
                          "Developed  by ZiadElsamahy",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Poppins'),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return const NotesView();
                                }),
                              );
                            },
                            style: ButtonStyle(
                              fixedSize: MaterialStateProperty.all<Size>(
                                  const Size(200, 70)),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color.fromARGB(255, 121, 187, 241)),
                            ),
                            child: const Text(
                              'Start',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            )),
                      ],
                    )),
              ],
            ),
          )),
    );
  }
}

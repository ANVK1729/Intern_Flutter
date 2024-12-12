import 'package:flutter/material.dart';
import 'dart:ui';
import './signin_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Map<String, bool> _checkboxValues = {
    'English (US)': true,
    'Afrikaans': false,
    'Bahasa Indonesia': false,
  };
  String selectedLanguage = 'English (US)';

  final LinearGradient myGradient = const LinearGradient(
    colors: [
      Color(0xFFFF9A9E), // Warm pink
      Color(0xFFFAD0C4), // Light orange-pink
      Color(0xFFFBC2EB), // Soft purple
      Color(0xFFA18CD1), // Light violet
      Color(0xFF7F7FD5),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/bg_gradient.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 35,
                    height: 4,
                    margin: const EdgeInsets.only(top: 12),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 225, 223, 223),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      ),
                    ),
                    const SizedBox(width: 40),
                    const Text(
                      'Select your Language',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        color: Colors.white,
                      ),
                    ),
                  ]),
                  const SizedBox(height: 5),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      // padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(108, 30, 30, 30),
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: Column(children: [
                        ..._checkboxValues.keys.map((String key) {
                          return CheckboxListTile(
                            title: Text(
                              key,
                              style: const TextStyle(color: Colors.white),
                            ),
                            value: _checkboxValues[key],
                            onChanged: (bool? value) {
                              setModalState(() {
                                // Uncheck all other boxes
                                _checkboxValues.forEach((k, v) {
                                  _checkboxValues[k] = false;
                                });
                                // Check selected box
                                _checkboxValues[key] = value!;
                              });

                              // Update main screen
                              setState(() {
                                selectedLanguage = key;
                              });
                            },
                          );
                        }),
                      ]),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    String dds = String.fromCharCode(9660);

    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  color: Colors.black.withOpacity(0.2),
                ),
              ),
              Positioned(
                top: 50,
                right: 20,
                left: 20,
                child: TextButton(
                  onPressed: () {
                    _showModalBottomSheet(context);
                  },
                  child: Text(
                    '$selectedLanguage $dds',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    // width: double.infinity,
                    // height: 60, // Stretch to fill the parent width
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/Codama.png',
                            width: 200.0, height: 200.0)
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Center(
                    child: Text(
                      'CODAMA',
                      style: TextStyle(
                        fontSize: 60,
                        fontFamily: "Times New Roman",
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  // const SizedBox(height: 10),
                  const Text(
                    'Explore the world, embrace the journey!',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Times New Roman",
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 45),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 120,
                        height: 45.0,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            border: Border.all(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              width: 1.0,
                            ),
                            // gradient:
                            //     myGradient, // Use the gradient variable here
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) =>
                              //         const SignInPage(title: "Sign In"),
                              //   ),
                              // );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                            ),
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: "Times New Roman",
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      SizedBox(
                        width: 120,
                        height: 45.0,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            border: Border.all(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              width: 1.0,
                            ),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const SignInPage(title: "Sign In"),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors
                                    .transparent // Make button background transparent
                                ),
                            child: const Text(
                              'Sign In',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: "Times New Roman",
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          )),
    );
  }
}

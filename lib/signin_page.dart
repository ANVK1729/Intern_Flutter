import "package:flutter/material.dart";
import "dart:ui";

class SignInPage extends StatefulWidget {
  const SignInPage({super.key, required this.title});

  final String title;
  // bool _isPasswordVisible = false;

  @override
  // ignore: library_private_types_in_public_api
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _isPasswordVisible = false;
  bool _isPasswordFieldFocused = false;
  final TextEditingController _usernameController = TextEditingController();
  bool _hasUsernameText = false;

  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _passwordFocusNode.addListener(() {
      setState(() {
        _isPasswordFieldFocused = _passwordFocusNode.hasFocus;
      });
    });
    _usernameController.addListener(() {
      setState(() {
        _hasUsernameText = _usernameController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              // gradient: LinearGradient(
              //   begin: Alignment.centerLeft,
              //   end: Alignment.centerRight,
              //   colors: [
              //     Color.fromARGB(255, 20, 45, 45),
              //     Color.fromARGB(255, 30, 37, 46),
              //     Color.fromARGB(255, 35, 40, 54),
              //     Color.fromARGB(255, 20, 44, 64), // Second color
              //     Color.fromARGB(255, 20, 44, 64), // Second color
              //     Color.fromARGB(255, 20, 44, 64),
              //     Color.fromARGB(255, 20, 44, 64), // Second color
              //     Color.fromARGB(255, 20, 44, 64), // Second color
              //   ],
              // ),
              image: DecorationImage(
                image: AssetImage('assets/Signin_bg_3.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              color: Colors.black.withOpacity(0.2),
            ),
          ),
          Stack(
            children: [
              // Back Arrow button
              Positioned(
                top: 45.0,
                left: 0.0,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 25.0,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),

              // Middle Section
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Username TextField
                    TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 141, 219, 235)
                            .withOpacity(1.0),
                        // fillColor: Colors.transparent,
                        border: const OutlineInputBorder(),
                        labelText: 'Username, email or mobile number',
                        labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 113, 128, 148),
                          // fontWeight: FontWeight.bold,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          // borderSide: BorderSide(
                          //     color: Color.fromARGB(255, 83, 94, 108)),
                          borderRadius:
                              BorderRadius.all(Radius.circular(25.00)),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          // borderSide: BorderSide(
                          //     color: Color.fromARGB(221, 207, 202, 202)),
                          borderRadius:
                              BorderRadius.all(Radius.circular(25.00)),
                        ),
                        suffixIcon: _hasUsernameText
                            ? IconButton(
                                icon: const Icon(
                                  Icons.close,
                                  color: Color.fromARGB(221, 207, 202, 202),
                                ),
                                onPressed: () {
                                  _usernameController.clear();
                                },
                              )
                            : null,
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 16),

                    // Password TextField
                    TextField(
                      focusNode: _passwordFocusNode,
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(108, 30, 30, 30),
                        border: const OutlineInputBorder(),
                        labelText: 'Password',
                        labelStyle: const TextStyle(
                            color: Color.fromARGB(255, 113, 128, 148)),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 83, 94, 108)),
                          borderRadius:
                              BorderRadius.all(Radius.circular(25.00)),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(221, 207, 202, 202)),
                          borderRadius:
                              BorderRadius.all(Radius.circular(25.00)),
                        ),
                        suffixIcon: _isPasswordFieldFocused
                            ? IconButton(
                                icon: Icon(
                                  _isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color:
                                      const Color.fromARGB(221, 207, 202, 202),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isPasswordVisible = !_isPasswordVisible;
                                  });
                                },
                              )
                            : null,
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 20),

                    // Signin Button
                    SizedBox(
                      width: double.infinity,
                      height: 50.0, // Stretch to fill the parent width
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            backgroundColor:
                                const Color.fromARGB(255, 255, 255, 255),
                            elevation: 10 // Background color
                            ),
                        child: const Text('Sign In',
                            style: TextStyle(
                              fontFamily: "Times New Roman",
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 45, 92, 175),
                            )),
                      ),
                    ),
                  ],
                ),
              ),

              // Bottom Section
              if (!isKeyboardVisible)
                Positioned(
                  bottom: 125.0,
                  left: 90.0,
                  child: Row(
                    children: [
                      // Create Account Inkwell
                      InkWell(
                        onTap: () {},
                        child: const Text(
                          'Create Account',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Times New Roman",
                              fontSize: 15.0),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Container(
                        width: 1,
                        height: 30,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 15),

                      // Forgot Password Inkwell
                      InkWell(
                        onTap: () {},
                        child: const Text(
                          'Forgot Password',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Times New Roman",
                              fontSize: 15.0),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

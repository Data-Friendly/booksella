import 'package:booksella/screens/sign_in_screen.dart';
import 'package:booksella/widgets/text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  bool _isLoading = false;
  final _auth = FirebaseAuth.instance;
  final formkeySignUp = GlobalKey<FormState>();
  final FocusNode fullNameFocusNode = FocusNode();
  final FocusNode userInfoFocusNode = FocusNode();
  final FocusNode addressFocusNode = FocusNode();
  final FocusNode emailAddFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();
  TextEditingController fullNametextEditingController = TextEditingController();
  TextEditingController userInfoEditingController = TextEditingController();
  TextEditingController addressTextEditingController = TextEditingController();
  TextEditingController emailAddTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingcontroller = TextEditingController();
  TextEditingController confirmPasswordTextEditingController =
      TextEditingController();
  @override
  void initState() {
    fullNameFocusNode.addListener(() {
      callSetsState();
    });
    userInfoFocusNode.addListener(() {
      callSetsState();
    });
    addressFocusNode.addListener(() {
      callSetsState();
    });
    emailAddFocusNode.addListener(() {
      callSetsState();
    });
    passwordFocusNode.addListener(() {
      callSetsState();
    });
    confirmPasswordFocusNode.addListener(() {
      callSetsState();
    });
    super.initState();
  }

  callSetsState() {
    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    fullNameFocusNode.dispose();
    userInfoFocusNode.dispose();
    addressFocusNode.dispose();
    emailAddFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  //validate and Sign up
  void validateAndSignUp() async {
    UserCredential userCread;
    setState(() {
      _isLoading = true;
    });
    if (formkeySignUp.currentState!.validate()) {
      try {
        userCread = await _auth.createUserWithEmailAndPassword(
            email: emailAddTextEditingController.text,
            password: passwordTextEditingcontroller.text);

        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCread.user!.uid)
            .set({
          'fullname': fullNametextEditingController.text,
          'phone-no.': userInfoEditingController.text,
          'address': addressTextEditingController.text,
          'email': emailAddTextEditingController.text,
        });
        setState(() {
          _isLoading = false;
        });
      } catch (error) {
        print(error.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: Container(
        color: const Color.fromRGBO(0, 176, 135, 10),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(screenWidth * 0.2, 0, 0, 0),
              child: Text(
                'Already Have an Account?',
                style: GoogleFonts.lato(
                    fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: _isLoading
                    ? const CircularProgressIndicator()
                    : Text(
                        'SignIn',
                        style: GoogleFonts.lato(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ))
          ],
        ),
      ),
      backgroundColor: const Color.fromRGBO(248, 248, 248, 1),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.055),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, screenHeight * 0.04, 0, 0),
                // height: screenHeight * 0.1,
                width: double.infinity,
                // color: Colors.green,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                          size: 25,
                        )),
                    Column(
                      children: [
                        Text(
                          'Create Account',
                          style: GoogleFonts.lato(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Text(
                          'Please fill the input below here',
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              // form
              Container(
                margin: EdgeInsets.fromLTRB(0, screenHeight * 0.03, 0, 0),
                width: screenWidth * 0.85,
                child: Form(
                    key: formkeySignUp,
                    child: Column(children: [
                      InputTextFormField(
                          'Fullname',
                          const Icon(Icons.account_box_outlined),
                          fullNameFocusNode,
                          false,
                          fullNametextEditingController, (value) {
                        if (value!.length < 3) {
                          return 'Please provide username with length more than 3';
                        }
                        return null;
                      }),
                      SizedBox(
                        height: screenHeight * 0.013,
                      ),
                      InputTextFormField(
                          'userInfo',
                          const Icon(Icons.phone_android),
                          userInfoFocusNode,
                          false,
                          userInfoEditingController, (value) {
                        String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                        RegExp regExp = RegExp(pattern);
                        if (value!.isEmpty) {
                          return 'Please enter mobile number';
                        } else if (!regExp.hasMatch(value as String)) {
                          return 'Please enter valid mobile number';
                        }
                        return null;
                      }),
                      SizedBox(
                        height: screenHeight * 0.013,
                      ),
                      InputTextFormField(
                          'Address',
                          const Icon(Icons.location_pin),
                          addressFocusNode,
                          false,
                          addressTextEditingController, (value) {
                        if (value!.isEmpty || value.length < 6) {
                          return 'Please provide a Valid Address';
                        }
                        return null;
                      }),
                      SizedBox(
                        height: screenHeight * 0.013,
                      ),
                      InputTextFormField(
                          'Email Address',
                          const Icon(Icons.mail_outline),
                          emailAddFocusNode,
                          false,
                          emailAddTextEditingController, (value) {
                        if (value!.isEmpty || !value.contains('@')) {
                          return 'Invalid email!';
                        }
                        return null;
                      }),
                      SizedBox(
                        height: screenHeight * 0.013,
                      ),
                      InputTextFormField(
                          'Password',
                          const Icon(Icons.lock_outline),
                          passwordFocusNode,
                          true,
                          passwordTextEditingcontroller, (value) {
                        if (value!.length < 6) {
                          return 'Enter a password with 6+ character';
                        }
                        return null;
                      }),
                      SizedBox(
                        height: screenHeight * 0.013,
                      ),
                      InputTextFormField(
                          'ConfirmPassword',
                          const Icon(Icons.lock_outline),
                          confirmPasswordFocusNode,
                          true,
                          confirmPasswordTextEditingController, (value) {
                        if (value != passwordTextEditingcontroller.text) {
                          return 'Passwords do not match!';
                        }
                        return null;
                      })
                    ])),
              ),
              GestureDetector(
                onTap: () {
                  validateAndSignUp();
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, screenHeight * 0.03, 0, 0),
                  height: screenHeight * 0.07,
                  width: screenWidth * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.orange[900],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      'SignUp',
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

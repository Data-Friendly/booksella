import 'package:booksella/screens/sign_out_screen.dart';
import 'package:booksella/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final formkey = GlobalKey<FormState>();
  final FocusNode emailfocusNode = FocusNode();
  final FocusNode passwordfocusNode = FocusNode();
  final TextEditingController emailAddress = TextEditingController();
  final TextEditingController password = TextEditingController();

  //init state
  @override
  void initState() {
    emailfocusNode.addListener(() {
      setState(() {});
    });
    passwordfocusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  //validate and Sign In
  void validateAndSignIn() {
    formkey.currentState!.validate();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailfocusNode.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            color: Color.fromRGBO(0, 176, 135, 10),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40))),
        height: screenHeight * 0.26,
        width: double.infinity,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                child: Center(
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(screenHeight * 0.1,
                            screenHeight * 0.002, screenWidth * 0.023, 0),
                        child: const CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 12,
                          backgroundImage:
                              AssetImage('assets/images/download.png'),
                        ),
                      ),
                      Text(
                        'SignIn with Google',
                        style: GoogleFonts.lato(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                margin: EdgeInsets.fromLTRB(0, screenHeight * 0.04, 0, 0),
                height: screenHeight * 0.07,
                width: screenWidth * 0.8,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, screenHeight * 0.06, 0, 0),
              height: screenHeight * 0.07,
              width: screenWidth * 0.8,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(screenWidth * 0.12, 0, 0, 0),
                    child: Text(
                      'Dont Have an Account?',
                      style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => const SignOutScreen()));
                      },
                      child: Text(
                        'SignUp',
                        style: GoogleFonts.lato(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
      backgroundColor: const Color.fromRGBO(248, 248, 248, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Column(
                  children: [
                    Container(
                        margin:
                            EdgeInsets.symmetric(vertical: screenHeight * 0.06),
                        // color: Colors.grey,
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  screenWidth * 0.03, 0, 0, 0),
                              child: Text(
                                'Hello welcome!',
                                style: GoogleFonts.lato(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(screenWidth * 0.03,
                                  screenHeight * 0.013, 0, 0),
                              child: Text(
                                'Please Sign In to Continue',
                                style: GoogleFonts.lato(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[700]),
                              ),
                            ),
                          ],
                        )),
                    Container(
                      height: screenHeight * 0.35,
                      //0.26
                      margin: EdgeInsets.fromLTRB(0, screenHeight * 0.04, 0, 0),
                      child: Form(
                          key: formkey,
                          child: Column(
                            children: [
                              InputTextFormField(
                                  'Email',
                                  const Icon(Icons.mail_outline),
                                  emailfocusNode,
                                  false,
                                  emailAddress, (value) {
                                if (value!.isEmpty || !value.contains('@')) {
                                  return 'Invalid email!';
                                }
                                return null;
                              }),
                              SizedBox(
                                height: screenHeight * 0.02,
                              ),
                              InputTextFormField(
                                  'Password',
                                  const Icon(Icons.lock_outline),
                                  passwordfocusNode,
                                  true,
                                  password, (value) {
                                if (value!.length < 6) {
                                  return 'Enter a password with 6+ character';
                                }
                                return null;
                              }),
                              Container(
                                  margin: EdgeInsets.fromLTRB(
                                      0, screenHeight * 0.01, 0, 0),
                                  width: double.infinity,
                                  alignment: Alignment.bottomRight,
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Forgot your Password?',
                                      style: GoogleFonts.lato(
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromRGBO(
                                            0, 176, 135, 10),
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  )),
                            ],
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        validateAndSignIn();
                      },
                      child: Container(
                        margin:
                            EdgeInsets.fromLTRB(0, screenHeight * 0.03, 0, 0),
                        height: screenHeight * 0.07,
                        width: screenWidth * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.orange[900],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            'LogIn',
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
            ],
          ),
        ),
      ),
    );
  }
}

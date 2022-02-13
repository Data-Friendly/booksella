import 'package:booksella/providers/book_provider.dart';
import 'package:booksella/providers/cart_provider.dart';
import 'package:booksella/providers/order_provider.dart';
import 'package:booksella/screens/authenticate_screen.dart';
import 'package:booksella/screens/cart_screen.dart';
import 'package:booksella/screens/home_screen.dart';
import 'package:booksella/screens/order_screen.dart';
import 'package:booksella/screens/sign_in_screen.dart';
// import 'package:booksella/screens/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
// import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => BookData(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Order(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.grey,
          appBarTheme:
              const AppBarTheme(color: Color.fromRGBO(238, 238, 238, 1)),
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (ctx, snapShot) {
            if (snapShot.hasData) {
              return HomeScreen();
            }
            return const AuthenticateScreen();
          },
        ),
        routes: {
          CartScreen.routeName: (ctx) => const CartScreen(),
          OrderScreen.routeName: (ctx) => const OrderScreen(),
          // UserProfile.routeName: (ctx) => const UserProfile(),
        },
      ),
    );
  }
}

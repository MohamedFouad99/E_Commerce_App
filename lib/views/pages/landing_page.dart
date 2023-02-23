import 'package:e_commerce_app/controllers/auth_controller.dart';
import 'package:e_commerce_app/services/auth.dart';
import 'package:e_commerce_app/views/pages/auth_page.dart';
import 'package:e_commerce_app/views/pages/botton_navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<User?>(
        stream: auth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final user = snapshot.data;
            if (user == null) {
              return ChangeNotifierProvider<AuthController>(
                  create: (_) => AuthController(auth: auth),
                  child: const AuthPage());
            }
            return const BottonNavBar();
          }
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}

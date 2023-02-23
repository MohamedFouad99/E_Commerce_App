// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_field

import 'package:e_commerce_app/controllers/auth_controller.dart';
import 'package:e_commerce_app/services/auth.dart';
import 'package:e_commerce_app/utilities/enums.dart';
import 'package:e_commerce_app/utilities/routes.dart';
import 'package:e_commerce_app/views/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit(AuthController model) async {
    try {
      await model.submit();
      if (!mounted) return;
      Navigator.of(context).pushNamed(AppRoutes.bottonNavBarRoute);
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(
                  "Error",
                  style: Theme.of(context).textTheme.headline6,
                ),
                content: Text(
                  e.toString(),
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('OK'),
                  )
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthController>(builder: (_, model, __) {
      return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 32),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.authFormType == AuthFormType.login
                        ? "Login"
                        : "Register",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  TextFormField(
                    controller: _emailController,
                    focusNode: _emailFocusNode,
                    onEditingComplete: () {
                      FocusScope.of(context).requestFocus(_passwordFocusNode);
                    },
                    textInputAction: TextInputAction.next,
                    onChanged: model.updateEmail,
                    validator: (val) =>
                        val!.isEmpty ? "please enter email" : null,
                    decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "Enter Your Email",
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    focusNode: _passwordFocusNode,
                    onChanged: model.updatePassword,
                    validator: (val) =>
                        val!.isEmpty ? "please enter password" : null,
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Enter Your Password",
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  if (model.authFormType == AuthFormType.login)
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        child: Text("forget your password?"),
                        onTap: () {},
                      ),
                    ),
                  SizedBox(
                    height: 24,
                  ),
                  MainButton(
                    text: model.authFormType == AuthFormType.login
                        ? "Login"
                        : "Register",
                    onTab: () {
                      if (_formKey.currentState!.validate()) {
                        _submit(model);
                        // model.submit();
                        // Navigator.of(context)
                        //     .pushNamed(AppRoutes.bottonNavBarRoute);
                        // debugPrint("Authenticated!");
                      }
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      child: Text(model.authFormType == AuthFormType.login
                          ? "Don't have an account? Register"
                          : "Have an account? Login"),
                      onTap: () {
                        _formKey.currentState!.reset();
                        model.toggleFormType();
                      },
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.09,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      model.authFormType == AuthFormType.login
                          ? "Or Login with"
                          : "Or Register with",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white),
                        child: Icon(Icons.add),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white),
                        child: Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )),
      );
    });
  }
}

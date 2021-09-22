import 'package:flutter/material.dart';
import 'package:login/next_page.dart';
import 'package:login/shared/component/components.dart';

class LoginScreen extends StatefulWidget {
  static String ele = '';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
        ),
        title: Text(
          'Login',
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notification_important,
            ),
            onPressed: () {
              print('notification is pressed');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.search,
            ),
            onPressed: () {
              print('search is pressed');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  defaultTextForm(
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'Email cant be Empty';
                      }
                      return null;
                    },
                    label: 'Email Address',
                    prefix: Icons.email,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  defaultTextForm(
                      controller: passwordController,
                      isPassword: isPassword,
                      type: TextInputType.visiblePassword,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'password cant be empty';
                        }
                        return null;
                      },
                      label: 'Password',
                      prefix: Icons.lock,
                      suffix:
                          isPassword ? Icons.visibility : Icons.visibility_off,
                      onPressed: () {
                        setState(() {
                          isPassword = !isPassword;
                        });
                      }),
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultButton(
                    radius: 50.0,
                    text: 'login',
                    function: () {
                      if (formKey.currentState.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NextScreen(),
                          ),
                        );
                      }
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account?'),
                      TextButton(
                        onPressed: () {
                          print('Register pressed');
                        },
                        child: Text(
                          'Register Now',
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

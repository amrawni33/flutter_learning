import 'package:flutter/material.dart';
import 'package:startup_namer/modules/signup/signup_screen.dart';

import '../../shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

var addresscontroller = TextEditingController();
var passwordcontroller = TextEditingController();
var formKey = GlobalKey<FormState>();
bool isPass = true;

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Log In',
                    style: TextStyle(
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  defaultFormField(
                      controller: addresscontroller,
                      type: TextInputType.emailAddress,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Email Address must not be empty';
                        }
                        return null;
                      }),
                  const SizedBox(
                    height: 10.0,
                  ),
                  defaultFormField(
                      type: TextInputType.visiblePassword,
                      controller: passwordcontroller,
                      prefix: Icons.lock,
                      suffix: isPass ? Icons.visibility : Icons.visibility_off,
                      labelText: 'Password',
                      isPassword: isPass,
                      suffixPressed: () {
                        setState(() {});
                        isPass = !isPass;
                      },
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Password must not be empty';
                        }
                        return null;
                      }),
                  const SizedBox(
                    height: 10.0,
                  ),
                  defaultButton(
                      isUperCase: true,
                      function: () {
                        if ((formKey.currentState)!.validate()) {
                          print(addresscontroller.text);
                          print(passwordcontroller.text);
                        }
                      },
                      text: 'login'),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'don\'t have an account?',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUp(),
                                ));
                          },
                          child: const Text(
                            'register!',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ))
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

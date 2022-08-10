import 'package:flutter/material.dart';
import 'package:startup_namer/shared/components/components.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailcontroller = TextEditingController();
    var passwordcontroller = TextEditingController();
    var phonecontroller = TextEditingController();
    var namecontroller = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 18.0,
                  ),
                  defaultFormField(
                      controller: namecontroller,
                      type: TextInputType.text,
                      prefix: Icons.account_box,
                      labelText: 'name',
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'name must not be empty';
                        }
                        return null;
                      }),
                  const SizedBox(
                    height: 10.0,
                  ),
                  defaultFormField(
                      controller: emailcontroller,
                      type: TextInputType.emailAddress,
                      prefix: Icons.email,
                      labelText: 'Email Address',
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
                      controller: phonecontroller,
                      type: TextInputType.phone,
                      prefix: Icons.phone,
                      labelText: 'Phone',
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Password must not be empty';
                        }
                        return null;
                      }),
                  const SizedBox(
                    height: 10.0,
                  ),
                  defaultFormField(
                      controller: passwordcontroller,
                      type: TextInputType.visiblePassword,
                      prefix: Icons.lock,
                      labelText: 'Password',
                      isPassword: true,
                      suffix: Icons.remove_red_eye,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Password must not be empty';
                        }
                        return null;
                      }),
                  const SizedBox(
                    height: 15.0,
                  ),
                  defaultButton(
                      text: 'sign up',
                      function: () {
                        if ((formKey.currentState)!.validate()) {
                          print('it is ok');
                        }
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Have an account?',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Login',
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

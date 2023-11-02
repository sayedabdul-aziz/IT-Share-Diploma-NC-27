import 'package:book_booster/core/app_colors.dart';
import 'package:book_booster/core/widgets/nav_bar.dart';
import 'package:book_booster/feature/auth/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  var formKey = GlobalKey<FormState>();
  var emailCon = TextEditingController();
  var passCon = TextEditingController();
  bool isVisable = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    width: 160,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Create a new Account',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Name must not be empty!';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person), label: Text('Name')),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: emailCon,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email must not be empty!';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email_rounded),
                        label: Text('Email')),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: passCon,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'password must not be empty!';
                      }
                      return null;
                    },
                    obscureText: isVisable,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isVisable = !isVisable;
                              });
                            },
                            icon: Icon((isVisable)
                                ? Icons.remove_red_eye
                                : Icons.visibility_off_rounded)),
                        prefixIcon: const Icon(Icons.lock),
                        label: const Text('Password')),
                  ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: emailCon.text,
                          password: passCon.text,
                        );
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const NavBar(),
                        ));
                      }
                    },
                    child: Container(
                      height: 40,
                      alignment: Alignment.center,
                      width: double.infinity,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColor.lightPrimary),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: AppColor.white),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'I have an account ',
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => const LoginView(),
                            ));
                          },
                          child: const Text(
                            'Login!',
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

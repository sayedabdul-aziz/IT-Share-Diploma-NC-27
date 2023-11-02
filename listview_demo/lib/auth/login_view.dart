import 'package:flutter/material.dart';
import 'package:listview_demo/auth/register_view.dart';
import 'package:listview_demo/first_screen.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  bool isHidden = true;

  bool isEmailValid(String inputemail) {
    var pattern =
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))';
    RegExp regexp = RegExp(pattern);
    return regexp.hasMatch(inputemail);
  }

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
                  Image.network(
                    'https://clipart-library.com/images/8c65qGeEi.png',
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Login to your Account',
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                  const SizedBox(height: 80),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      print(value);
                    },
                    validator: (value) {
                      if (isEmailValid(value!)) {
                        return null;
                      } else {
                        return 'Enter a valid email address';
                      }
                    },
                    decoration: const InputDecoration(
                        label: Text('Email Address'),
                        prefixIcon: Icon(Icons.email_rounded),

                        // hintText: 'Enter your email',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: Colors.blue)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: Colors.grey)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        )),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: passController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: isHidden,
                    onChanged: (value) {},
                    validator: (value) {
                      if (value!.length < 8) {
                        return 'Password must be more than 8 charcater';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        label: const Text('Password'),
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isHidden = !isHidden;
                              });
                            },
                            icon: Icon(isHidden
                                ? Icons.remove_red_eye
                                : Icons.visibility_off_rounded)),
                        // hintText: 'Enter your email',
                        enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: Colors.blue)),
                        focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: Colors.grey)),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        )),
                  ),
                  const SizedBox(height: 25),
                  GestureDetector(
                    onTap: () {
                      print(emailController.text);
                      print(passController.text);
                      if (formKey.currentState!.validate()) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => FirstScreen(),
                        ));
                      }
                    },
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.blue,
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('I haven\'t any account'),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => const RegisterView(),
                            ));
                          },
                          child: const Text('Register'))
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

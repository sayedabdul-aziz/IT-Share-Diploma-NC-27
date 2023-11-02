import 'package:flutter/material.dart';
import 'package:listview_demo/auth/login_view.dart';
import 'package:listview_demo/first_screen.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
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
                  'Create a new Account',
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
                const SizedBox(height: 80),
                TextFormField(
                  controller: usernameController,
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    print(value);
                  },
                  validator: (value) {
                    return null;
                  },
                  decoration: const InputDecoration(
                      label: Text('Username'),
                      prefixIcon: Icon(Icons.person),

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
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    print(value);
                  },
                  validator: (value) {
                    return null;
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
                  obscureText: true,
                  onChanged: (value) {},
                  validator: (value) {
                    return null;
                  },
                  decoration: const InputDecoration(
                      label: Text('Password'),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: Icon(Icons.remove_red_eye),
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
                const SizedBox(height: 25),
                GestureDetector(
                  onTap: () {
                    print(emailController.text);
                    print(passController.text);
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => FirstScreen(),
                    ));
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
                      'Register',
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
                    const Text('I have an account'),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => const LoginView(),
                          ));
                        },
                        child: const Text('Sign in'))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

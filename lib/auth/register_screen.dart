import 'package:flutter/material.dart';
import 'package:todo_app/auth/auth_methods.dart';
import 'package:todo_app/screens/home_screen.dart';

import '../widgets/button.dart';
import '../widgets/text_input.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
  }

  void register() async {
    setState(() {
      _isLoading = true;
    });
    String res = await Authentication().registerUser(
      email: emailController.text,
      password: passwordController.text,
      username: usernameController.text,
    );
    if (res == "success") {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    } else {
      SnackBar(content: Text(res));
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent.shade100,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 80,
                child: Image.asset(
                  "assets/logo.png",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                child: Text(
                  "Create your account",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text("Email Address"),
              const SizedBox(
                height: 10,
              ),
              CustomTextInput(
                controller: emailController,
                hintText: "Enter your Email",
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 30,
              ),
              const Text("Username"),
              const SizedBox(
                height: 10,
              ),
              CustomTextInput(
                controller: usernameController,
                hintText: "Enter your Username",
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: 30,
              ),
              const Text("Password"),
              const SizedBox(
                height: 10,
              ),
              CustomTextInput(
                controller: passwordController,
                hintText: "Enter your Password",
                textInputType: TextInputType.text,
                isPass: true,
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                child: _isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : CustomButton(
                        backgroundColor: Colors.lightBlueAccent,
                        borderColor: Colors.lightBlueAccent,
                        text: "Register",
                        textColor: Colors.white,
                        height: 50,
                        width: 257,
                        press: register,
                      ),
              ),
              Flexible(
                flex: 1,
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todo_app/auth/auth_methods.dart';
import 'package:todo_app/auth/register_screen.dart';
import 'package:todo_app/screens/home_screen.dart';
import 'package:todo_app/widgets/button.dart';
import 'package:todo_app/widgets/text_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void login() async {
    setState(() {
      _isLoading = true;
    });
    String res = await Authentication().loginUser(
      email: emailController.text,
      password: passwordController.text,
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

  void register() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const RegisterScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
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
                height: 30,
              ),
              SizedBox(
                height: 90,
                child: Image.asset(
                  "assets/logo.png",
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                child: Text(
                  "Log In to your Account",
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
              const Text("Password"),
              const SizedBox(
                height: 10,
              ),
              CustomTextInput(
                controller: passwordController,
                hintText: "Enter your Password",
                textInputType: TextInputType.number,
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
                        text: "Log In",
                        textColor: Colors.white,
                        height: 50,
                        width: 257,
                        press: login,
                      ),
              ),
              Flexible(
                flex: 1,
                child: Container(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                    child: const Text("Don't have an account?"),
                  ),
                  GestureDetector(
                    onTap: register,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

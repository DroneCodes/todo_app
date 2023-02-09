import 'package:flutter/material.dart';
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
                height: 50,
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
                child: Text("Log In to your Account"),
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
              ),

              const SizedBox(
                height: 25,
              ),

              const CustomButton(backgroundColor: Colors.lightBlueAccent, borderColor: Colors.grey, text: "Log In", textColor: Colors.white, height: 50, width: 257,),

              Flexible(flex: 1,child: Container(),),

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
                    //onTap: signUp,
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

import 'package:flutter/material.dart';
import 'package:login_api1/presentation/login_screen/controller/login_screen_controller.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();

  String? access;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LoginScreen"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: phoneController,
              decoration: InputDecoration(
                hintText: "Mobilnumber",
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 5,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: "Password",
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 5,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.black),
            ),
            onPressed: () {
              Provider.of<LoginScreenController>(context, listen: false)
                  .postData(phoneController.text.trim(),
                      passwordController.text.trim(), context);
            },
            child: Text(
              "Login",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

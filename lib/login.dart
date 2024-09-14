import 'package:flutte_tablechef/controller/login%20Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  final String title;

  const Login(this.title, {super.key}); // Acepta un título

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          width: Get.width,
          height: Get.height,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Login',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              InputBox(
                  isSecured: false,
                  hint: 'Username',
                  txtController: controller.username),
              const SizedBox(height: 20),
              InputBox(
                  isSecured: true,
                  hint: 'Password',
                  txtController: controller.password),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  print('Login credentials ========');
                  //Se crea un nuevo Usuario y valisación
                  await controller.submit();
                  // print('${controller.Username}');
                  // print('${controller.Password}');
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget InputBox(
    {required String hint,
    required TextEditingController txtController,
    required bool isSecured}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: Colors.grey),
    ),
    child: TextField(
      obscureText: isSecured,
      controller: txtController,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hint,
      ),
    ),
  );
}

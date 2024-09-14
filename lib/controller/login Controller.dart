import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutte_tablechef/models/user.dart';

class LoginController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  // Constructor sin 'const'
  LoginController();

  String _message = "";
  Dio _dio = Dio();
  //creamos el metodo para traer los usuarios y actualizarlos
  //Tambien validamos los datos y enviarlos al servidor
  Future<void> submit() async {
    User user = User(username: username.text, password: password.text.trim());
    bool validateResult = ValidateUser(user);

    if (validateResult) {
      bool serverResponse = await authenticateUser(user);
      if (serverResponse) {
        await showMessage(
            context: Get.context!,
            title: 'Éxitoso',
            message: 'Usuario logeado exitosamente!');
      } else {
        await showMessage(
            context: Get.context!,
            title: 'Error',
            message: 'Usuario o contraseña incorrecta');
      }
    } else {
      await showMessage(
          context: Get.context!, title: 'Error', message: _message);
    }
  }

  //Validación del usuario y contraseña
  bool ValidateUser(User user) {
    if (user.username == null || user.password == null) {
      _message = 'Nombre de usuario o contraseña vacíos';
      return false;
    }
    if (user.username.toString().isEmpty) {
      _message = 'El nombre de usuario no puede estar vacío';
      return false;
    }
    if (user.password.toString().isEmpty) {
      _message = 'La contraseña no puede estar vacía';
      return false;
    }
    return true;
  }

  Future<bool> authenticateUser(User user) async {
    Dio dio = Dio(BaseOptions(connectTimeout: Duration(seconds: 5)));
    String _apiUrl = 'https://dummyjson.com/auth/login';

    try {
      Map<String, dynamic> requestData = {
        'username': user.username,
        'password': user.password,
      };

      final response = await dio.post(_apiUrl, data: requestData);

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  //Display Dialog box code
  showMessage(
      {required BuildContext context,
      required String title,
      required String message}) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              CupertinoDialogAction(
                  child: Text('Ok'),
                  onPressed: () {
                    Get.back();
                  })
            ],
          );
        });
  }
}

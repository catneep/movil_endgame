import 'package:flutter/material.dart';

import '../forms/forms.dart';

/// Opens a modal dialog in GUI
/// 
/// args:
///    - BuildContext context: Flutter GUI contexy
///    - String operation: Determines which dialog will open upon method call
///    - String title: Text to be displayed at the top
/// 
/// return:
///    - N/A
void openModal(BuildContext context, {operation, title = "Sample Modal"}) {
  Widget _modalBody;
  switch (operation) {
    case "register":
      debugPrint("Opening registration modal");
      _modalBody = const RegisterForm();
      break;
    case "login":
      debugPrint("Opening login modal");
      _modalBody = const LoginForm();
      break;
    default:
      throw Exception("Modal operation '$operation' is not defined.");
  }

  showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            title: Text("$title"),
            // content: const Text("TODO Varies with above switch case"),
            content: _modalBody,
            // actions: <Widget>[
            //   IconButton(
            //       icon: const Icon(Icons.close),
            //       onPressed: () {
            //         Navigator.pop(context);
            //       })
            // ],
          ));
}

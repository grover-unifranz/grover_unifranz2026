import 'package:flutter/material.dart';
import '../db/database_helper.dart';
import 'inicio.dart';

class Login extends StatelessWidget {
  final usuarioCtrl = TextEditingController();
  final claveCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("INICIO DE SESIÓN")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(controller: usuarioCtrl, decoration: InputDecoration(labelText: "INGRESE SU USARIO")),
            TextField(controller: claveCtrl, decoration: InputDecoration(labelText: "INGRESE SU CONTRASENA"), obscureText: true),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text("Ingresar"),
              onPressed: () async {
                bool ok = await DatabaseHelper.instance.loginUsuario(
                  usuarioCtrl.text,
                  claveCtrl.text,
                );
                if (ok) {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => Inicio()));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Usuario o contraseña incorrectos")),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

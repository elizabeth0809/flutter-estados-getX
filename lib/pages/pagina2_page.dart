import 'package:flutter/material.dart';
import 'package:flutter_estados_getx/controllers/usuario_controller.dart';
import 'package:flutter_estados_getx/models/usuario.dart';
import 'package:get/get.dart';


class Pagina2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final usuarioCtrl = Get.find<UsuarioController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            MaterialButton(
              child: Text('Establecer Usuario', style: TextStyle( color: Colors.white ) ),
              color: Colors.blue,
              onPressed: () {
                usuarioCtrl.cargarUsuario(Usuario('eliza', 20, ['profe']));
                Get.snackbar('usuario establecido', 'eliza es el nombre del usuario',
                backgroundColor: Colors.white,
                boxShadows: [BoxShadow(
                  color: Colors.black,
                  blurRadius: 10
                )]
                );
              }
            ),

            MaterialButton(
              child: Text('Cambiar Edad', style: TextStyle( color: Colors.white ) ),
              color: Colors.blue,
              onPressed: () {
usuarioCtrl.cambiarEdad(25);
              }
            ),

            MaterialButton(
              child: Text('Añadir Profesion', style: TextStyle( color: Colors.white ) ),
              color: Colors.blue,
              onPressed: () {
usuarioCtrl.agregarProfesion('Profesion ${usuarioCtrl.profesionesCount + 1}');
              }
            ),

          ],
        )
     ),
   );
  }
}
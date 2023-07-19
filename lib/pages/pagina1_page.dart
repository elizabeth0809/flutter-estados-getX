import 'package:flutter/material.dart';
import 'package:flutter_estados_getx/controllers/usuario_controller.dart';
import 'package:flutter_estados_getx/models/usuario.dart';
import 'package:get/get.dart';


class Pagina1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final usuarioCtrl = Get.put(UsuarioController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
      ),
      body: Obx(() => usuarioCtrl.existeUsuario.value ? InformacionUsuario(usuario: usuarioCtrl.usuario.value,) : NoInfo()),

     floatingActionButton: FloatingActionButton(
       child: Icon( Icons.accessibility_new ),
       //la menra de hacerlo con el gestor de estado get es asi
       onPressed: () => Get.toNamed('pagina2', arguments: {
        'nombre' : 'elizabeth',
        'edad' : 22
       })
     ),
   );
  }
}
class NoInfo extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('no hay informacion'),
    );
  }
}
class InformacionUsuario extends StatelessWidget {
final Usuario usuario;

  const InformacionUsuario({super.key, required this.usuario});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text('General', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold ) ),
          Divider(),

          ListTile( title: Text('Nombre: ${this.usuario.nombre}') ),
          ListTile( title: Text('Edad: ${this.usuario.edad}') ),

          Text('Profesiones', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold ) ),
          Divider(),

          ...usuario.profesiones.map((profesion) => ListTile(
            title: Text(profesion!),
          ))

        ],
      ),
    );
  }

}
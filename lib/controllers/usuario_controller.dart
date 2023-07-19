import 'package:flutter_estados_getx/models/usuario.dart';
import 'package:get/get.dart';

class UsuarioController extends GetxController{
  //los obs son observables
  var existeUsuario = false.obs;
  var usuario =  new Usuario('nombre',30,['profesion']).obs;

  int get profesionesCount{
    return this.usuario.value.profesiones.length;
  }
  void cargarUsuario(Usuario pUsuario){
    this.existeUsuario.value = true;
    this.usuario.value = pUsuario;
  }
  void cambiarEdad(int edad){
    this.usuario.update((val) {
      val!.edad = edad;
    });
  
  }
  void agregarProfesion(String profesion){
    this.usuario.update((val) {
      //esto agregar una nueva profesion al arreglo ya existente
      val!.profesiones = [...val.profesiones, profesion];
    });
  }
}
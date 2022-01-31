import 'package:estados/bloc/user/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:estados/models/usuario.dart';

class Pagina1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      body: SafeArea(        
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
            SliverAppBar(
              title: Text('Pagina 1'),
            )
          ],
          body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
      
            return state.existeUser
              //según la lógica que tenemos, el state es el que va a mantener los datos nuevos proporcionados desde la otra ventana
              ? InformacionUsuario(user: state.user! )
              : const Center( child: Text('No hay usuario seleccionado'));
      
          }
      
            
          
          ),
        ),
      ),
      
      //InformacionUsuario(),

     floatingActionButton: FloatingActionButton(
       child: Icon( Icons.accessibility_new ),
       onPressed: () => Navigator.pushNamed(context, 'pagina2')
     ),
   );
  }
}

class InformacionUsuario extends StatelessWidget {

  final Usuario user;

  const InformacionUsuario({

    Key? key,
    required this.user

  }):super(key:key);

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

          ListTile( title: Text('Nombre: ${user.nombre}') ),
          ListTile( title: Text('Edad: ${user.edad} ') ),

          Text('Profesiones', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold ) ),
          Divider(),

          //Esta linea funciona como un forecha, donde la variable "prof" recoge los arreglos
          ...user.profesiones.map( (prof) => ListTile( title: Text('${prof}') )).toList()
          

        ],
      ),
    );
  }

}
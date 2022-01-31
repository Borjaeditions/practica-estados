import 'package:estados/bloc/user/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


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
              ? InformacionUsuario()
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

          ListTile( title: Text('Nombre: ') ),
          ListTile( title: Text('Edad: ') ),

          Text('Profesiones', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold ) ),
          Divider(),

          ListTile( title: Text('Profesion 1') ),
          ListTile( title: Text('Profesion 1') ),
          ListTile( title: Text('Profesion 1') ),

        ],
      ),
    );
  }

}
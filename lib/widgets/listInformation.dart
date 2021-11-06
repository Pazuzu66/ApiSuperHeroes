import 'package:apisuperhero/controllers/superHero_controller.dart';
import 'package:apisuperhero/models/superHero_model.dart';
import 'package:apisuperhero/widgets/cards.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListHeros extends StatelessWidget {
  final heroController = Get.find<SuperHeroController>();

  @override
  Widget build(BuildContext context) {
    //Obtenemos la informacion del metodo get para posteriormente pasarlo
    //a un listado de esta
    return FutureBuilder(
      future: heroController.getSuperHeroes(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(snapshot.hasError){
          return Center(child: Text('Hay un Error en la Peticion'));
        }
        else {
          if(snapshot.connectionState == ConnectionState.done ){
            return _listSuperHero(snapshot.data);
          }
          else {
            return Center(
              child: Image(image: AssetImage('assets/Loading.gif'),),
            );
          }
        }
      }
    );
  }

  Widget _listSuperHero(List<SuperHeroModel> heros) {
    return GridView.builder(
      itemCount: heros.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.65,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5
      ), 
      itemBuilder:(context, index ){
          SuperHeroModel hero = heros[index];
          return CardHeros(heroModel: hero);
        },   
      ); 
  }
}
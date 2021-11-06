import 'package:apisuperhero/controllers/superHero_controller.dart';
import 'package:apisuperhero/models/superHero_model.dart';
import 'package:apisuperhero/widgets/netImage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardHeros extends StatelessWidget {
  final SuperHeroModel heroModel;
  final heroController = Get.find<SuperHeroController>();

  CardHeros({
    required this.heroModel
  });

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Card(        
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        margin: EdgeInsets.all(15),
        elevation: 10,
        child: InkWell( 
          onTap: () => _pushDescription(context, heroModel.id!, heroModel.photoName!),         
          child: ClipRRect(
            child: Column(
              children: [
                Hero(
                  tag: heroModel.id!,
                  transitionOnUserGestures: true,
                  child: FadeInImage(
                    placeholder: AssetImage('assets/Loading.gif'),
                    image:  NetworkImage('https://cdn.jsdelivr.net/gh/akabab/superhero-api@0.3.0/api/images/lg/${heroModel.photoName}.jpg'),
                    fadeInDuration: Duration(milliseconds: 200),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(heroModel.name!),
                )
              ],
            ),
          ),
        ),
      )
    );
  }

  _pushDescription(BuildContext context, int idHero, String pothoName ){
    heroController.idHero.value = idHero;
    heroController.pothoHero.value = pothoName;
    Navigator.pushNamed(context, '/hero-description');
  }
 
}
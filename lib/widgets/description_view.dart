import 'package:apisuperhero/controllers/superHero_controller.dart';
import 'package:apisuperhero/models/biographyHero_model.dart';
import 'package:apisuperhero/models/powerStats_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class DescriptionView extends StatelessWidget {
  final heroController = Get.find<SuperHeroController>();


  @override
  Widget build(BuildContext context) {
   return ListView(
     padding: EdgeInsets.only(top: 3, left: 10, right: 10, bottom: 10),
     children: [
       imageHero(),
       Divider(
         height: 10,
       ),
       _getBiographyHero(heroController.idHero.value),   
       Divider(
         height: 10,
       ),
       _getPowerStats(heroController.idHero.value)
     ],
   );
  }

  Widget imageHero() {
    return Card(
       shadowColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)) ,
        margin: EdgeInsets.all(5),
        elevation: 10,
        child: Column(                    
          children: [
             ClipRRect(               
               borderRadius: BorderRadius.circular(10),                              
               child: Container(                                                                 
                    child: Hero(
                      tag: heroController.idHero,
                      child: FadeInImage(                  
                        placeholder: AssetImage('assets/loadingImage.gif'),
                        image: NetworkImage('https://cdn.jsdelivr.net/gh/akabab/superhero-api@0.3.0/api/images/lg/${heroController.pothoHero.value}.jpg'),
                        fadeInDuration: Duration(milliseconds: 200),
                      ),
                    ),
                ),
             ),
          ],
        ),
    );
  }

  _getBiographyHero(int idHero) {
    return FutureBuilder(
      future: heroController.getBiography(idHero) ,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(snapshot.hasError) {
          return Center(child: Text('Hubo un Error'),);
        }
        else {
          if(snapshot.connectionState == ConnectionState.done) {
            return _displayBiography(snapshot.data);
          }
          else {
            return Center(
              child: CircularProgressIndicator()
            );
          }
        }
      }
      );
  }

  _displayBiography(BiographyHeroModel biography) {
    return Container(    
      padding: EdgeInsets.only(right: 5, left: 5, top: 5, bottom: 5),  
       width: 100,
      height: 150,
      decoration: BoxDecoration(        
        borderRadius: BorderRadius.circular(10),
        border: Border.all( color:  Colors.white),
         boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255,186 , 214, 219),            
          ),
        ],
      ),
      child: Card(   
        color: Color.fromARGB(255,186 , 214, 219),        
        margin: EdgeInsets.only(right: 2),                
        child: Column(                                    
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,                  
          children: [
            Row(                                                                                        
              children: [                        
                Text('Nombre Completo : ${biography.fullName}',)
              ],
            ),
            Row(
              children: [
                Text('Primera Aparición : ${biography.firstAppearance}',)
              ],
            ),
            Row(              
              children: [
                Text('Lugar de Nacimiento : ${biography.placeOfBirth}')
              ],
            ),
            Row(                      
              children: [
                Text('Editora : ${biography.publisher}')
              ],
            )
          ],
        ) ,
      )                                     
    );
  }

  _getPowerStats(int idHero) {
    return FutureBuilder(
      future: heroController.getPowerStats(idHero),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(snapshot.hasError) {
          return Center(child: Text('Hubo un Error'),);
        }
        else {
          if(snapshot.connectionState == ConnectionState.done) {
            return _displayPoweStats(snapshot.data);
          }
          else {
            return CircularProgressIndicator();
          }
        }
      }
    );
  }

  _displayPoweStats(PowerStatsModel powerStats) {
    return Container(
       width: 100,
      height: 250,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all( color:  Colors.white),
         boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255,186 , 214, 219),          
          ),
        ],
      ),
      child: Card(       
        color: Color.fromARGB(255,186 , 214, 219),
        margin: EdgeInsets.all(5),                
        child: Row(
          children: [
            Column(   
              mainAxisAlignment: MainAxisAlignment.spaceAround,                   
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(                      
                  children: [
                    Text('Puntos de Inteligencia : ${powerStats.intelligence}'),
                   
                  ],
                ),
                Row(
                  children: [
                    Text('Puntos de Fuerza : ${powerStats.strength}'),
                   
                  ],
                ),
                Row(
                  children: [
                    Text('Puntos de Velocidad : ${powerStats.speed}'),
                   
                  ],
                ),
                Row(                      
                  children: [
                    Text('Puntos de Resistencia : ${powerStats.durability}'),
                   
                  ],
                ),
                Row(                      
                  children: [
                    Text('Puntos de Poder : ${powerStats.power}'),
                    
                  ],
                ),
                Row(                      
                  children: [
                    Text('Puntos de Combate : ${powerStats.combat}'),                   
                  ],
                ),
                
              ],
            ),
            Column(          
              mainAxisAlignment: MainAxisAlignment.spaceAround,                      
              children: [
                StepProgressIndicator(                  
                      totalSteps: 10,
                      currentStep: powerStats.intelligence! ~/ 10,
                      selectedColor: Colors.red,
                      unselectedColor: Colors.white,
                      size: 20.0,                      
                ),
                StepProgressIndicator(
                      totalSteps: 10,
                      currentStep: powerStats.strength! ~/ 10,
                      selectedColor: Colors.red,
                      unselectedColor: Colors.white,
                      size: 20.0,                      
                ),
                StepProgressIndicator(
                      totalSteps: 10,
                      currentStep: powerStats.speed! ~/ 10,
                      selectedColor: Colors.red,
                      unselectedColor: Colors.white,
                      size: 20.0,                      
                ),
                StepProgressIndicator(
                      totalSteps: 10,
                      currentStep: powerStats.durability! ~/ 10,
                      selectedColor: Colors.red,
                      unselectedColor: Colors.white,
                      size: 20.0,                      
                ),
                StepProgressIndicator(
                      totalSteps: 10,
                      currentStep: powerStats.power! ~/ 10,
                      selectedColor: Colors.red,
                      unselectedColor: Colors.white,
                      size: 20.0,                      
                ),
                StepProgressIndicator(
                      totalSteps: 10,
                      currentStep: powerStats.combat! ~/ 10,
                      selectedColor: Colors.red,
                      unselectedColor: Colors.white,
                      size: 20.0,                      
                )
              ],
            )
          ],
        ) ,
      )                                     
    );
  }
}   
import 'dart:convert';
import 'package:apisuperhero/models/biographyHero_model.dart';
import 'package:apisuperhero/models/powerStats_model.dart';
import 'package:apisuperhero/models/superHero_model.dart';
import 'package:http/http.dart' as http;

class ApiSuperhero {
  var url;

  Future<List<SuperHeroModel>?> getAllSuperHero() async {
     url = Uri.parse('https://akabab.github.io/superhero-api/api/all.json');
    final response = await http.get(url);
    if(response.statusCode == 200) {
      //El Texto lo convertimos a una estructura JSON
      var superhero = jsonDecode(response.body) as List;
      List<SuperHeroModel> listSuperHeros =
        superhero.map( ( hero ) => SuperHeroModel.fromMap(hero)).toList();
      return listSuperHeros;
    }
    else {
      return null;
    }
  }

  Future<PowerStatsModel>? getPowerStatsHero(int idHero) async {
    url = Uri.parse('https://cdn.jsdelivr.net/gh/akabab/superhero-api@0.3.0/api/powerstats/$idHero.json');
    final response = await http.get(url);
    if(response.statusCode == 200){
      var powerStats = jsonDecode(response.body);      
      return PowerStatsModel(
        combat        : powerStats['combat'],
        durability    : powerStats['durability'], 
        intelligence  : powerStats['intelligence'], 
        power         : powerStats['power'], 
        speed         : powerStats['speed'], 
        strength      : powerStats['strength'] );
    }
    else {
      return PowerStatsModel(
       combat         : 0,
        durability    : 0, 
        intelligence  : 0, 
        power         : 0, 
        speed         : 0, 
        strength      : 0 
      );
      
    }
  }

  Future<BiographyHeroModel>? getBiographyHero(int idHero) async {
    url = Uri.parse('https://cdn.jsdelivr.net/gh/akabab/superhero-api@0.3.0/api/biography/$idHero.json');
    final response = await http.get(url);
    if(response.statusCode == 200) {
      var biography = jsonDecode(response.body);
      return BiographyHeroModel(
        fullName         : biography['fullName'] == '' ? 'Desconocido' : biography['fullName'], 
        firstAppearance  : biography['firstAppearance'] == '-' ? 'Desconocido' : biography['firstAppearance'], 
        placeOfBirth     : biography['placeOfBirth'] == '-' ? 'Desconocido' : biography['placeOfBirth']  , 
        publisher        : biography['publisher'] == '-' ? 'Desconocido' : biography['publisher'] );
    }
    else {
      return BiographyHeroModel(
        fullName          : '', 
        firstAppearance   : '', 
        placeOfBirth      : '', 
        publisher         : ''
      );
    }
  }
}
import 'package:apisuperhero/api/api_superhero.dart';
import 'package:get/get.dart';

class SuperHeroController extends GetxController{
  ApiSuperhero apiSuperHero = ApiSuperhero();
  final pothoHero = ''.obs;
  final idHero = 0.obs;

  getSuperHeroes() async {
    return apiSuperHero.getAllSuperHero();
  }

  getPowerStats(int idHero) async {
    return apiSuperHero.getPowerStatsHero(idHero);
  }

  getBiography(int idHero) async {
    return apiSuperHero.getBiographyHero(idHero);
  }
}
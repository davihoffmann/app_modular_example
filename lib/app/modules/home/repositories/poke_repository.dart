import 'package:app_slyde_modular_example/app/shared/models/pokemon_model.dart';
import 'package:dio/dio.dart';

class PokeRepository {

  final Dio dio;

  PokeRepository(this.dio);

  Future<List<PokemonModel>> getAllPokemons() async {
    var response = await dio.get('/pokemon');
    List<PokemonModel> list = [];
    
    for(var json in (response.data['results'] as List)) {
      PokemonModel model = PokemonModel(name: json['name']);
      list.add(model);
    }

    return list;
  }

}
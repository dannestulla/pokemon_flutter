import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/pokemon_response.dart';
import 'models/specific_pokemon.dart';

const pokemonList = "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=30";

Future<PokemonResponse> getPokemonList() async {
  var result = await http.get(Uri.parse(pokemonList));
  switch (result.statusCode) {
    case 200 :
      return PokemonResponse.fromJson(jsonDecode(result.body));
    default :
      throw Exception('Failed to fetch result. Error: ${result.body}');
  }
}

Future<SpecificPokemon> getSpecificPokemon(String pokemonUrl) async {
  var result = await http.get(Uri.parse(pokemonUrl));
  switch (result.statusCode) {
    case 200 :
      return SpecificPokemon.fromJson(jsonDecode(result.body));
    default :
      throw Exception('Failed to fetch result. Error: ${result.body}');
  }
}
import 'package:busca_uni/fetch_api.dart';
import 'package:busca_uni/specific_pokemon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'models/pokemon_response.dart';

final pokemonList = FutureProvider<PokemonResponse>((ref) => getPokemonList());

final specificPokemon = StateProvider((ref) => "pokemon45");

void main() => runApp(ProviderScope(
        child: MaterialApp(initialRoute: '/', routes: {
      '/': (context) => const PokemonList(),
      '/a': (context) => const SpecificPokemon()
    })));

class PokemonList extends ConsumerWidget {
  const PokemonList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final response = ref.watch(pokemonList);
    return Scaffold(
        appBar: AppBar(title: const Text('Lista Pokemon')),
        body: Center(
            child: response.when(
                error: (e, _) => Text(e.toString()),
                loading: () => const CircularProgressIndicator(),
                data: (dataString) => ListView.builder(
                      itemBuilder: (context, index) {
                        return SizedBox(
                          child: Card(
                              child: ListTile(
                            leading: const Icon(Icons.arrow_right),
                            title: Text(
                              dataString.results![index].name.toString(),
                              style: const TextStyle(fontSize: 20),
                            ),
                            onTap: () => {
                              ref.read(specificPokemon.notifier).state =
                                  dataString.results![index].name!,
                              Navigator.of(context).pushNamed('/a'),
                            },
                          )),
                        );
                      },
                      itemCount: dataString.results?.length,
                    ))));
  }
}

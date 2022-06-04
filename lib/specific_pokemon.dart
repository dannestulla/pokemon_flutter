import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'main.dart';

class SpecificPokemon extends ConsumerWidget {
  const SpecificPokemon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final pokemonName = ref.watch(specificPokemon);



    return Scaffold(
      appBar: AppBar(title: const Text("Pokemon")),
      body: Center(
          child: Text(
            pokemonName,
            style: Theme.of(context).textTheme.displayMedium)
      ));
  }
}

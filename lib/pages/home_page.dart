import 'package:flutter/material.dart';
import 'package:flutter_pokedox/widgets/app_title.dart';
import 'package:flutter_pokedox/widgets/pokemon_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: OrientationBuilder(
        builder: (context, orientation) => Scaffold(
          body: Column(
            children: [
              AppTitle(),
              Expanded(child: PokemonList()),
            ],
          ),
        ),
      ),
    );
  }
}

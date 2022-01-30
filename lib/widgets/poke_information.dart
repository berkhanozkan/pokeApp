import 'package:flutter/material.dart';
import 'package:flutter_pokedox/constants/constants.dart';
import 'package:flutter_pokedox/constants/ui_helper.dart';
import 'package:flutter_pokedox/model/pokemon_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PokeInformation extends StatelessWidget {
  final PokemonModel pokemonModel;
  const PokeInformation({Key? key, required this.pokemonModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10.w),
          ),
          color: Colors.white),
      child: Padding(
        padding: UIHelper.getIconPadding(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildInformationRow('Name', pokemonModel.name),
            _buildInformationRow('Height', pokemonModel.height),
            _buildInformationRow('Weight', pokemonModel.weight),
            _buildInformationRow('Spawn Time', pokemonModel.spawnTime),
            _buildInformationRow('Weakness', pokemonModel.weaknesses),
            _buildInformationRow('Pre Evolution', pokemonModel.prevEvolution),
            _buildInformationRow('Next Evolution', pokemonModel.nextEvolution)
          ],
        ),
      ),
    );
  }

  _buildInformationRow(String label, dynamic value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Constants.getPokiInfoTextStyle(),
        ),
        if (value is List && value.isNotEmpty)
          Text(
            value.join(' , '),
            style: Constants.getPokiInfoLabelTextStyle(),
          )
        else if (value == null)
          const Text('Not available')
        else
          Text(value.toString(), style: Constants.getPokiInfoLabelTextStyle())
      ],
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedox/constants/ui_helper.dart';
import 'package:flutter_pokedox/model/pokemon_model.dart';
import 'package:flutter_pokedox/widgets/poke_information.dart';
import 'package:flutter_pokedox/widgets/poke_type_name.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailPage extends StatelessWidget {
  final PokemonModel pokemon;
  const DetailPage({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String pokemonImageUrl = 'images/pokeball.png';
    return ScreenUtil().orientation == Orientation.portrait
        ? _buildPortraitBody(context, pokemonImageUrl)
        : _buildLandscapeBody(context, pokemonImageUrl);
  }

  Scaffold _buildPortraitBody(BuildContext context, String pokemonImageUrl) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: UIHelper.getIconPadding(),
              child: IconButton(
                // iconSize: 36.r, // egnişlik ve yükseklikte hangisi küçük ise ona göre işlem yapıyor. (r)
                iconSize: 24.w,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back_ios),
              ),
            ),
            PokeNameType(pokemonModel: pokemon),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
                child: Stack(
              children: [
                Positioned(
                  child: Image.asset(
                    pokemonImageUrl,
                    height: 0.12.sh,
                    fit: BoxFit.fitHeight,
                  ),
                  right: 0,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  top: 0.10.sh,
                  child: PokeInformation(
                    pokemonModel: pokemon,
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Hero(
                    tag: pokemon.id!,
                    child: CachedNetworkImage(
                      imageUrl: pokemon.img ?? '',
                      height: 0.25.sh,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                )
              ],
            )),
          ],
        ),
      ),
    );
  }

  Scaffold _buildLandscapeBody(BuildContext context, String pokemonImageUrl) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: UIHelper.getIconPadding(),
                child: IconButton(
                  // iconSize: 36.r, // egnişlik ve yükseklikte hangisi küçük ise ona göre işlem yapıyor. (r)
                  iconSize: 24.w,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back_ios),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PokeNameType(pokemonModel: pokemon),
                          Hero(
                            tag: pokemon.id!,
                            child: CachedNetworkImage(
                              imageUrl: pokemon.img ?? '',
                              height: 0.20.sw,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 5, child: PokeInformation(pokemonModel: pokemon))
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

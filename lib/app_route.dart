import 'package:breakingbad/bussiness_logic/cubit/chaeracter_cubit.dart';
import 'package:breakingbad/data/model/Character.dart';
import 'package:breakingbad/data/remote/character_api.dart';
import 'package:breakingbad/data/repo/characters_repo.dart';
import 'package:breakingbad/presentation/screen/character_details_screen.dart';
import 'package:breakingbad/presentation/screen/character_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bussiness_logic/conestants/strings.dart';

class AppRouter {
  late CharactersRepo charactersRepo;
  late CharactersCubit characterCubit;

  AppRouter() {
    charactersRepo = CharactersRepo(CharacterApi());
    characterCubit = CharactersCubit(charactersRepo);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case characterScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => characterCubit,
            child: CharacterScreen(),
          ),
        );

      case characterDetailsScreen:
        final character = settings.arguments as Character;
        return MaterialPageRoute(builder: (_) => CharacterDetailsScreen(character: character,));
    }
  }
}

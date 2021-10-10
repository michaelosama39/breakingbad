import 'package:breakingbad/data/model/Character.dart';
import 'package:breakingbad/data/remote/character_api.dart';

class CharactersRepo {
  final CharacterApi characterApi;

  CharactersRepo(this.characterApi);

  Future<List<Character>> getAllCharacters() async {
    final characters = await characterApi.getAllCharacters();
    return characters
        .map((character) => Character.fromJson(character))
        .toList();
  }

}

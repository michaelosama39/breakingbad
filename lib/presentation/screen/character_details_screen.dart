import 'package:breakingbad/bussiness_logic/conestants/my_colors.dart';
import 'package:breakingbad/data/model/Character.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Character character;

  const CharacterDetailsScreen({Key? key, required this.character})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGray,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    characterInfo('Job: ' , character.occupation.join(' / ')),
                    buildDivider(250),

                    characterInfo('Appeared in: ' , character.category),
                    buildDivider(250),

                    characterInfo('Seasons: ' , character.appearance.join(' / ')),
                    buildDivider(280),

                    characterInfo('Status: ' , character.status),
                    buildDivider(300),

                    characterInfo('Better Call Saul Seasons: ' , character.betterCallSaulAppearance.join(' / ')),
                    buildDivider(150),

                    characterInfo('Actor/Actress: ' , character.portrayed),
                    buildDivider(150),
                  ],
                ),
              ),
              SizedBox(height: 400,)
            ]),
          ),
        ],
      ),
    );
  }

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGray,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          character.nickname,
          style: TextStyle(color: MyColors.myWhite),
        ),
        background: Hero(
          tag: character.charId,
          child: Image.network(
            character.img,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          children: [
            TextSpan(
              text: title,
              style: TextStyle(
                color: MyColors.myWhite,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              )
            ),
            TextSpan(
                text: value,
                style: TextStyle(
                  color: MyColors.myWhite,
                  fontSize: 16,
                )
            ),
          ],
        ));
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      height: 30,
      endIndent: endIndent,
      color: MyColors.myYellow,
      thickness: 2,
    );
  }
}
import 'package:flutter/material.dart';

import '/src/game/game.dart';

class MainMenu extends StatelessWidget {
  // An unique identified for this overlay.
  static const id = 'MainMenu';

  // Reference to parent game.
  final Langaw gameRef;

  const MainMenu(this.gameRef, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _startGame() {
      // gameRef.overlays.remove(MainMenu.id);
      gameRef.startGamePlay();
    }

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset(
            'assets/images/branding/title.png',
            width: 292,
          ),
          IconButton(
            icon: Image.asset('assets/images/ui/start-button.png'),
            iconSize: 250,
            padding: const EdgeInsets.all(0),
            onPressed: _startGame,
          )
        ],
      ),
    );
  }
}

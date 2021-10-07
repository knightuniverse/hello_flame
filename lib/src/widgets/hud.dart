import 'package:flutter/material.dart';

import '/src/game/game.dart';

class Hud extends StatelessWidget {
  // An unique identified for this overlay.
  static const id = 'HUD';

  // Reference to parent game.
  final Langaw gameRef;

  const Hud(this.gameRef, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _toggleBGM() {
      //  TODO
    }

    void _toggleSFX() {
      //  TODO
    }

    const score = 8;
    const shadow = Shadow(
      blurRadius: 4,
      color: Color(0xff000000),
      offset: Offset.zero,
    );

    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          left: 0,
          top: 0,
          child: IconButton(
            icon: Image.asset('assets/images/ui/icon-music-enabled.png'),
            iconSize: 42,
            padding: const EdgeInsets.all(0),
            onPressed: _toggleBGM,
          ),
        ),
        Positioned(
          left: 42,
          top: 0,
          child: IconButton(
            icon: Image.asset('assets/images/ui/icon-sound-enabled.png'),
            iconSize: 42,
            padding: const EdgeInsets.all(0),
            onPressed: _toggleSFX,
          ),
        ),
        const Positioned(
          top: 0,
          right: 10,
          child: Text(
            'Score: $score',
            style: TextStyle(
              color: Color(0xffffffff),
              fontSize: 32,
              shadows: <Shadow>[
                shadow,
                shadow,
                shadow,
                shadow,
                shadow,
                shadow,
                shadow,
                shadow
              ],
            ),
          ),
        ),
      ],
    );
  }
}

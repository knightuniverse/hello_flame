import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/extensions.dart';

import 'game.dart';

enum FlyKind {
  drooledFly,
  hungryFly,
  machoFly,
  houseFly,
}

class Fly extends SpriteComponent {
  bool isDead = false;
  bool isOffScreen = false;
  double get speed => 42 * 3;

  Fly({
    Vector2? position,
    Vector2? size,
    Sprite? sprite,
  }) : super(
          position: position,
          size: size,
          sprite: sprite,
        );
}

class DrooledFly extends Fly {
  @override
  double get speed => 42 * 1.5;

  DrooledFly({
    Vector2? position,
    Vector2? size,
    Sprite? sprite,
  }) : super(
          position: position,
          size: size,
          sprite: sprite,
        );
}

// class HungryFly extends Fly {
//   // HungryFly({
//   //   required Langaw gameRef,
//   //   Vector2? position,
//   // }) : super(gameRef: gameRef, position: position) {
//   //   sprite = Sprite(
//   //     gameRef.images.fromCache(
//   //       'flies/hungry-fly-1.png',
//   //     ),
//   //   );
//   //   size = Vector2(
//   //     gameRef.tileSize * 1.1,
//   //     gameRef.tileSize * 1.1,
//   //   );
//   // }

//   HungryFly({
//     Vector2? position,
//     Vector2? size,
//     Sprite? sprite,
//   }) : super(
//           position: position,
//           size: size,
//           sprite: sprite,
//         );
// }

// class MachoFly extends Fly {
//   @override
//   double get speed => gameRef.tileSize * 2.5;

//   // MachoFly({
//   //   required Langaw gameRef,
//   //   Vector2? position,
//   // }) : super(gameRef: gameRef, position: position) {
//   //   sprite = Sprite(
//   //     gameRef.images.fromCache(
//   //       'flies/macho-fly-1.png',
//   //     ),
//   //   );
//   //   size = Vector2(
//   //     gameRef.tileSize * 1.35,
//   //     gameRef.tileSize * 1.35,
//   //   );
//   // }

//   MachoFly({
//     Vector2? position,
//     Vector2? size,
//     Sprite? sprite,
//   }) : super(
//           position: position,
//           size: size,
//           sprite: sprite,
//         );
// }

// class HouseFly extends Fly {
//   // HouseFly({
//   //   required Langaw gameRef,
//   //   Vector2? position,
//   // }) : super(gameRef: gameRef, position: position) {
//   //   sprite = Sprite(
//   //     gameRef.images.fromCache(
//   //       'flies/house-fly-1.png',
//   //     ),
//   //   );
//   //   size = Vector2(
//   //     gameRef.tileSize * 1,
//   //     gameRef.tileSize * 1,
//   //   );
//   // }

//   HouseFly({
//     Vector2? position,
//     Vector2? size,
//     Sprite? sprite,
//   }) : super(
//           position: position,
//           size: size,
//           sprite: sprite,
//         );
// }

class FliesManager extends Component with HasGameRef<Langaw> {
  // A list to hold data for all the enemies.
  // final List<Fly> _flies = <Fly>[];
  final Map<FlyKind, Image> _images = <FlyKind, Image>{};

  // Random generator required for randomly selecting enemy type.
  final Random _random = Random();

  // Timer to decide when to spawn next enemy.
  final Timer timer = Timer(2, repeat: true);

  FliesManager() {
    timer.callback = spawnRandomFly;
  }

  void spawnRandomFly() {
    gameRef.add(
      DrooledFly(
        position: Vector2(
          _random.nextDouble() * (gameRef.size.x - (gameRef.tileSize * 1.35)),
          (_random.nextDouble() *
                  (gameRef.size.y - (gameRef.tileSize * 2.85))) +
              (gameRef.tileSize * 1.5),
        ),
        size: Vector2(42, 42),
        sprite: Sprite(
          _images[FlyKind.drooledFly]!,
        ),
      ),
    );
  }

  @override
  void onMount() {
    if (_images.isEmpty) {
      _images.addAll({
        FlyKind.drooledFly: gameRef.images.fromCache(
          'flies/drooler-fly-1.png',
        ),
        FlyKind.hungryFly: gameRef.images.fromCache(
          'flies/hungry-fly-1.png',
        ),
        FlyKind.machoFly: gameRef.images.fromCache(
          'flies/macho-fly-1.png',
        ),
        FlyKind.houseFly: gameRef.images.fromCache(
          'flies/house-fly-1.png',
        ),
      });
    }

    // _timer.start();

    return super.onMount();

    //   if (_flies.isEmpty) {
    //     // As soon as this component is mounted, initilize all the data.
    //     _flies.addAll([
    //       DrooledFly(
    //         position: Vector2(
    //           _random.nextDouble() * (gameRef.size.x - (gameRef.tileSize * 1.35)),
    //           (_random.nextDouble() *
    //                   (gameRef.size.y - (gameRef.tileSize * 2.85))) +
    //               (gameRef.tileSize * 1.5),
    //         ),
    //       ),
    //       HungryFly(
    //         position: Vector2(
    //           _random.nextDouble() * (gameRef.size.x - (gameRef.tileSize * 1.35)),
    //           (_random.nextDouble() *
    //                   (gameRef.size.y - (gameRef.tileSize * 2.85))) +
    //               (gameRef.tileSize * 1.5),
    //         ),
    //       ),
    //       MachoFly(
    //         position: Vector2(
    //           _random.nextDouble() * (gameRef.size.x - (gameRef.tileSize * 1.35)),
    //           (_random.nextDouble() *
    //                   (gameRef.size.y - (gameRef.tileSize * 2.85))) +
    //               (gameRef.tileSize * 1.5),
    //         ),
    //       ),
    //       HouseFly(
    //         position: Vector2(
    //           _random.nextDouble() * (gameRef.size.x - (gameRef.tileSize * 1.35)),
    //           (_random.nextDouble() *
    //                   (gameRef.size.y - (gameRef.tileSize * 2.85))) +
    //               (gameRef.tileSize * 1.5),
    //         ),
    //       ),
    //     ]);
    //   }
  }

  @override
  void update(double dt) {
    timer.update(dt);
    super.update(dt);
  }
}

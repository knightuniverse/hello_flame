// ignore_for_file: file_names

import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';

import '/src/game/audio_manager.dart';

class Langaw extends FlameGame {
  static const _imageAssets = [
    'bg/backyard.png',
    'branding/title.png',
    'flies/agile-fly-1.png',
    'flies/agile-fly-2.png',
    'flies/agile-fly-dead.png',
    'flies/drooler-fly-1.png',
    'flies/drooler-fly-2.png',
    'flies/drooler-fly-dead.png',
    'flies/house-fly-1.png',
    'flies/house-fly-2.png',
    'flies/house-fly-dead.png',
    'flies/hungry-fly-1.png',
    'flies/hungry-fly-2.png',
    'flies/hungry-fly-dead.png',
    'flies/macho-fly-1.png',
    'flies/macho-fly-2.png',
    'flies/macho-fly-dead.png',
    'ui/callout.png',
    'ui/dialog-credits.png',
    'ui/dialog-help.png',
    'ui/icon-credits.png',
    'ui/icon-help.png',
    'ui/icon-music-disabled.png',
    'ui/icon-music-enabled.png',
    'ui/icon-sound-disabled.png',
    'ui/icon-sound-enabled.png',
    'ui/start-button.png',
  ];

  // List of all the audio assets.
  static const _audioAssets = [
    'bgm/home.mp3',
    'bgm/playing.mp3',
    'sfx/haha1.ogg',
    'sfx/haha2.ogg',
    'sfx/haha3.ogg',
    'sfx/haha4.ogg',
    'sfx/haha5.ogg',
    'sfx/ouch1.ogg',
    'sfx/ouch2.ogg',
    'sfx/ouch3.ogg',
    'sfx/ouch4.ogg',
    'sfx/ouch5.ogg',
    'sfx/ouch6.ogg',
    'sfx/ouch7.ogg',
    'sfx/ouch8.ogg',
    'sfx/ouch9.ogg',
    'sfx/ouch10.ogg',
    'sfx/ouch11.ogg',
  ];

  @override
  Future<void>? onLoad() async {
    await AudioManager.instance.init(_audioAssets);
    await images.loadAll(_imageAssets);

    // AudioManager.instance.startBgm('bgm/home.mp3');

    // Set a fixed viewport to avoid manually scaling
    // and handling different screen sizes.
    camera.viewport = FixedResolutionViewport(Vector2(375, 667));

    var background = SpriteComponent.fromImage(
      images.fromCache('bg/backyard.png'),
      position: Vector2(0, 0),
      size: size,
    );

    add(background);

    return super.onLoad();
  }
}

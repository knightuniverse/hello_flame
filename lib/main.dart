import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'src/game/langaw.dart';
import 'src/widgets/game_over.dart';
import 'src/widgets/main_menu.dart';

Langaw _langaw = Langaw();

Future<void> main() async {
  // Ensures that all bindings are initialized
  // before was start calling hive and flame code
  // dealing with platform channels.
  WidgetsFlutterBinding.ensureInitialized();

  // Makes the game full screen and landscape only.
  Flame.device.fullScreen();
  Flame.device.setPortrait();

  runApp(const MyGameApp());
}

class MyGameApp extends StatelessWidget {
  const MyGameApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Langaw',
      theme: ThemeData(
        fontFamily: 'Audiowide',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // Settings up some default theme for elevated buttons.
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            fixedSize: const Size(200, 60),
          ),
        ),
      ),
      home: Scaffold(
        body: GameWidget(
          // This will dislpay a loading bar until [DinoRun] completes
          // its onLoad method.
          loadingBuilder: (conetxt) => Center(
            child: Container(
              width: 200,
              child: const LinearProgressIndicator(),
            ),
          ),
          // Register all the overlays that will be used by this game.
          overlayBuilderMap: {
            MainMenu.id: (_, Langaw gameRef) => MainMenu(gameRef),
            // PauseMenu.id: (_, DinoRun gameRef) => PauseMenu(gameRef),
            // Hud.id: (_, DinoRun gameRef) => Hud(gameRef),
            GameOverMenu.id: (_, Langaw gameRef) => GameOverMenu(gameRef),
            // SettingsMenu.id: (_, DinoRun gameRef) => SettingsMenu(gameRef),
          },
          // By default MainMenu overlay will be active.
          initialActiveOverlays: const <String>[MainMenu.id],
          game: _langaw,
        ),
      ),
    );
  }
}

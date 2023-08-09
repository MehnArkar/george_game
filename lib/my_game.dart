import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:flutter/material.dart';
import 'package:george_game/dialog/dialog_box.dart';
import 'components/friend_component.dart';
import 'components/george_component.dart';
import 'loader/add_baked_good.dart';

class MyGeorgeGame extends FlameGame with TapDetector, HasCollisionDetection{

   ValueNotifier<int> bakegoodInventory = ValueNotifier<int>(0);

  GeorgeComponent george = GeorgeComponent();
  late SpriteComponent background;
  late DialogBox dialog;

  double mapHeight = 0;
  double mapWidth =0;
  
  late AudioPool collectAudio;

  @override
  Future<void> onLoad() async{
    await super.onLoad();

    final homeMap = await TiledComponent.load('map.tmx', Vector2.all(16));
    add(homeMap);
    mapWidth=homeMap.tileMap.map.width*16;
    mapHeight=homeMap.tileMap.map.height*16;

    dialog = DialogBox(text: 'Hello! I\'m george. I\'m 12 years old.', game: this);


    addBakedGood(homeMap, this);

    final friendGroup = homeMap.tileMap.getLayer<ObjectGroup>('friends');
    for(var friendBox in friendGroup!.objects){
      add(
          FriendComponent()
            ..position=Vector2(friendBox.x, friendBox.y)
            ..width=friendBox.width
            ..height=friendBox.height
            ..debugMode=true
      );
    }

    //Background section
    // Sprite backgroundSprite = await loadSprite('background.png');
    // background = SpriteComponent()
    //   ..sprite=backgroundSprite
    //   ..size=backgroundSprite.originalSize*1.5;
    // add(background);
    // overlays.add('cake_count');
    overlays.add('button_controller');



    //Audio Section
    FlameAudio.bgm.initialize();
    FlameAudio.audioCache.load('audio.mp3');


    add(george);

    add(dialog);
    
    collectAudio = await AudioPool.create(source: AssetSource('audio/collect_audio.mp3'), maxPlayers: 1);
    


    camera.followComponent(george,worldBounds:Rect.fromLTRB(0, 0, mapWidth, mapHeight));
  }

  @override
  void onTapUp(TapUpInfo info) {
    super.onTapUp(info);
    george.direction+=1;
    if(george.direction>4){
      george.direction=0;
    }
  }
}
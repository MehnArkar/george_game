import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import '../components/baked_good_component.dart';
import '../my_game.dart';

addBakedGood(TiledComponent homeMap,MyGeorgeGame game) async {
  final bakedGoodGroup = homeMap.tileMap.getLayer<ObjectGroup>('baked_goods');
  for(var goodBox in bakedGoodGroup!.objects){
    if(goodBox.name.isNotEmpty) {
      game.add(
          BakedGoodComponent()
            ..sprite = await game.loadSprite('${goodBox.name}.png',)
            ..position = Vector2(goodBox.x, goodBox.y)
            ..width = goodBox.width
            ..height = goodBox.height
            ..debugMode = true
      );
    }
  }
}
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import '../my_game.dart';

class BakedGoodComponent extends SpriteComponent with HasGameRef<MyGeorgeGame>,CollisionCallbacks{
  BakedGoodComponent(){add(RectangleHitbox());}

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    gameRef.bakegoodInventory.value++;
    print('Total bakedgood inventory : ${gameRef.bakegoodInventory.value}');
    gameRef.remove(this);

  }
}
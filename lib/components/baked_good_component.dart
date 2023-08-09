import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import '../my_game.dart';

class BakedGoodComponent extends SpriteComponent with HasGameRef<MyGeorgeGame>,CollisionCallbacks{
  BakedGoodComponent(){add(RectangleHitbox());}

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    FlameAudio.play('collect_audio.mp3');
    gameRef.bakegoodInventory.value++;
    gameRef.remove(this);

  }
}
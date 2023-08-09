import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class FriendComponent extends PositionComponent with CollisionCallbacks{
  FriendComponent(){
    add(RectangleHitbox());
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    print('I made new friend');
    super.onCollisionEnd(other);
  }

}
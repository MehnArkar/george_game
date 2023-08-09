import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import '../my_game.dart';

class GeorgeComponent extends SpriteAnimationComponent with HasGameRef<MyGeorgeGame>,CollisionCallbacks{
  GeorgeComponent() {
    debugMode = true;
    add(RectangleHitbox());
  }


  late SpriteAnimation downAnimation;
  late SpriteAnimation upAnimation;
  late SpriteAnimation leftAnimation;
  late SpriteAnimation rightAnimation;
  late SpriteAnimation idleAnimation;

  int direction = 0;
  final double animationSpeed = 0.1;
  final double characterSize = 80;
  final double characterSpeed = 50;

  @override
  Future<void> onLoad() async{
    await super.onLoad();

    final spriteSheet = SpriteSheet(image: await gameRef.images.load('george.png'), srcSize: Vector2(48, 48));
    downAnimation = spriteSheet.createAnimation(row: 0, stepTime: animationSpeed,to: 4);
    upAnimation = spriteSheet.createAnimation(row: 2, stepTime: animationSpeed,to: 4);
    leftAnimation = spriteSheet.createAnimation(row: 1, stepTime: animationSpeed,to: 4);
    rightAnimation = spriteSheet.createAnimation(row: 3, stepTime: animationSpeed,to: 4);
    idleAnimation = spriteSheet.createAnimation(row: 0, stepTime: animationSpeed,to: 1);

    animation=downAnimation;
    position=Vector2(gameRef.mapWidth/2,gameRef.mapHeight/2);
    size = Vector2.all(characterSize);

  }



  @override
  void update(double dt) {
    super.update(dt);
    switch(direction){
      case 0:
        animation=idleAnimation;
        break;
      case 1:
        animation=downAnimation;
        if(y<gameRef.mapHeight-width) {
          y += dt*characterSpeed;
        }
        break;
      case 2:
        animation=leftAnimation;
        if(x>0) {
          x -= dt*characterSpeed;
        }
        break;
      case 3:
        animation=upAnimation;
        if(y>0) {
          y -= dt*characterSpeed;
        }
        break;
      case 4:
        animation = rightAnimation;
        if(x < gameRef.mapWidth - width) {
          x+= dt*characterSpeed;
        }
        break;
    }
  }



}
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'my_game.dart';

class ButtonController extends StatefulWidget {
  final MyGeorgeGame game;
  const ButtonController({super.key,required this.game});

  @override
  State<ButtonController> createState() => _ButtonControllerState();
}

class _ButtonControllerState extends State<ButtonController> {
  int cake = 0;

  @override
  void initState() {
    super.initState();
    widget.game.bakegoodInventory.addListener(() {
      setState(() {
        cake = widget.game.bakegoodInventory.value;
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 25),
              child: Row(
                children: [
                  Container(
                    decoration:BoxDecoration(
                      color:Colors.white.withOpacity(0.5),
                      shape: BoxShape.circle
              ),
                    child: IconButton(
                        onPressed: (){
                          FlameAudio.bgm.play('audio.mp3');
                        },
                        icon: const Icon(Icons.volume_up,size: 25,color: Colors.pink,)
                    ),
                  ),
                  const SizedBox(width: 25,),
                  Container(
                      decoration:BoxDecoration(
                          color:Colors.white.withOpacity(0.5),
                          shape: BoxShape.circle,
                      ),
                    child: IconButton(
                        onPressed: (){
                          FlameAudio.bgm.stop();
                        },
                        icon: const Icon(Icons.volume_off,size: 25,color: Colors.pink,)
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 0),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child:
                    Row(
                        children:[
                          Image.asset('assets/images/apple_pie.png',width: 50,height: 50,),
                          const SizedBox(width: 15,),
                          Text(cake.toString(),style: const TextStyle(fontSize: 25,fontWeight: FontWeight.w700,color: Colors.pink),)
                        ]
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  cakeWidget(){
    
  }
}

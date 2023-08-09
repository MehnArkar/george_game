import 'package:flutter/material.dart';

class CakeCount extends StatefulWidget {
  final int count;
  const CakeCount({super.key,required this.count});

  @override
  State<CakeCount> createState() => _CakeCountState();
}

class _CakeCountState extends State<CakeCount> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 25,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/apple_pie.png'),
          const SizedBox(width: 25,),
          Text(widget.count.toString(),style: const TextStyle(color: Colors.pink,fontWeight: FontWeight.bold,fontSize: 20),)
        ],
      ),
    );
  }
}

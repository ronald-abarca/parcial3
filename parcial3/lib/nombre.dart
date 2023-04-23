import 'package:flutter/material.dart';

class nombre extends StatelessWidget {
  const nombre({super.key});

  @override
  Widget build(BuildContext context) {
    return getLista();
  }

    Widget getLista(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Container(
          width: 400,
          height: 400,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.person_pin_sharp,
                size: 100,
              ),
              Text(
                "Desarrollador",
                style: TextStyle(
                  fontSize: 23
                ),
              ),
              Text(
                "Ronald Heriberto Abarca Rivas",
                style: TextStyle(
                  fontSize: 23
                ),
              ),
              Text(
                "25-1599-2019",
                style: TextStyle(
                  fontSize: 23
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:parcial3/datos.dart';
import 'package:parcial3/nombre.dart';
import 'temas/colores.dart';


class principal extends StatefulWidget {
  const principal({super.key});

  @override
  State<principal> createState() => _principalState();
}

class _principalState extends State<principal> {
  int MenuActivo=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
 


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar:getAppBar(),
      body: MenuActivo==0? datos():nombre(),
    );
  }

   PreferredSizeWidget getAppBar(){
    return AppBar(
      backgroundColor: bgColor,
      centerTitle: true,
      title: Container(
        width: 400,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.videogame_asset_rounded,size: 50,color: primario,),
            Container(
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: blanco.withOpacity(0.1)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        MenuActivo=0;
                      });
                    },
                    child: Container(
                      width: 75,
                      height: 28,
                      decoration: BoxDecoration(
                        color: MenuActivo==0? primario.withOpacity(0.5):Colors.transparent,
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: Center(
                        child: Text("Datos",style: TextStyle(fontSize: 12)),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        MenuActivo=1;
                      });
                    },
                    child: Container(
                      width: 75,
                      height: 28,
                      decoration: BoxDecoration(
                        color: MenuActivo==1? primario.withOpacity(0.5):Colors.transparent,
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: Center(
                        child: Text("Nombre",style: TextStyle(fontSize: 12)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}
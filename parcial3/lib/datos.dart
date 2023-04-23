import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:parcial3/modelo/juego.dart';
import 'temas/colores.dart';

class datos extends StatefulWidget {
  const datos({super.key});

  @override
  State<datos> createState() => _datosState();
}

class _datosState extends State<datos> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
       _listadojuegos=_getjuegos();
  }
  
  @override
  Widget build(BuildContext context) {
    return getBody();
  }

    Widget getBody(){
    List<Widget> _listadodejuegos(List<juego>data){
      List<Widget> juegos=[];
      for(var item in data){
        juegos.add(
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              color: bgColor2,
              child: Column(
                children: [
                  Image.network(
                    item.thumbnail,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(height: 10),
                  Text(item.title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  SizedBox(height: 10),
                  Text(item.shortdescription),
                  SizedBox(height: 10)
                ],
              )
            ),
          )
        );
      }
      return juegos;
    }
    return FutureBuilder(
          future: _listadojuegos,
          builder: (context, snapshot) {
            if(snapshot.hasData){
              //print(snapshot.data);
              return Column(
                children: [
                  SizedBox(height: 20,),
                  Text('Api Juegos ',style: TextStyle(fontSize: 30,color: blanco),),
                  SizedBox(height: 20,),
                  Container(
                    height: 450,
                    child: ListView(
                      children: _listadodejuegos(snapshot.requireData),
                    ),
                  ),
                ],
              );
            }else if(snapshot.hasError){
              print(snapshot.error);
              return Text("error");
            }
            return Center(child: CircularProgressIndicator(),);
          },
    );
  }

 late Future<List<juego>> _listadojuegos;

  Future<List<juego>> _getjuegos() async{

    final respponse= await http.get(Uri.parse('https://www.freetogame.com/api/games'));

    List<juego> gifs=[];
    if(respponse.statusCode==200){
      String body=utf8.decode(respponse.bodyBytes);

      final jsonData=jsonDecode(body);
      //print(jsonData);
      for (var item in jsonData){
        gifs.add(juego(title: item['title'], thumbnail: item['thumbnail'], shortdescription: item['short_description']));
      }
      //print(gifs[0].nombre+" "+gifs[0].url);
    }else{
      throw Exception("fallo al conectar");
    }

    return gifs;
  }

  

}
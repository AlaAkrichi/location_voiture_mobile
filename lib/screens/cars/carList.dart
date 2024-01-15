import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; 
class CarList extends StatefulWidget {
  const CarList({super.key});

  @override
  State<CarList> createState() => _CarListState();
}

class _CarListState extends State<CarList> {
  List<dynamic> cars=[];
  bool loading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('object');
    getCars();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:const  Text("voitures")
        ),
        body: loading?  const Center(
          child: Text("loading ")
          ):
        ListView.builder(
          itemCount: cars.length,
        itemBuilder: (context,index){
          final car = cars[index];
          return Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: ListTile(
              tileColor: car["etat"]?Colors.red:Colors.blue,
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(car["image"])
                ),
              title: Text("Model :${car["model"]}"),
              subtitle: Text("Marque : ${car["marque"]}"),
              onTap: (){
                Navigator.pushNamed(context, "/carDetails",arguments: car
                );
              },
            ),
          );
        }
        ),
        floatingActionButton: FloatingActionButton(
          onPressed:() {
            Navigator.pushNamed(context,"/addcar");
            },
          child: const Icon(Icons.add),
          ),
      );

  }
  void getCars() async{
    const url = "10.0.2.2:8000";
    final uri = Uri.http(url,"/api/voiture/");
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    print(json);
    setState(() {
      cars=json;
      loading=false;
    });
    print("fetch completed");
  }
}
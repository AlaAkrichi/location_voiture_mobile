import 'package:flutter/material.dart';

class CarDetails extends StatefulWidget {
  const CarDetails({super.key});

  @override
  State<CarDetails> createState() => _CarDetailsState();
}

class _CarDetailsState extends State<CarDetails> {
  
  @override
  Widget build(BuildContext context) {
  final  car = ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>?;

    return  Scaffold(
      appBar: AppBar(title: const Text("car details"),),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(car?["image"],width: 150,height: 150),
          const SizedBox(height: 20),
          Center(
            child: 
              Wrap(
                direction: Axis.horizontal,
                spacing: 20.0,
                runSpacing: 20.0,
                children: [
                  Text("numero imatricule : ${car?["Num_imma"]}"),
                  const SizedBox(height:30),
                  Text("Model : ${car?["model"]}"),
                  const SizedBox(height:30),
                  Text("Marque : ${car?["marque"]}"),
                  const SizedBox(height:30),
                  Text("le prix de location : ${car?["prix_location"]}"),
                  const SizedBox(height:30),
                  Text("kilometrage : ${car?["kilometrage"]}"),
                  const SizedBox(height:30),
                  Text(car?["etat"]?" disponible  ":" non disponible")
                ],
              ),
  
          )
        ],
      ) 
      )
      );
  }
}
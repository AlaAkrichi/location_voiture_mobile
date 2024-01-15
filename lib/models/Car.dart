// ignore: file_names
class Car {
  int  id ;
  String numImma;
  String model;
  String marque;
  int prixLocation;
  int kilometrage;
  bool etat;
  String image;
    Car({
     required this.id, 
     required this.numImma, 
     required this.etat, 
     required this.image,
     required this.kilometrage,
     required this.prixLocation,
     required this.marque,
     required this.model
  });
get getId=>id;
  get getNumImma => numImma;

 set setNumImma( numImma) => this.numImma = numImma;

  get getModel => model;

 set setModel( model) => this.model = model;

  get getMarque => marque;

 set setMarque( marque) => this.marque = marque;

  get getPrixLocation => prixLocation;

 set setPrixLocation( prixLocation) => this.prixLocation = prixLocation;

  get getKilometrage => kilometrage;

 set setKilometrage( kilometrage) => this.kilometrage = kilometrage;

  get getEtat => etat;

 set setEtat( etat) => this.etat = etat;

  get getImage => image;

 set setImage( image) => this.image = image;


}
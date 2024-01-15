import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
final _formKey = GlobalKey<FormState>();
class AddCar extends StatefulWidget {
  const AddCar({super.key});

  @override
  State<AddCar> createState() => _AddCarState();
}

class _AddCarState extends State<AddCar> {
  var _filePath="";
  TextEditingController platNumberController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController kilometersController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add a car")),
      body: Center(child: Form(
        key : _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: platNumberController,
                decoration: const  InputDecoration(
                  hintText: "Plat number",
                  border: OutlineInputBorder()
                  ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Enter some data";
                  }else{
                    return null;
                  }
                },
              ),
              const SizedBox(height: 15,),
              TextFormField(
                controller: modelController,
                 decoration: const  InputDecoration(
                  hintText: "Model",
                  border: OutlineInputBorder()
                  ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Enter some data";
                  }else{
                    return null;
                  }
                },
              ),
              const SizedBox(height: 15,),
              TextFormField(
                controller: brandController ,
                 decoration: const  InputDecoration(
                  hintText: "Brand",
                  border: OutlineInputBorder()
                  ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Enter some data";
                  }else{
                    return null;
                  }
                },
              ),
              const SizedBox(height: 15,),
              TextFormField(
                controller: priceController,
                 decoration: const  InputDecoration(
                  hintText: "price",
                  border: OutlineInputBorder()
                  ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Enter some data";
                  }else{
                    return null;
                  }
                },
              ),
                            const SizedBox(height: 15,),
              TextFormField(
                controller: kilometersController,
                 decoration: const  InputDecoration(
                  hintText: "Kilometers ",
                  border: OutlineInputBorder()
                  ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Enter some data";
                  }else{
                    return null;
                  }
                },
              ),
              const SizedBox(height: 15,),
              ElevatedButton(onPressed: _filePicker, child: const Text("pick a file")),
              Text(_filePath),
              const SizedBox(height: 15,),
              ElevatedButton(
                style:   ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                  textStyle: MaterialStateProperty.all<TextStyle>(
                    const TextStyle(
                      color: Colors.black,
                    )
                  ),
                ),
                onPressed: (){
                  if(_formKey.currentState!.validate()){
                    _submitForm();
                  }
                },
                child: const Text("submit"),
              )
            ],
          ),
        ),
      )
      ),
    );
  }
  void _filePicker()async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(
    ) ;
    if(result !=null && result.files.single.path !=null){ 
    PlatformFile file = result.files.first;
    File _file=File(result.files.single.path!);
    setState(() {
      _filePath = _file.path;
    });
    }
  }void _submitForm() async {
      const url = "10.0.2.2:8000";
    final uri = Uri.http(url,"/api/voiture/"); // Replace with your server endpoint

    // Create a multipart request
    var request = http.MultipartRequest('POST', uri);

    // Add form fields
    request.fields['Num_imma'] = platNumberController.text;
    request.fields['model'] = modelController.text;
    request.fields['marque'] = brandController.text;
    request.fields['prix_location'] = priceController.text;
    request.fields['kilometrage'] = kilometersController.text;

    // Add file to the request
    if (_filePath.isNotEmpty) {
      request.files.add(
        await http.MultipartFile.fromPath(
          'image', // This should match the name expected by your server
          _filePath,
        ),
      );
    }

    // Send the request
    try {
      final response = await request.send();

      if (response.statusCode == 200) {
        // Handle a successful response
        print('Success!');
      } else {
        // Handle an error response
        print('Error: ${response.reasonPhrase}');
      }
    } catch (error) {
      // Handle errors during the request
      print('Error: $error');
    }
  }
}

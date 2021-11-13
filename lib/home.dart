import 'dart:ui';

import 'package:dad_jokes/components.dart';
import 'package:dad_jokes/liquid_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:liquid_swipe/liquid_swipe.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // image url
  // Initial joke 😀
  var joke = 'This app will makes you smile 😀';
  // creating url using URI-which locates the resources in the web page
  // In our case JSON file
  var url = Uri.parse('https://icanhazdadjoke.com');

  var image = 'https://source.unsplash.com/random';
  var image_url = Uri.parse('https://api.thecatapi.com/v1/images/search');

  // Creating a function to get the joke from the API
  // Main logic behind this application
  Future getRandomJoke() async {
    // This line getting the information from the url we provided
    var response = await http.get(url, headers: {'Accept': 'Application/json'});
    // Checking whether the request succeeded or not
    // 200 means success
    if (response.statusCode == 200) {
      // var jsonFile = convert.jsonDecode(response.body) as Map<String, dynamic>;

      // We are converting the response file to a json file
      // Our required content will be inside the body. So that's why we are targeting that
      var jsonFile = convert.jsonDecode(response.body);
      // Now returing the 'joke' from the json file
      joke = jsonFile['joke'].toString();
    } else {
      // If the request fails
      // It will return this joke 😀
      joke = 'You are beautiful :)';
    }
  }

  Future getRandomImage() async {
    var imageResponse = await http.get(image_url,
        headers: {'api_key': 'a7449f7e-ecf3-4dc0-a250-db075b32761f'});
    if (imageResponse.statusCode == 200) {
      var jsonFile_image = convert.jsonDecode(imageResponse.body);
      image = jsonFile_image[0]['url'].toString();

      // image = jsonFile_image['url'].toString();
    } else {
      image = 'https://source.unsplash.com/random';
    }
  }

  // Runs first before the build
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // To get the joke on the first click
    // If we miss this we will get the joke on the second click for the first time.
    getRandomJoke();
    getRandomImage();
  }

  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LiquidSwipe(
        pages: [
          Stack(
            children: [
              Liquid_slide(image: image),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  color: Colors.black38,
                  child: Text(
                    joke,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
        enableLoop: true,
        waveType: WaveType.liquidReveal,
        slideIconWidget: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        onPageChangeCallback: (int val) {
          setState(() {
            getRandomJoke();
            getRandomImage();
          });
        },
      ),
    );
  }
}

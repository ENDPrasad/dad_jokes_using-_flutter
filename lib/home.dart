import 'package:dad_jokes/components.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Initial joke 😀
  var joke = 'This app will makes you smile 😀';
  // creating url using URI-which locates the resources in the web page
  // In our case JSON file
  var url = Uri.parse('https://icanhazdadjoke.com');

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

  // Runs first before the build
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // To get the joke on the first click
    // If we miss this we will get the joke on the second click for the first time.
    getRandomJoke();
  }

  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: const Text('Dad Jokes'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        // height: double.infinity,
        margin: const EdgeInsets.all(20.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Here is your joke',
              style: TextStyle(
                color: Colors.black45,
                fontSize: 18.0,
                fontFamily: 'Verdana',
              ),
            ),
            // const Divider(
            //   thickness: 5.0,
            //   indent: 5.0,
            //   color: Colors.black45,
            // ),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              // height: 250.0,
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(10.0),
              child: Text(
                joke.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Verdana',
                ),
              ),
            ),
            // Button to trigger the new joke
            GestureDetector(
              onTap: () {
                setState(() {
                  getRandomJoke();
                });
              },
              child: CustomButtonWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

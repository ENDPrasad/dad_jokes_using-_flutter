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
  var joke = 'This app will makes you smile 😀';
  var url = Uri.parse('https://icanhazdadjoke.com');

  Future<String> getRandomJoke() async {
    var response = await http.get(url, headers: {'Accept': 'Application/json'});
    if (response.statusCode == 200) {
      // var jsonFile = convert.jsonDecode(response.body) as Map<String, dynamic>;
      var jsonFile = convert.jsonDecode(response.body);
      return jsonFile['joke'].toString();
    } else {
      return 'You are beautiful :)';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff334756),
      appBar: AppBar(
        title: const Text('Dad Jokes'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          margin: const EdgeInsets.all(20.0),
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Here is your joke',
                style: TextStyle(
                  color: Colors.white70,
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
                    color: Colors.white70,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Verdana',
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  dynamic temp;
                  try {
                    temp = await getRandomJoke();
                  } finally {
                    setState(() {
                      joke = temp;
                    });
                  }
                },
                child: CustomButtonWidget(name: 'Get a joke'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

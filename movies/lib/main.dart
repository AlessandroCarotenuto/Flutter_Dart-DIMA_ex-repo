import 'package:flutter/material.dart';
import 'package:movies/movies_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(title: const Text("Movies")),
        body: const Movies()
      )
    );
  }
}

class Movies extends StatefulWidget {
  const Movies({Key? key}) : super(key: key);

  @override
  MoviesState createState() => MoviesState();
}

class MoviesState extends State<Movies> {
  List movies = [];
  
  void updateMovies(String search) {
    searchMovies(search).then((newMovies) => setState((){
      movies = newMovies;      
    })); 
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w200, color: Colors.black),
          onChanged: updateMovies
        ),
        
        Expanded(child: ListView.builder(
          itemCount: movies.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              contentPadding: const EdgeInsets.all(10),
              title: Text(movies[index]["Title"]),
              trailing: Image.network(
                movies[index]["Poster"],
                fit: BoxFit.cover,
                height: 100,
                width: 100
                ),
            );
          }
        )),
        )
      ]
    )
  }
}


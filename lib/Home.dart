import 'package:flutter/material.dart';
import 'package:gameofthorens/Cast.dart';
import 'package:gameofthorens/show.dart';


import 'package:http/http.dart' as http;


class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // String url = "http://api.tvmaze.com/singlesearch/shows?q=game-of-thrones&embed=episodes";
  // "http://api.tvmaze.com/singlesearch/shows?q=game-of-thrones&embed=episodes";
  String url = "http://api.tvmaze.com/shows/1/cast";

  List<Cast> cast;

  Future fetchPosts() async {
    final response = await http.get(url);

    setState(() {
      cast = castFromJson(response.body);
    });
    // for (int i = 0; i < cast.length; i++) {
    //   print(cast[i].character.name);
    // }
  }
  //   fetchepisode() async {
  //   var res = await http.get(url);
  //   print(res.body);
  //   var body = res.body;
  //   // var decode = jsonDecode(body);
  //   // post = Post.fromJson(decode);
  //   // got =GOT.fromJson(decode);
  //   // episodes=Episodes.fromJson(decode);
  //   // thorn=Thorn.fromJson(decode);
  //   cast=Cast.fromJson(decode);

  //   // print(decode);
  //   setState(() {});
  // }

  @override
  void initState() {
    super.initState();
    // fetchepisode();
    this.fetchPosts();

    // this.fecthpost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("APi practice"),
      ),
      body: Container(
          child: cast != null
              ? ListView(
                  children: cast.map((f) {
                    return ListTile(
                      title: Text(f.person.name),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Show(
                                      cast: f,
                                    )));
                      },
                    );
                  }).toList(),
                )
              : CircularProgressIndicator()),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.refresh),
      ),
    );
  }

//   Widget mycard() {
//     return SingleChildScrollView(
//       child: Card(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               SizedBox(
//                 height: 10,
//               ),
//               CircleAvatar(
//                 radius: 100,
//                 backgroundImage: NetworkImage(""),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 "",
//                 // got.name,
//                 style: TextStyle(
//                     color: Colors.green,
//                     fontSize: 25,
//                     fontWeight: FontWeight.bold),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 post.title,
//                 // "Runtime :${got.runtime.toString()} minutes",
//                 style: TextStyle(
//                     color: Colors.blue,
//                     fontSize: 25,
//                     fontWeight: FontWeight.bold),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(""),
//               SizedBox(
//                 height: 3,
//               ),
//               // RaisedButton(
//               //   onPressed: () {
//               //     Navigator.push(
//               //         context,
//               //         MaterialPageRoute(
//               //             builder: (context) => Episode(
//               //                   episodes: got.eEmbedded.episodes,
//               //                   image: got.image,

//               //                 )));
//               //   },
//               //   color: Colors.red,
//               //   child: Text("All Episodes"),
//               // )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'datasource.dart';

void main(){
  runApp(MyApp());
}


  class MyApp extends StatelessWidget {
    const MyApp({ Key? key }) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: "Photo gallery",
        theme: ThemeData(
          appBarTheme: AppBarTheme(elevation: 0),
          accentColor: Colors.blueAccent,
          primaryColor: Colors.white,
        ),
      home: HomeView(),
      );
    }
  }
  class HomeView extends StatelessWidget {
    const HomeView({ Key? key }) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFB74B1C),
          title: Text("Gallery", style: TextStyle(color: Colors.white70),),
          actions: [
            IconButton(
            onPressed: () {},
            icon:Icon(Icons.camera_alt_outlined,),
            )
          ],
          bottom:PreferredSize(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Today", 
                style: TextStyle(fontSize: 30, color: Color(0xFFFFFFFF)),),
              ),
            ),
            preferredSize: Size.fromHeight(50),
            ),
        ),
        body: SafeArea(
          child: ListView.builder(
            itemCount: posts.length,
            itemBuilder: (BuildContext context, int index){
              var post=posts[index];
              return InkWell(
                onTap: (){
                  showBottomSheet(context: context, builder: (context){
return Container(
  decoration: BoxDecoration(image: DecorationImage(image: AssetImage(post["image"]))),
);
                  });
                },
                child: GalleryCard(
                  name: post["name"],
                  profile: post["profile"],
                  location: post["location"],
                  image: post["image"],
                  comments: post["comments"],
                  likes: post["likes"],
                  ),
              );
            },
    
          ) 
        ,),
      );
    }
  }

  class GalleryCard extends StatelessWidget {
    const GalleryCard({ Key? key, required this.name,
     required this.location, 
     required this.profile, 
     required this.image,
     required this.comments,
     required this.likes,
     
        }) : super(key: key);

    final String name;
    final String location;
    final String profile;
    final String image;
    final int comments;
    final int likes;
  
    @override
    Widget build(BuildContext context) {
            return Card(
          child: Column(children: [
            ListTile(
              leading: CircleAvatar(backgroundImage: AssetImage(profile),),
              title: Text("$name"),
              subtitle: Row(children: [
                Icon(Icons.location_pin),
                Text("$location")
              ],),
            ),
            Image.asset(image),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.favorite, color: Colors.red,),
                    Text("$likes")
                  ],
                ),
                Row(
                  children: [
                    Icon(CupertinoIcons.chat_bubble_fill, color: Colors.grey,),
                    Text("$comments")
                  ],
                )
              ],
            ),
            SizedBox(height: 20,)
          ],)
          
        );
    }
  }
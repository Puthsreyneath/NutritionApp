import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_clone_1/data/video_data.dart';
import 'package:test_clone_1/pages/video_page.dart';

import '../Recipes_part/explore.dart';

class ExercisePage extends StatefulWidget {
  const ExercisePage({Key? key}) : super(key: key);

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _builtAppBar(context),
      body: _builtBody(),
    );
  }

  AppBar _builtAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xffE3B7A0),
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
              Explore()), (Route<dynamic> route) => false);
        },
        icon: Icon(
          Icons.arrow_back,
        ),
      ),
      centerTitle: true,
      title: Text(
        "Exercise",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search_rounded,
              color: Colors.white,
            )),
      ],
    );
  }

  Widget _builtBody() {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 20)),
          Container(
            child: TabBar(
                unselectedLabelColor: Colors.grey,
                labelColor: Color(0xffBF9270),
                labelStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Color(0xffBF9270),
                indicatorWeight: 5,
                tabs: [
                  Tab(
                    text: 'Article',
                  ),
                  Tab(
                    text: 'Video',
                  ),
                ]),
          ),
          Expanded(
            child: TabBarView(
              children: [
                _buildArticle(),
                _buildVideoList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Text(
        title,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
      ),
    );
  }

  Widget _buildArticle(){
    // MediaQuery to get Device Width
    double width = MediaQuery.of(context).size.width * 0.6;
    return Container(
      child: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 20)),
            Row(
              mainAxisAlignment:  MainAxisAlignment.spaceBetween,
              children: [
                _buildTitle('Blog'),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("See more"),
                    style: ElevatedButton.styleFrom(
                        padding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        textStyle: TextStyle(
                          fontSize: 18,
                        ),
                        primary: Color(0xffE3B7A0)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: videoList.length,
                itemBuilder: (context, index){
                  return Container(
                    width: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(videoList[index].image),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                        color: Colors.black54,
                        blurRadius: 4,
                        offset: Offset(2, 2),
                    )]
                    ),
                    margin: EdgeInsets.only(top: 25, right: 10,left: 20),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Positioned(
                          child: IconButton(
                            icon: Icon(Icons.arrow_circle_right),
                            onPressed: (){},
                            iconSize: 40,
                            color: Colors.green,
                          ),
                        bottom: 8,
                        right: 8,)
                      ],
                    ),
                  );
        },

              ),
            ),
           Padding(
             padding: EdgeInsets.only(top: 20),
             child: Row(
               children: [
                 _buildTitle('Article'),
               ],
             ),
           ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
              itemCount: articleList.length,
                itemBuilder: (context, index){
                  return GestureDetector(
                    onTap: () {
                      // This Will Call When User Click On ListView Item
                      showDialogFunc(context, articleList[index]['image'],articleList[index]['title'],articleList[index]['des']);
                    },
                    child: Card(
                      elevation:6 ,
                      shadowColor: Colors.grey,
                  child: Row(
                  children: <Widget>[
                    Container(
                    width: 100,
                    height: 100,
                    padding:const EdgeInsets.all(10.0) ,
                    child: Image.network(articleList[index]['image'],),
                  ),
                  Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                  Text(
                    articleList[index]['title'],
                  style: TextStyle(
                  fontSize: 25,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  ),
                  ),
                  SizedBox(
                  height: 10,
                  ),
                  Container(
                  width: width,
                  child: Text(
                    articleList[index]['des'],
                  maxLines: 3,
                  style: TextStyle(
                  fontSize: 15, color: Colors.green),
                  ),
                  ),
                  ],
                  ),
                  )
                  ],
                  )
                  )
                  );
    }
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildVideoList() {
    return Padding(
        padding: EdgeInsets.only(top: 20),
        child: ListView.builder(
          itemCount: videoList.length,
          itemBuilder: (context, index){
            return Column(
              children: [
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(videoList[index].image),
                      fit:  BoxFit.fill
                    )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(videoList[index].name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                      Expanded(child: Center()),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context)=> VideoPage(name: videoList[index].name, videoUrl: videoList[index].video)));
                          },
                          icon: Icon(Icons.play_circle_outline)),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 30)),
              ],
            );
          }
        ),
    );
  }

  List articleList = [
    {'title': "Success", 'image': 'https://bit.ly/3aZHC9f' , 'des': 'Push yourself, because no one else is going to do it for you.'},
    {'title': "Motivation", 'image': 'https://bit.ly/3dpRNEN', 'des': 'Your limitation—it is  only your imagination.'},
    {'title': "Hard Work", 'image': 'https://bit.ly/3pfx5dg', 'des': 'Hard Work changes the life.'},
    {'title': "Decision", 'image': 'https://bit.ly/3w1pRxn', 'des': 'Sometimes it is the smallest decisions that can change your life forever.'},
    {'title': "Confidence", 'image': 'https://bit.ly/3AeuVkA', 'des': 'Confidence is the most beautiful thing you can possess'},
    {'title': "Business", 'image': 'https://bit.ly/3PcJpWo', 'des': 'A big business starts small.'},
    {'title': "Team Work", 'image': 'https://bit.ly/3QD1HkB', 'des': 'Talent wins games, but teamwork and intelligence win championships.'},
  ];

  // This is a block of Model Dialog
  showDialogFunc(context, img, title, desc) {
    return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(15),
              height: 400,
              width: MediaQuery.of(context).size.width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      img,
                      width: 200,
                      height: 200,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    // width: 200,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        desc,
                        maxLines: 3,
                        style: TextStyle(fontSize: 15, color: Colors.green),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_clone_1/data/fruit_data.dart';

import '../Recipes_part/explore.dart';
import 'detail_page.dart';

class DairyPage extends StatelessWidget {
  const DairyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _builtAppBar(context),
      body: _builtBody(),
    );
  }
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
      "Dairy",
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
    length: 4,
    child: Container(
      margin: EdgeInsets.all(5),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 20, bottom: 10),
            child: TabBar(
              isScrollable: true,
              unselectedLabelColor: Color(0xffE3B7A0),
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color(0xffE3B7A0),
              ),
              tabs: [
                Tab(
                  child: Container(
                    height: 50,
                    width:  100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: Color(0xffE3B7A0),
                        width: 1,
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Text("Fruit"),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    height: 50,
                    width:  100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: Color(0xffE3B7A0),
                        width: 1,
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Text("Vegetable"),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    height: 50,
                    width:  100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: Color(0xffE3B7A0),
                        width: 1,
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Text("Meat"),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    height: 50,
                    width:  100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: Color(0xffE3B7A0),
                        width: 1,
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Row(
                        mainAxisAlignment:  MainAxisAlignment.center,
                        children: [
                          Text("Milk"),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: fruitList.length,
                  itemBuilder: (context, index){
                    final fruit_index = fruitList[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                        side: BorderSide(color: Color(0xffE3B7A0), width: 2,),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 24,
                          backgroundImage: NetworkImage(fruit_index.image),
                          backgroundColor: Colors.white,
                        ),
                        title: Text(fruit_index.name),
                        subtitle: Text(fruit_index.calory),
                        trailing: Icon(CupertinoIcons.chevron_forward),
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DetailPage(fruitModel: fruit_index),
                          ));
                        },
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: fruitList.length,
                  itemBuilder: (context, index){
                    final fruit_index = fruitList[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                        side: BorderSide(color: Color(0xffE3B7A0), width: 2,),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 24,
                          backgroundImage: NetworkImage(fruit_index.image),
                          backgroundColor: Colors.white,
                        ),
                        title: Text(fruit_index.name),
                        subtitle: Text(fruit_index.calory),
                        trailing: Icon(CupertinoIcons.chevron_forward),
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DetailPage(fruitModel: fruit_index),
                          ));
                        },
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: fruitList.length,
                  itemBuilder: (context, index){
                    final fruit_index = fruitList[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                        side: BorderSide(color: Color(0xffE3B7A0), width: 2,),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 24,
                          backgroundImage: NetworkImage(fruit_index.image),
                          backgroundColor: Colors.white,
                        ),
                        title: Text(fruit_index.name),
                        subtitle: Text(fruit_index.calory),
                        trailing: Icon(CupertinoIcons.chevron_forward),
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DetailPage(fruitModel: fruit_index),
                          ));
                        },
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: fruitList.length,
                  itemBuilder: (context, index){
                    final fruit_index = fruitList[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                        side: BorderSide(color: Color(0xffE3B7A0), width: 2,),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 24,
                          backgroundImage: NetworkImage(fruit_index.image),
                          backgroundColor: Colors.white,
                        ),
                        title: Text(fruit_index.name),
                        subtitle: Text(fruit_index.calory),
                        trailing: Icon(CupertinoIcons.chevron_forward),
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DetailPage(fruitModel: fruit_index),
                          ));
                        },
                      ),
                    );
                  },
                ),
              ),
            ]),
          ),
        ],
      ),
    ),
  );
}



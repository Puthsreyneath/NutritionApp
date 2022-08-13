import 'package:flutter/material.dart';
import 'package:test_clone_1/model/fruit_model.dart';
class DetailPage extends StatelessWidget {
  final FruitModel fruitModel;
  const DetailPage({Key? key, required this.fruitModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(fruitModel),
      body: _buildBody(fruitModel),
    );
  }
}

AppBar _buildAppBar(FruitModel fruitModel){
  return AppBar(
    title: Text(fruitModel.name),
  );
}

Widget _buildBody(FruitModel fruitModel){
  return SingleChildScrollView(
    child: Column(
      children: [
        Image.network(fruitModel.image),
        Text(fruitModel.name, style: TextStyle(fontSize: 30),),
        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.only(left:50),
          child: Row(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 3, style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(3)),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text("Vitamin", style: TextStyle(fontSize: 20, color: Colors.blue),),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 3, style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(3)),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(fruitModel.calory , style: TextStyle(fontSize: 20, color: Colors.blue),),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 3, style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(3)),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text("Nutritious", style: TextStyle(fontSize: 20, color: Colors.blue),),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40, right: 50, top: 20),
          child: Text(fruitModel.des,style: TextStyle(
              height: 1.6
          ),),
        ),
      ],
    ),
  );
}

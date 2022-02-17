import 'package:expantion_list/data/data_source.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Map<String,dynamic>> list = DataSource.listData;


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: const Text("Expanded List"),),

      body: SingleChildScrollView(
        child: ExpansionPanelList(

          elevation: 3,

          expansionCallback: (index, isExpanded) {
            setState(() {
              list[index]['isExpanded'] = !isExpanded;
            });
          },

          animationDuration: const Duration(milliseconds: 600),

          children: list.map((item) => ExpansionPanel(
            canTapOnHeader: true,
            backgroundColor: item['isExpanded'] == true ? Colors.cyan[600] : Colors.white,
            isExpanded: item['isExpanded'],
            headerBuilder: (_,isExpanded) => Container(
              padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 30),
              child: Text(item['title'],style: const TextStyle(fontSize: 20),),

            ),
            body: Container(
              padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 30),
              child: Text(item['body']),
            ),
          )).toList(),
        ),
      ),
    );
  }
}



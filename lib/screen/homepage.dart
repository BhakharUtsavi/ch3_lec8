import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              Navigator.of(context).pushNamed("firsttask");
            },
                child: Text("First Task"),
            ),
            ElevatedButton(onPressed: (){
              Navigator.of(context).pushNamed("secondtask");
            },
              child: Text("Second Task"),
            ),
            ElevatedButton(onPressed: (){
              Navigator.of(context).pushNamed("thirdtask");
            },
              child: Text("Third Task"),
            ),
          ],
        ),
      ),
    );
  }
}

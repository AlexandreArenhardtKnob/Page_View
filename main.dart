import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int pagina=0;
  PageController pgController = PageController(
      initialPage: 0,
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App com Page View. Página " + pagina.toString()),
        centerTitle: true,
      ),
      body: PageView(
        scrollDirection: Axis.horizontal,
        pageSnapping: true,
        controller: pgController,
        onPageChanged: (index){
          setState(() {
            pagina = index;
          });
          print("Página : " + index.toString());
        }
        ,
        children: <Widget>[
          pagina1(),
          pagina2(),
          pagina3(),
        ],
      ),
    );
  }


  Widget pagina1(){
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.blue,
      child: Column(
        children: <Widget>[
          Text("Você na Página 01 "),
        ],
        
      ),
    );
  }

  Widget pagina2(){
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.red,
      child: Column(
        children: <Widget>[
          Text("Você na Página 02 "),
        ],
      ),
    );
  }

  Widget pagina3(){
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.green,
      child: Column(
        children: <Widget>[
          Text("Você na Página 03 "),
          SizedBox(height: 20,),
          RaisedButton(
            child: Text("Acessa Página 1"),
            onPressed: (){
              pgController.animateToPage(0, duration: Duration(seconds: 1),
                  curve: Curves.easeInCubic);
            },
          ),
        ],
      ),
    );
  }


}

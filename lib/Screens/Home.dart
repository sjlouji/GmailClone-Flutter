import 'package:flutter/material.dart';
import 'package:gmail_clone/Data/Mail.dart';
import 'package:gmail_clone/Widget/Primary.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gmail Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: new SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              PreferredSize(
                preferredSize: Size.fromHeight(70.0),
                child: SliverAppBar(
                  toolbarHeight: 80,
                  pinned: false,
                  backgroundColor: Colors.white,
                  title: Container(
                    child: Material(
                      elevation: 8,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Container(
                        height: 50,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Search in Mail",
                            border: InputBorder.none,
                            icon: Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Icon(Icons.dehaze)
                            ),
                            suffixIcon: Container(
                              height: 5,
                              width: 5,
                              margin: EdgeInsets.all(5),
                              child: CircleAvatar(
                                radius: 14.0,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 14.0,
                                  backgroundColor: Colors.grey[200],
                                  backgroundImage: NetworkImage("https://qph.fs.quoracdn.net/main-qimg-11ef692748351829b4629683eff21100.webp"),
                                ),
                              ),
                            )
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ];
          },
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20,),
                    child: Text('Primary'),
                  ),
                  Container(
                    child: ListView.builder(
                        padding: EdgeInsets.all(0),
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: mailList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index){
                          return Container(
                            child: PrimaryWidget(mail: mailList[index],),
                          );
                        }
                    ),
                  ),
                ],
              ),
            ),
          )
        ),
      )
    );
  }
}

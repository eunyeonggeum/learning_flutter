import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scaffold Messenger'),
      ),
      body: HomeBody(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.thumb_up),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Like a new Snack Bar!'),
              duration: Duration(seconds: 5),
              action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ThirdPage()));
                  }),
            ),
          );
        },
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text('Go to the second page'),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SecondPage()));
        },
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Second Page'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                print('text Button');
              },
              onLongPress: () {
                print('long text button');
              },
              child: Text(
                'Text Button',
                style: TextStyle(fontSize: 20.0),
              ),
              style: TextButton.styleFrom(
                primary: Colors.red,
                //backgroundColor: Colors.blue,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                print('Elevated button');
              },
              child: Text('Elevated button'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.orangeAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  elevation: 0.0), // backgroundcolor = primary
            ),
            OutlinedButton(
              onPressed: () {
                print('Outlined Button');
              },
              child: Text('Outlined Button'),
              style: OutlinedButton.styleFrom(
                  primary: Colors.green,
                  side: BorderSide(color: Colors.black87, width: 2.0)),
            ),
            TextButton.icon(
              onPressed: null,
              icon: Icon(
                Icons.home,
                size: 30.0,
                color: Colors.black87,
              ),
              label: Text('Go to home'),
              style: TextButton.styleFrom(
                primary: Colors.black,
                onSurface: Colors.pink, // ??????????????? ????????? ?????? ?????? ??? ??????
                //minimumSize: Size(200, 50),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              buttonPadding: EdgeInsets.all(20),
              children: [
                TextButton(onPressed: () {}, child: Text('Textbutton')),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Elevatedbutton'),
                )
              ],
            )
          ],
        )));
  }
}

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      // ????????? materialApp??? ???????????? rout scaffoldMessanger??? ????????? ????????? ?????? scaffold??? ?????? ????????? ????????? ?????? ?????? -> ????????? context ??????(builder)??? scaffold ?????? ?????????????????? ??? | ?????? ??????????????? ???????????? snackbar ?????????
      child: Scaffold(
        appBar: AppBar(
          title: Text('Second Page'),
        ),
        body: Builder(// builder ?????? ?????????
            builder: (context) {
          return Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Text(
                  '"?????????"??? ?????? ???????????????????',
                  style: TextStyle(fontSize: 20.0, color: Colors.redAccent),
                ),
                ElevatedButton(
                  child: Text('????????????'),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      // ??? scaffoldMessenger??? context??? ??????scaffoldM??? context ?????? ??????
                      content: Text('???????????? ?????????????????????.'),
                      duration: Duration(seconds: 3),
                    ));
                  },
                )
              ]));
        }),
      ),
    );
  }
}

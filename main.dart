import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final items = List<String>.generate(10000, (i) => "Item $i");

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //appbarの色調節
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          //アイコン
          leading: Icon(Icons.videocam),
          title: const Text(
            "youtubeトレース",
          ),
          actions: [
            SizedBox(
              //アイコンのサイズ
              width: 36,
              child: FlatButton(
                child: Icon(Icons.search),
              ),
            ),
            SizedBox(
              width: 36,
              child: FlatButton(
                child: Icon(Icons.more_vert),
              ),
            ),
          ],
        ),
        body: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.network(//SizedBoxで画像サイズ変更
                          'https://img.icons8.com/clouds/2x/super-mario.png'),
                    ),
                    Column(
                      children: <Widget>[
                        const Text(
                          "チャンネル",
                        ),
                        FlatButton(
                          child: Row(
                            children: [
                              Icon(
                                Icons.video_call,
                                color: Colors.red,
                              ),
                              Text('登録する'),
                            ],
                          ),
                          onPressed: () {
                            //なんか登録とかする
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                //colum使ってリストするならExpandedが必要
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () async {
                        //画面遷移
                      },
                      contentPadding: EdgeInsets.all(8),
                      leading: Image.network(//リストは画像サイズ関係ない　leading左に置く
                          'https://pbs.twimg.com/profile_images/1218075282457808896/5yKfDHGR_400x400.jpg'),
                      trailing: Icon(Icons.more_vert),
                      //trailing 右側に置く
                      title: Column(
                        children: [
                          Text(
                            'untiaaaaaaaaaaaaaaaaaaaaaaaadddddddddfaefa',
                            style: TextStyle(
                              fontWeight: FontWeight.w500, //フォントの太さ変更
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '${items[index]}',
                                style: TextStyle(
                                  fontSize: 13, //フォントサイズ変更
                                ),
                              ),
                              Text('？日前')
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

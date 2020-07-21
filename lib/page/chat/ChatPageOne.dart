import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_ui_nice/page/profile/profile_const.dart';

import '../../const/color_const.dart';

class ChatPageOne extends StatefulWidget {
  ChatPageOne({Key key, @required this.user, @required this.room})
      : super(key: key);

  final String user;
  final String room;

  @override
  _ChatPageOneState createState() => _ChatPageOneState();
}

class _ChatPageOneState extends State<ChatPageOne> {
  List<dynamic> _messages;
  String _currentMessage;
  final TextEditingController _textController = TextEditingController();
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();

    _messages = [
      {
        "user": {"userid": "tupt", "pictureurl": ProfileImages.photos_01},
        "body": "Hello"
      },
      {
        "user": {"userid": "tupt", "pictureurl": ProfileImages.photos_01},
        "body": "How are you"
      },
      {
        "user": {"userid": "tupt2", "pictureurl": ProfileImages.photos_01},
        "body": "Im ok"
      },
      {
        "user": {"userid": "tupt2", "pictureurl": ProfileImages.photos_01},
        "body": "And you ?"
      },
      {
        "user": {"userid": "tupt", "pictureurl": ProfileImages.photos_01},
        "body": "Im good as well"
      },
      {
        "user": {"userid": "tupt", "pictureurl": ProfileImages.photos_01},
        "body": "Thank you!"
      },
    ];
  }

  @override
  void dispose() {
    _textController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BLUE_DEEP,
        title: Text(widget.room),
      ),
      body: Container(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              messageList(),
              messageInputArea(),
            ],
          ),
        ),
      ),
    );
  }

  Expanded messageList() {
    return Expanded(
      flex: 2,
      child: ListView.builder(
          reverse: true,
          shrinkWrap: true, // equal height
          padding: EdgeInsets.all(8.0),
          controller: _controller,
          itemCount: _messages.length,
          itemBuilder: (context, index) {
            return buildTile(index);
          }),
    );
  }

  Padding messageInputArea() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: TextField(
              controller: _textController,
              onChanged: (value) {
                _currentMessage = value;
              },
              cursorColor: Colors.black,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: "Enter Message",
                hintStyle: TextStyle(color: Colors.black),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: RaisedButton(
              onPressed: () {
                _textController.clear();
              },
              child: Text("Send"),
            ),
          )
        ],
      ),
    );
  }

  final leftColor = Color(0xffe9ebee);
  final rightColor = Color(0xff3578e5);
  final double avatarWidth = 32;

  bool isCurrentUser(dynamic user) {
    return user['userid'] == widget.user;
  }

  BorderRadius getBorderRadius(
      bool isCurrent, bool isLast, bool isFirst, Radius min, Radius max) {
    Radius bottomLeft = min;
    Radius topLeft = min;
    Radius bottomRight = min;
    Radius topRight = min;

    if (isCurrent) {
      bottomLeft = max;
      topLeft = max;
    } else {
      bottomRight = max;
      topRight = max;
    }

    if (isFirst) {
      if (isCurrent)
        bottomRight = max;
      else
        bottomLeft = max;
    }
    if (isLast) {
      if (isCurrent)
        topRight = max;
      else
        topLeft = max;
    }

    return BorderRadius.only(
        bottomLeft: bottomLeft,
        topLeft: topLeft,
        bottomRight: bottomRight,
        topRight: topRight);
  }

  Widget buildTile(int index) {
    final data = _messages[index];
    final user = data['user'];
    bool isCurrent = isCurrentUser(user);
    final isFirst = index > 0
        ? isCurrentUser(_messages[index - 1]['user']) != isCurrent
        : true;
    final isLast = index < _messages.length - 1
        ? isCurrentUser(_messages[index + 1]['user']) != isCurrent
        : true;

    final borderRadius = getBorderRadius(isCurrent, isLast, isFirst,
        Radius.circular(5), Radius.circular(avatarWidth / 2));

    final children = <Widget>[
      Container(
        margin: EdgeInsets.only(left: 15.0),
        padding: EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 8.0),
        child: Text(
          data['body'],
          style: TextStyle(
            fontSize: 16.0,
            color: isCurrent ? Colors.white : Colors.black,
          ),
        ),
        decoration: BoxDecoration(
          color: isCurrent ? rightColor : leftColor,
          borderRadius: borderRadius,
        ),
      )
    ];

    // show avatar for friend
    if (!isCurrent) {
      children.insert(
        0,
        isFirst
            ? CircleAvatar(
                radius: avatarWidth / 2,
                backgroundImage: AssetImage(user['pictureurl']),
              )
            : SizedBox(
                width: avatarWidth,
              ),
      );
    }

    //Own message
    return Padding(
      padding: const EdgeInsets.only(bottom: 2.0),
      child: Row(
        mainAxisAlignment:
            isCurrent ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: children,
      ),
    );
  }
}

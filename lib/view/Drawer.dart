import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter_ui_nice/const/page_str_const.dart';

class AppDrawer extends StatelessWidget {
  /// Creates a list tile for showing an about box.
  ///
  /// The arguments are all optional. The application name, if omitted, will be
  /// derived from the nearest [Title] widget. The version, icon, and legalese
  /// values default to the empty string.
  const AppDrawer({
    Key key,
  }) : super(key: key);

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    var fontFamily = "Roboto";
    var accountEmail = new Text("tubackkhoa@gmail.com",
        style: new TextStyle(
            color: Theme.of(context).accentColor,
            fontSize: 14.0,
            fontFamily: fontFamily));
    var accountName = new Text("Novalex",
        style: new TextStyle(
            color: Theme.of(context).accentColor,
            fontSize: 18.0,
            fontFamily: fontFamily));
    var accountPicture = new CircleAvatar(
        child: new Icon(Icons.person_outline),
        backgroundColor: Theme.of(context).accentColor);

    var header = new UserAccountsDrawerHeader(
      accountEmail: accountEmail,
      accountName: accountName,
      currentAccountPicture: accountPicture,
      decoration:
          new BoxDecoration(color: Theme.of(context).textSelectionColor),
    );

    var listView = new ListView(children: [
      header,
      for (var item in PROFILE_PAGES)
        _createDrawerItem(
            icon: Icons.contacts,
            text: item,
            onTap: () => Navigator.pushNamed(context, item)),
    ]);

    return Drawer(child: listView);
  }
}

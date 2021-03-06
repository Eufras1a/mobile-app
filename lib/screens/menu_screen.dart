import 'package:flutter/material.dart';
import 'package:dsc_app/constants/constants.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:dsc_app/widgets/menu_item.dart';
import 'package:dsc_app/networking/auth.dart';
import 'package:dsc_app/screens/login.dart';

class MenuScreen extends StatefulWidget {
  SelectedMenu selectedMenu;
  MenuScreen({this.selectedMenu});
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Container(
              height: 200.0,
              child: FlareActor(
                'lib/assets/Menu.flr',
                animation: "loopWaving",
                fit: BoxFit.fitWidth,
                alignment: Alignment.center,
              ),
            ),
            MenuScreenItem(
              function: () {
                setState(() {
                  widget.selectedMenu = SelectedMenu.Home;
                });
                Navigator.pushReplacementNamed(context, '/home');
              },
              title: 'HOME',
              color: widget.selectedMenu == SelectedMenu.Home
                  ? Colors.white
                  : Colors.grey,
            ),
            MenuScreenItem(
              function: () {
                setState(() {
                  widget.selectedMenu = SelectedMenu.Events;
                });
                Navigator.pushReplacementNamed(context, '/events');
              },
              title: 'EVENTS',
              color: widget.selectedMenu == SelectedMenu.Events
                  ? Colors.white
                  : Colors.grey,
            ),
            MenuScreenItem(
              function: () {
                setState(() {
                  widget.selectedMenu = SelectedMenu.Projets;
                });
                Navigator.pushReplacementNamed(context, '/projects');
              },
              title: 'PROJECTS',
              color: widget.selectedMenu == SelectedMenu.Projets
                  ? Colors.white
                  : Colors.grey,
            ),
            MenuScreenItem(
              function: () {
                setState(() {
                  widget.selectedMenu = SelectedMenu.Team;
                });
                Navigator.pushReplacementNamed(context, '/team');
              },
              title: 'TEAM',
              color: widget.selectedMenu == SelectedMenu.Team
                  ? Colors.white
                  : Colors.grey,
            ),
            MenuScreenItem(
              function: () {
                setState(() {
                  widget.selectedMenu = SelectedMenu.ContactUs;
                });
                Navigator.pushReplacementNamed(context, '/contactus');
              },
              title: 'CONTACT US',
              color: widget.selectedMenu == SelectedMenu.ContactUs
                  ? Colors.white
                  : Colors.grey,
            ),
            MenuScreenItem(
              function: () async {
                setState(() {
                  widget.selectedMenu = SelectedMenu.Logout;
                });
                await _auth.signOut().whenComplete(() {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) {
                    return Login();
                  }), ModalRoute.withName('/menu'));
                });
              },
              title: 'Logout',
              color: widget.selectedMenu == SelectedMenu.Logout
                  ? Colors.white
                  : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}

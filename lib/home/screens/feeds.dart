import 'package:flutter/material.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.brown,
        elevation: 0.0,
        title: const Text(
          'SESC COMMUNITY',
          style: TextStyle(fontFamily: 'Battambang'),
        ),
      ),
      drawer: Drawer(
          child: ListView(
        children: [
          DrawerHeader(
            child: ListView(
              shrinkWrap: true,
              children: [
                Text(
                  'Daniel Simiyu',
                  style: TextStyle(
                    fontFamily: 'Battambang',
                    fontWeight: FontWeight.w300,
                    fontSize: 20,
                  ),
                ),
                Text(
                  'Joined: 12th Feb 2020',
                  style: TextStyle(
                    fontFamily: 'Battambang',
                    fontWeight: FontWeight.w300,
                    fontSize: 20,
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.verified,
                    color: Colors.green,
                  ),
                  title: Text('Senior Dev',
                      style: TextStyle(
                        fontFamily: 'Battambang',
                        fontWeight: FontWeight.w100,
                        fontSize: 20,
                      )),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.change_circle_rounded,
                        color: Colors.brown,
                      )),
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.people_alt_sharp,
              color: Colors.green,
            ),
            title: Text('All Members',
                style: TextStyle(
                  fontFamily: 'Battambang',
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                )),
          ),
          ListTile(
            leading: Icon(
              Icons.event,
              color: Colors.green,
            ),
            title: Text('Activities',
                style: TextStyle(
                  fontFamily: 'Battambang',
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                )),
          ),
          ListTile(
            leading: Icon(
              Icons.subscriptions,
              color: Colors.green,
            ),
            title: Text('Membership',
                style: TextStyle(
                  fontFamily: 'Battambang',
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                )),
          ),
          ListTile(
            leading: Icon(
              Icons.tag_rounded,
              color: Colors.green,
            ),
            title: Text('Club Store',
                style: TextStyle(
                  fontFamily: 'Battambang',
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                )),
          ),
          ListTile(
            leading: Icon(
              Icons.newspaper_rounded,
              color: Colors.green,
            ),
            title: Text('Club Documents',
                style: TextStyle(
                  fontFamily: 'Battambang',
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                )),
          ),
          ListTile(
            leading: Icon(
              Icons.bubble_chart,
              color: Colors.green,
            ),
            title: Text(
              'Tag Privilege',
              style: TextStyle(
                fontFamily: 'Battambang',
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.exit_to_app_rounded,
              color: Colors.green,
            ),
            title: Text(
              'SignOut',
              style: TextStyle(
                fontFamily: 'Battambang',
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
            ),
          ),
        ],
      )),
    ));
  }
}

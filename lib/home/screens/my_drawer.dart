import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:strathmoresesc/authentication/bloc/sign_out_logic.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key, required this.user}) : super(key: key);
  final User user;
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        DrawerHeader(
          child: ListView(
            shrinkWrap: true,
            children: [
              Text(
                '${user.displayName}',
                style: const TextStyle(
                  fontFamily: 'Battambang',
                  fontWeight: FontWeight.w300,
                  fontSize: 20,
                ),
              ),
              const Text(
                'Joined: 12th Feb 2020',
                style: TextStyle(
                  fontFamily: 'Battambang',
                  fontWeight: FontWeight.w300,
                  fontSize: 20,
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.verified,
                  color: Colors.green,
                ),
                title: const Text('Senior Dev',
                    style: TextStyle(
                      fontFamily: 'Battambang',
                      fontWeight: FontWeight.w100,
                      fontSize: 20,
                    )),
                trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.change_circle_rounded,
                      color: Colors.brown,
                    )),
              )
            ],
          ),
        ),
        const ListTile(
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
        const ListTile(
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
        const ListTile(
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
        const ListTile(
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
        const ListTile(
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
        const ListTile(
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
          leading: const Icon(
            Icons.exit_to_app_rounded,
            color: Colors.green,
          ),
          title: const Text(
            'SignOut',
            style: TextStyle(
              fontFamily: 'Battambang',
              fontWeight: FontWeight.w400,
              fontSize: 15,
            ),
          ),
          onTap: () {
            SignOutLogic().logOut(context);
          },
        ),
      ],
    ));
  }
}

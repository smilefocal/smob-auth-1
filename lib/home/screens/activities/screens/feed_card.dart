import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FeedCard extends StatelessWidget {
  const FeedCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Chip(label: Text('Wed 30th, April 2020')),
          ListTile(
            leading: CircleAvatar(
              radius: 20,
            ),
            title: Text(
              'Daniel Simiyu [Senior Dev]',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'shadjkcnjdncdcjndjc d cndjc djcndjksdc dcnjsndjkc jdnjksndjnc shadjkcnjdncdcjndjc d cndjc djcndjksdc dcnjsndjkc jdnjksndjnc',
              style: TextStyle(fontSize: 15),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.traffic),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 1,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    FontAwesomeIcons.solidHeart,
                  ),
                  label: const Text('23'),
                  style: OutlinedButton.styleFrom(
                    side:
                        const BorderSide(width: 0.0, color: Colors.transparent),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(FontAwesomeIcons.comment),
                  label: Text('23'),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(width: 0.0, color: Colors.transparent),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(FontAwesomeIcons.cameraRetro),
                  label: const Text(''),
                  style: OutlinedButton.styleFrom(
                    side:
                        const BorderSide(width: 0.0, color: Colors.transparent),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

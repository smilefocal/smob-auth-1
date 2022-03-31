import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FeedCard extends StatelessWidget {
  const FeedCard({Key? key, required this.data}) : super(key: key);
  final Map<String, dynamic> data;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Chip(label: Text(data['date'])),
          ListTile(
            leading: CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage(data['profilePic']),
              backgroundColor: Colors.transparent,
            ),
            title: Row(
              children: [
                Expanded(
                  child: Text(
                    data['userName'],
                    style: const TextStyle(
                      fontFamily: 'Battambang',
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  flex: 1,
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    '@' + data['time'],
                    style: const TextStyle(
                      fontSize: 10,
                    ),
                  ),
                )
              ],
            ),
            subtitle: Text(
              data['message'],
              style: const TextStyle(fontSize: 15),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.traffic),
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
                  label: Text(data['likes'].toString()),
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
                  icon: const Icon(FontAwesomeIcons.comment),
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

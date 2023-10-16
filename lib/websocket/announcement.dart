import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class AnnouncementList extends StatefulWidget {
  final WebSocketChannel channel;

  const AnnouncementList({super.key, required this.channel});

  @override
  State<AnnouncementList> createState() => _AnnouncementListState();
}

class _AnnouncementListState extends State<AnnouncementList> {
  List<String> announcements = [];

  @override
  void initState() {
    super.initState();
    widget.channel.stream.listen((message) {
      setState(() {
        announcements.add(message);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: announcements.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(announcements[index]),
        );
      },
    );
  }
}

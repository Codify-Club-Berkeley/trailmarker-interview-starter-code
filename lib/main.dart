import 'dart:convert';
import 'dart:html';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EventListPage(),
    );
  }
}

class EventListPage extends StatefulWidget {
  @override
  _EventListPageState createState() => _EventListPageState();
}

class _EventListPageState extends State<EventListPage> {
  List<Event> events = [];

  @override
  void initState() {
    super.initState();
    loadEvents();
  }

  // Task 1: Method to load events - Comment out for Task 1

  Future<void> loadEvents() async {
    // Load the JSON file from the assets folder

    // Decode the JSON file

    setState(() {
      events = [
        Event(
          title: 'Flutter Workshop',
          description: 'Learn Flutter',
          color: Colors.grey,
        ),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event List'),
      ),
      // Task 1: Render a list of event cards
      body: EventCard(event: events[0]),
    );
  }
}

class Event {
  final String title;
  final String description;
  final Color color;
  // Task 3: isFavorite flag

  Event({
    required this.title,
    required this.description,
    required this.color,
    // Task 3: isFavorite flag
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      title: json['title'],
      description: json['description'],
      color: Color(int.parse(json['color'].replaceAll('#', '0xFF'))),
    );
  }
}

class EventCard extends StatefulWidget {
  final Event event;

  EventCard({required this.event});

  @override
  _EventCardState createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.event.color,
      child: ListTile(
        title: Text(widget.event.title),
        // Task 2: Create the subtitle

        trailing: IconButton(
          icon: Icon(
            // Task 3: Use isFavorite to determine the icon - Comment out for Task 3
            Icons.favorite_border,
            color: Colors.red,
          ),
          onPressed: () {
            // Task 3: Toggle isFavorite state
          },
        ),
      ),
    );
  }
}

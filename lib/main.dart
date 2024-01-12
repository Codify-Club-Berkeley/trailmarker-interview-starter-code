import 'dart:convert';
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
    // Task 1: Load data from the JSON file when the widget initializes
    // Commenting out the solution for Task 1

    loadEvents();
  }

  // Task 1: Method to load events - Comment out for Task 1

  Future<void> loadEvents() async {
    final jsonFile =
        await DefaultAssetBundle.of(context).loadString('assets/events.json');
    final List<dynamic> jsonData = json.decode(jsonFile);

    setState(() {
      events = jsonData.map((eventData) => Event.fromJson(eventData)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event List'),
      ),
      // Task 1: Render a list of event cards - Comment out for Task 1

      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (BuildContext context, int index) {
          return EventCard(event: events[index]);
        },
      ),
    );
  }
}

class Event {
  final String title;
  final String description;
  final Color color;
  //bool isFavorite;

  Event({
    required this.title,
    required this.description,
    required this.color,
    // Task 3: isFavorite flag - Comment out for Task 3
    // this.isFavorite = false
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
        // Task 2: Change alignment and font size of subtitle - Comment out for Task 2

        subtitle: Text(
          widget.event.description,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18), // Increased font size
        ),

/*
       
        trailing: IconButton(
          icon: Icon(
            // Task 3: Use isFavorite to determine the icon - Comment out for Task 3
            
            Icons.favorite_border,
            color: Colors.red,
          ),
          // Task 3: Toggle isFavorite state - Comment out for Task 3
        
        ),
        */
      ),
    );
  }
}

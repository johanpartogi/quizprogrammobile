import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dental-It',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dental-It'),
        backgroundColor: Colors.blue.shade800,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigasi ke halaman My Appointments
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyAppointmentsScreen(),
              ),
            );
          },
          child: Text('Go to My Appointments'),
        ),
      ),
    );
  }
}

class MyAppointmentsScreen extends StatelessWidget {
  // Data contoh janji temu
  final List<Map<String, String>> appointments = [
    {'name': 'John Doe', 'date': '2023-11-04', 'time': '10:00 AM'},
    {'name': 'Jane Smith', 'date': '2023-11-05', 'time': '2:00 PM'},
    {'name': 'Alex Johnson', 'date': '2023-11-06', 'time': '9:30 AM'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Appointments'),
      ),
      body: ListView.builder(
        itemCount: appointments.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text(appointments[index]['name']!),
              subtitle: Text('Date: ${appointments[index]['date']} - Time: ${appointments[index]['time']}'),
            ),
          );
        },
      ),
    );
  }
}

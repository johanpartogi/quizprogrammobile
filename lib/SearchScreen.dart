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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
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
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigasi ke halaman Treatment Info
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TreatmentInfoScreen(),
                  ),
                );
              },
              child: Text('Go to Treatment Info'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigasi ke halaman Search
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(),
                  ),
                );
              },
              child: Text('Go to Search'),
            ),
          ],
        ),
      ),
    );
  }
}

class MyAppointmentsScreen extends StatelessWidget {
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

class TreatmentInfoScreen extends StatelessWidget {
  final List<Map<String, String>> treatments = [
    {'name': 'Teeth Cleaning', 'description': 'Routine cleaning to remove plaque and tartar.'},
    {'name': 'Cavity Filling', 'description': 'Filling cavities to prevent further decay.'},
    {'name': 'Root Canal', 'description': 'Treatment for infected tooth pulp.'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Treatment Info'),
      ),
      body: ListView.builder(
        itemCount: treatments.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: Icon(Icons.healing),
              title: Text(treatments[index]['name']!),
              subtitle: Text(treatments[index]['description']!),
            ),
          );
        },
      ),
    );
  }
}

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<String> searchResults = [];

  // Contoh data untuk pencarian
  final List<String> data = [
    'Teeth Cleaning',
    'Cavity Filling',
    'Root Canal',
    'Dental Implants',
    'Braces',
    'Tooth Extraction',
  ];

  void _performSearch(String query) {
    final results = data.where((item) => item.toLowerCase().contains(query.toLowerCase())).toList();
    setState(() {
      searchResults = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search Treatments',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () => _performSearch(_searchController.text),
                ),
              ),
              onChanged: _performSearch,
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.search),
                    title: Text(searchResults[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

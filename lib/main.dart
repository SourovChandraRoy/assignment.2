import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Flag Grid',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FlagGridPage(),
    );
  }
}

class FlagGridPage extends StatelessWidget {
  final List<Map<String, String>> countries = [
    {
      'name': 'Bangladesh',
      'flag': 'https://flagcdn.com/w320/bd.png',
    },
    {
      'name': 'UK',
      'flag': 'https://flagcdn.com/w320/gb.png',
    },
    {
      'name': 'Canada',
      'flag': 'https://flagcdn.com/w320/ca.png',
    },
    {
      'name': 'Germany',
      'flag': 'https://flagcdn.com/w320/de.png',
    },
    {
      'name': 'France',
      'flag': 'https://flagcdn.com/w320/fr.png',
    },
    {
      'name': 'Japan',
      'flag': 'https://flagcdn.com/w320/jp.png',
    },
    {
      'name': 'India',
      'flag': 'https://flagcdn.com/w320/in.png',
    },
    {
      'name': 'Brazil',
      'flag': 'https://flagcdn.com/w320/br.png',
    },
  ];

  int getCrossAxisCount(double width) {
    if (width < 768) {
      return 2; // Mobile
    } else if (width >= 768 && width < 1024) {
      return 3; // Tablet
    } else {
      return 4; // Desktop
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive Country Flags'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          itemCount: countries.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: getCrossAxisCount(screenWidth),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.90,
          ),
          itemBuilder: (context, index) {
            final country = countries[index];
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                    child: Image.network(
                      country['flag']!,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    country['name']!,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
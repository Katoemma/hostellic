import 'package:flutter/material.dart';
import 'package:hostelease/screens/hostelDetaillScreen.dart'; // Import your hostel model

class HostelListPage extends StatelessWidget {
  final List hostels; // Assuming you have a list of hostel objects

  HostelListPage(this.hostels);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hostel List'),
      ),
      body: ListView.builder(
        itemCount: hostels.length,
        itemBuilder: (context, index) {
          final hostel = hostels[index];
          return ListTile(
            title: Text(hostel.name),
            subtitle: Text(hostel.location),
            trailing: Text('${hostel.rating}'), // Assuming rating is a double
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HostelDetailPage(hostel),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

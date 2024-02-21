import 'package:flutter/material.dart';
import 'package:hostelease/components/customCard.dart';
import 'package:hostelease/components/customList.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key, this.fname});

  final String? fname;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  //function to set greeting based on time
  String greeting = 'Good morning';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            "$greeting, ${widget.fname ?? 'Guest'}",
            style: const TextStyle(fontSize: 18, color: Colors.teal),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0,
              shrinkWrap: true,
              childAspectRatio: 1.5,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                CustomCard(
                    icon: Icons.home,
                    title: 'Current Hostel',
                    content: 'Hostel A'),
                CustomCard(
                    icon: Icons.expand_less,
                    title: 'Current Room',
                    content: 'Room 101'),
                CustomCard(
                    icon: Icons.credit_card,
                    title: 'Payment Status',
                    content: 'Paid'),
                CustomCard(
                    icon: Icons.cut, title: 'To Do', content: '3 pending'),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Updates and Feed',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16.0),
                CustomListItem(
                  title: 'Welcome to the Hilllside',
                  subtitle: 'New',
                  imageUrl:
                      'https://m.media-amazon.com/images/S/aplus-media-library-service-media/6da4c6d5-3729-41e0-b7e5-e386482e6c97.__CR0,0,463,625_PT0_SX463_V1___.jpg',
                  onPressed: () {
                    // Handle button press action here
                  },
                ),
                CustomListItem(
                  title: 'Welcome to the Hilllside',
                  subtitle: 'New',
                  imageUrl:
                      'https://storage.googleapis.com/pod_public/1300/180579.jpg',
                  onPressed: () {
                    // Handle button press action here
                  },
                ),
                CustomListItem(
                  title: 'Welcome to the Hilllside',
                  subtitle: 'New',
                  imageUrl:
                      'https://storage.googleapis.com/pod_public/1300/150707.jpg',
                  onPressed: () {
                    // Handle button press action here
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

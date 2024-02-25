import 'package:easy_loading_button/easy_loading_button.dart';
import 'package:flutter/material.dart';
import 'package:hostelease/main.dart';
import 'package:hostelease/utilities/hostels.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
// Import your hostel model

class HostelDetailPage extends StatelessWidget {
  final Hostel hostel;

  const HostelDetailPage(this.hostel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hostel Detail'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Hostel Image Gallery
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: hostel.images.length,
                itemBuilder: (context, index) {
                  return Image.network(
                    hostel.images[index],
                    width: 200,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            // Hostel Name and Location
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hostel.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    hostel.location,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            // Hostel Ratings and Reviews
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(Icons.star, color: Colors.yellow),
                  const SizedBox(width: 5),
                  Text(
                    hostel.rating.toString(),
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '${hostel.reviews} reviews',
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
            // Hostel Amenities
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Amenities:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  // Assuming hostel.amenities is a list of amenities
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: hostel.amenities.map((amenity) {
                      return Text(
                        amenity,
                        style: const TextStyle(fontSize: 16),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            // Hostel Pricing
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Pricing:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  // Assuming hostel.pricing is a String
                  Text(
                    hostel.pricing,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            // Button to Book Hostel
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: EasyButton(
                height: 50,
                borderRadius: 10,
                buttonColor: Colors.teal,
                idleStateWidget: const Text(
                  'Book Hostel',
                  style: TextStyle(color: Colors.white),
                ),
                loadingStateWidget: LoadingAnimationWidget.fallingDot(
                  color: Colors.white,
                  size: 24,
                ),
                onPressed: () async {
                  //fetch hostels from supabase
                  // await supabase.from('Hostels').select().then((data) => print(data));

                  await supabase
                      .from('bookings')
                      .insert({'hostel': 1, 'student': 8, 'status':'FALSE'});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

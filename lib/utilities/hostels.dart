import 'package:hostelease/main.dart';

class Hostel {
  final String name;
  final String location;
  final double rating;
  final int reviews;
  final List<String> amenities;
  final String pricing;
  final List<String> images;

  Hostel({
    required this.name,
    required this.location,
    required this.rating,
    required this.reviews,
    required this.amenities,
    required this.pricing,
    required this.images,
  });
}

List<Hostel> staticHostelList = [
  Hostel(
    name: 'Sunset Hostel',
    location: '123 Sunset Blvd, City, Country',
    rating: 4.5,
    reviews: 120,
    amenities: ['Free WiFi', 'Breakfast included', 'Laundry service'],
    pricing: '\$20 - \$50 per night',
    images: [
      'https://cdn.internationalstudent.com/images/stock-images/youth-hostel.jpg',
      'https://cdn.internationalstudent.com/images/stock-images/youth-hostel.jpg',
      'https://cdn.internationalstudent.com/images/stock-images/youth-hostel.jpg',
    ],
  ),
  Hostel(
    name: 'Mountain View Lodge',
    location: '456 Mountain Rd, City, Country',
    rating: 4.2,
    reviews: 90,
    amenities: ['Mountain view', 'Shared kitchen', 'Parking'],
    pricing: '\$15 - \$40 per night',
    images: [
      'https://cdn.internationalstudent.com/images/stock-images/youth-hostel.jpg',
      'https://api.rentalynk.com/properties/138/1.png',
      'https://cdn.internationalstudent.com/images/stock-images/youth-hostel.jpg',
    ],
  ),
  // Add more hostels as needed
];

class NetworkHostels{

  //fetch hostels from supabase db
  Future fetchHostels() async {
    await supabase.from('hostels').select().then((data) => print(data));
  }
}
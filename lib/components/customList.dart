import 'package:flutter/material.dart';

class CustomListItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;
  final VoidCallback onPressed;

  const CustomListItem({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.grey, // Border color
          width: 1.0, // Border width
        ),
      ),
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Text(subtitle, style: TextStyle(color: Colors.teal),),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                primary: Colors.grey[300],
              ),
              onPressed: onPressed,
              child: const Text(
                'Read Now',
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
        trailing: ClipRRect(
          borderRadius:
              BorderRadius.circular(10.0), // Adjust the radius as needed
          child: Image.network(
            imageUrl,
            width: 75,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

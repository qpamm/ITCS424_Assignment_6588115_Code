import 'package:flutter/material.dart';
import 'success_page.dart';

class CancelPage extends StatefulWidget {
  @override
  _CancelPageState createState() => _CancelPageState();
}

class _CancelPageState extends State<CancelPage> {
  void _showConfirmDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            content: const Text(
              "Confirm cancel the reservation",
              style: TextStyle(fontSize: 16, color: Colors.black),
              textAlign: TextAlign.center,
            ),

            actionsAlignment: MainAxisAlignment.spaceEvenly,
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SuccessPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2D41A7), 
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text("Okay"),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text("Cancel"),
              ),
            ],
          ),
    );
  }

  final List<Map<String, String>> bookings = [
    {
      "image": "https://via.placeholder.com/80",
      "location": "Mahidol University Library",
      "date": "Tuesday 1st April",
      "time": "15:00 - 17.00 pm",
      "room": "Room No.101",
    },
    {
      "image": "https://via.placeholder.com/80",
      "location": "Badminton court",
      "date": "Wednesday 2nd April",
      "time": "17:00 - 19.00 pm",
      "room": "Court No.1",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cancellation')),
      body: ListView.builder(
        itemCount: bookings.length,
        itemBuilder: (context, index) {
          final booking = bookings[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 20),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        index == 0
                            ? 'assets/library.jpg'
                            : 'assets/badminton.jpg',
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        booking["location"]!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black, 
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Date: ${booking["date"]}",
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          "Time: ${booking["time"]}",
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          booking["room"]!,
                          style: TextStyle(color: Colors.black),
                        ),

                        const SizedBox(height: 10),
                        Center(
                          child: ElevatedButton(
                            onPressed: () => _showConfirmDialog(context, index),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(
                                0xFF2D41A7,
                              ), 
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text("Cancel"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

class PremiumPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Premium Service"),
        backgroundColor: Color(0xff40dedf),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Premium Laundry Service",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Our premium laundry service includes top-notch washing and ironing, "
                  "using the finest detergents and fabric softeners to ensure your clothes are treated with the utmost care. "
                  "Enjoy fast and efficient delivery straight to your door.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Center(
              // Using SizedBox to control the size of the image
              child: SizedBox(
                width: 150, // Set the desired width
                height: 150, // Set the desired height
                child: Image.asset("assets/page1/premium_service.jpg"),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Features:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "- Fast turnaround time\n"
                  "- Premium detergents and softeners\n"
                  "- Careful handling of delicate fabrics\n"
                  "- Convenient pickup and delivery",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add your action here
                },
                child: Text("Book Now"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff0fb2ea), // Correct usage of style parameter
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

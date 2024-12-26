import 'package:mad_laundry_app/model/list.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int selectedCategoryIndex = 0;
  Map<String, LaundryItem> selectedItems = {};
  double total = 0.0;

  void updateQuantity(LaundryItem item, bool increment) {
    setState(() {
      if (increment && item.quantity < 99) {
        item.quantity++;
      } else if (!increment && item.quantity > 0) {
        item.quantity--;
      }

      calculateTotal();
    });
  }

  void calculateTotal() {
    total = 0.0;
    for (var category in categoryData) {
      for (var item in category.items) {
        total += item.price * item.quantity;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Background gradient
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 4 / 7,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xff40dedf), Color(0xff0fb2ea)],
              ),
            ),
          ),

          // White container
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.7),
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: Colors.white,
            ),
          ),

          // Back button
          Positioned(
            top: 50,
            left: 20,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back, color: Colors.white, size: 25),
            ),
          ),

          // Categories text
          Positioned(
            top: 90,
            left: 20,
            child: Text(
              "Categories",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),

          // Categories list
          Positioned(
            top: 135,
            left: 20,
            child: Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoryData.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategoryIndex = index;
                      });
                    },
                    child: Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              width: 68,
                              height: 68,
                              decoration: BoxDecoration(
                                color: selectedCategoryIndex == index ? Colors.white : Colors.transparent,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: Colors.white, width: 1),
                                boxShadow: selectedCategoryIndex == index
                                    ? [BoxShadow(color: Color(0x14000000), blurRadius: 10)]
                                    : null,
                              ),
                              child: Center(
                                child: Image.asset(categoryData[index].imageUrl),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              categoryData[index].name,
                              style: TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ],
                        ),
                        SizedBox(width: 20),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),

          // Items grid
          Positioned(
            top: 240,
            height: MediaQuery.of(context).size.height - 340, // Leave space for bottom bar
            width: MediaQuery.of(context).size.width,
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.85,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemCount: categoryData[selectedCategoryIndex].items.length,
              itemBuilder: (context, index) {
                final item = categoryData[selectedCategoryIndex].items[index];
                return _buildItemCard(item);
              },
            ),
          ),

          // Bottom bar with total and checkout button
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 100,
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(0, -5),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "\$${total.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff0fb2ea),
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: total > 0 ? () {
                      // Implement checkout logic
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Proceeding to checkout...'))
                      );
                    } : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff0fb2ea),
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      "Checkout",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemCard(LaundryItem item) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              item.name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Image.asset(
              item.imageUrl,
              height: 60,
            ),
            Text(
              "\$${item.price.toStringAsFixed(2)}",
              style: TextStyle(
                fontSize: 16,
                color: Color(0xff0fb2ea),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildQuantityButton(
                  icon: Icons.remove,
                  onTap: () => updateQuantity(item, false),
                ),
                Text(
                  "${item.quantity}",
                  style: TextStyle(fontSize: 18),
                ),
                _buildQuantityButton(
                  icon: Icons.add,
                  onTap: () => updateQuantity(item, true),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuantityButton({required IconData icon, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xff0fb2ea)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          size: 20,
          color: Color(0xff0fb2ea),
        ),
      ),
    );
  }
}
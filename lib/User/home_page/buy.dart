import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book Device',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (_) => Cart(),
        child: ProductPage(),
      ),
    );
  }
}

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Device'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: Image.network(
                  'https://blog.airdroid.com/wp-content/uploads/2022/08/IoT-Devices.jpg',
                  height: 200,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Car Device',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Device Description',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Consumer<Cart>(
              builder: (context, cart, _) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\₹${cart.getItemTotal('Car Device').toStringAsFixed(2)}', // Total price for 'Car Device'
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            cart.removeFromCart(
                                'Car Device'); // Decrease item count
                          },
                          icon: Icon(Icons.remove),
                        ),
                        Text(
                          '${cart.getItemCount('Car Device')}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            cart.addToCart('Car Device'); // Increase item count
                          },
                          icon: Icon(Icons.add),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle checkout
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                textStyle: TextStyle(fontSize: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: Text('Buy Now'),
            ),
          ],
        ),
      ),
    );
  }
}

class Cart with ChangeNotifier {
  Map<String, int> _items = {};
  final double pricePerDeviceInRupees = 1000; // Price per device in rupees

  Map<String, int> get items => _items;

  void addToCart(String productName) {
    if (_items.containsKey(productName)) {
      _items[productName] =
          (_items[productName] ?? 0) + 1; // Increase count by 1
    } else {
      _items[productName] = 1; // Add the product with count 1
    }
    notifyListeners();
  }

  void removeFromCart(String productName) {
    if (_items.containsKey(productName) && (_items[productName] ?? 0) > 0) {
      _items[productName] =
          (_items[productName] ?? 0) - 1; // Decrease count by 1
      if (_items[productName] == 0) {
        _items.remove(productName); // Remove the product if count becomes 0
      }
    }
    notifyListeners();
  }

  int? getItemCount(String productName) {
    return _items.containsKey(productName) ? _items[productName] : null;
  }

  double getItemTotal(String productName) {
    final itemCount = _items[productName];
    return itemCount != null ? itemCount * pricePerDeviceInRupees : 0;
  }
}
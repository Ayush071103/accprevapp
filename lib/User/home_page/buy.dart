import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class ProductPageStandalone extends StatefulWidget {
  @override
  _ProductPageStandaloneState createState() => _ProductPageStandaloneState();
}

class _ProductPageStandaloneState extends State<ProductPageStandalone> {
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: Image.asset(
                  'assets/IoT-Device.jpg',
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Price: ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '\₹${cart.pricePerDeviceInRupees.toStringAsFixed(2)}', // Fixed price for 'Car Device'
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _handleCheckout(context);
                },
                child: Text('Buy Now'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleCheckout(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirmation"),
          content: Text("Your purchase is complete."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
}

class Cart with ChangeNotifier {
  final double pricePerDeviceInRupees =
  1000; // Fixed price per device in rupees
}
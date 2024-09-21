import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double subtotal = 48.96; // Total harga item
    double taxAndFees = 3.99;
    double deliveryFee = 5.00;
    double total = subtotal + taxAndFees + deliveryFee;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'My Cart',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Playfair Display',
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: [
                    _buildCartItem('Burger', 'assets/images/cheeseburger.jpg', 10.99),
                    _buildCartItem('Pizza', 'assets/images/pizza.jpg', 12.99),
                    _buildCartItem('Sushi', 'assets/images/sushi.jpg', 15.99),
                  ],
                ),
              ),
              _buildSummary('Subtotal', subtotal),
              _buildSummary('Tax & Fees', taxAndFees),
              _buildSummary('Delivery Fee', deliveryFee),
              const Divider(),
              _buildSummary('Total', total, isTotal: true),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF81A263),
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text(
                  'Checkout',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCartItem(String itemName, String itemImage, double itemPrice) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                itemImage,
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    itemName,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Playfair Display'),
                  ),
                  Text('\$${itemPrice.toStringAsFixed(2)}'),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.remove_circle_outline),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummary(String title, double value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontFamily: 'Playfair Display'),
          ),
          Text(
            '\$${value.toStringAsFixed(2)}',
            style: isTotal ? const TextStyle(fontSize: 18, fontWeight: FontWeight.bold) : null,
          ),
        ],
      ),
    );
  }
}

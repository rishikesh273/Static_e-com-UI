import 'package:flutter/material.dart';
import '../models/order.dart';

class OrderTrackingScreen extends StatelessWidget {
  final Order order;
  const OrderTrackingScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Order Tracking",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order details row
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    order.image,
                    width: 64,
                    height: 64,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Order Name: ${order.title}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        )),
                    const SizedBox(height: 4),
                    Text("Order ID: ${order.id}",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        )),
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),

            // Price
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: const Icon(Icons.attach_money, size: 24),
                ),
                const SizedBox(width: 12),
                Text("Total Price: \$${order.totalPrice}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    )),
              ],
            ),
            const SizedBox(height: 24),

            const Text("Tracking Status",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                )),
            const SizedBox(height: 16),

            Expanded(
              child: ListView(
                children: _buildTrackingSteps(order),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildTrackingSteps(Order order) {
    final steps = [
      {"title": "Order Placed", "subtitle": "Order placed on 07/20/2024", "completed": true},
      {"title": "Order Accepted", "subtitle": "Order accepted on 07/21/2024", "completed": true},
      {"title": "Order Packed", "subtitle": "Order packed on 07/22/2024", "completed": false},
      {"title": "Order Completed", "subtitle": "Order completed on 07/23/2024", "completed": false},
    ];

    List<Widget> widgets = [];
    for (int i = 0; i < steps.length; i++) {
      final step = steps[i];
      widgets.add(
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Icon(
                  step["completed"] as bool ? Icons.check_circle : Icons.radio_button_unchecked,
                  color: step["completed"] as bool ? Colors.black : Colors.grey,
                ),
                if (i != steps.length - 1)
                  Container(
                    height: 40,
                    width: 2,
                    color: Colors.grey.shade300,
                  ),
              ],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(step["title"] as String,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(height: 4),
                    Text(step["subtitle"] as String,
                        style: const TextStyle(fontSize: 14, color: Colors.grey)),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
      widgets.add(const SizedBox(height: 12));
    }
    return widgets;
  }
}

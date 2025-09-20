import 'package:flutter/material.dart';
import 'package:in_1/models/order.dart';
import 'package:in_1/models/product.dart';


class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product-detail', arguments: product.id);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.asset(
                  product.image, // 👈 fixed
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "\$${product.price}/month",
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//


class OrderCard extends StatelessWidget {
  final Order order;
  const OrderCard(this.order, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(order.image, width: 60, height: 60, fit: BoxFit.cover),
        ),
        title: Text(order.title),
        subtitle: Text("Order ID: ${order.id}"),
        trailing: Text(order.status, style: const TextStyle(color: Colors.blue)),
        onTap: () {
          Navigator.pushNamed(context, '/order-tracking', arguments: order.id);
        },
      ),
    );
  }
}

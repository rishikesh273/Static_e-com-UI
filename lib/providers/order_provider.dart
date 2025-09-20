import 'package:flutter/material.dart';
import '../models/order.dart';

class OrderProvider extends ChangeNotifier {
  final List<Order> _orders = [
    Order(
      id: "123456",
      title: "Drone",
      totalPrice: 250,
      status: "Ongoing",
      image: "assets/images/drones.png",
    ),
    Order(
      id: "654321",
      title: "Smart TV",
      totalPrice: 200,
      status: "Completed",
      image: "assets/images/tv.png",
    ),
  ];

  List<Order> get orders => _orders;

  List<Order> get activeOrders =>
      _orders.where((order) => order.status == "Ongoing").toList();

  List<Order> get pastOrders =>
      _orders.where((order) => order.status == "Completed").toList();

  Order findById(String id) => _orders.firstWhere((o) => o.id == id);
}

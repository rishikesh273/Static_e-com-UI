
import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductProvider extends ChangeNotifier {
  int _selectedPlanIndex = 2;
  int get selectedPlanIndex => _selectedPlanIndex;

  void changePlan(int index) {
    _selectedPlanIndex = index;
    notifyListeners();
  }

  Product mainProduct = Product(
    id: "p1",
    name: "Modern Sofa",
    description:
        "This stylish sofa is perfect for any modern living room. Comfortable and durable.",
    material: "Fabric",
    dimensions: "84\"W x 36\"D x 32\"H",
    color: "Gray",
    condition: "New",
    price: 150,
    image: "assets/images/sofa.png",
  );

  List<Product> relatedProducts = [
    Product(
      id: "p2",
      name: "Dining Table",
      description: "",
      material: "Wood",
      dimensions: "72\"W x 36\"D",
      color: "Brown",
      condition: "New",
      price: 120,
      image: "assets/images/dining_table.png",
    ),
    Product(
      id: "p3",
      name: "Smart TV",
      description: "",
      material: "Plastic/Glass",
      dimensions: "55 inch",
      color: "Black",
      condition: "New",
      price: 200,
      image: "assets/images/tv.png",
    ),
    Product(
      id: "p4",
      name: "DJI Drone",
      description: "",
      material: "Plastic",
      dimensions: "12\" x 12\"",
      color: "White",
      condition: "New",
      price: 250,
      image: "assets/images/drones.png",
    ),
    Product(
      id: "p5",
      name: "Headphones",
      description: "",
      material: "Plastic",
      dimensions: "-",
      color: "Black",
      condition: "New",
      price: 80,
      image: "assets/images/headphones.png",
    ),
    Product(
      id: "p6",
      name: "Shoe Rack",
      description: "",
      material: "Wood",
      dimensions: "36\"W x 12\"D x 30\"H",
      color: "Brown",
      condition: "New",
      price: 60,
      image: "assets/images/shoe_rack.png",
    ),
  ];
}

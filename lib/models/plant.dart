class PlantModel {
  final int id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final PlantType type;

  const PlantModel({
    required this.type,
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  @override
  String toString() {
    return "PlantModel{$name $price}; ";
  }
}

class CartItem {
  final int id;
  int quantity;
  double total;
  final PlantModel plantModel;

  CartItem({
    required this.id,
    this.quantity = 1,
    required this.plantModel,
  }) : total = quantity * plantModel.price;

  @override
  String toString() {
    return "CartItem{$PlantModel - $quantity}; ";
  }

  CartItem copyWith({
    int? id,
    int? quantity,
    PlantModel? plantModel,
  }) {
    return CartItem(
        id: id ?? this.id,
        plantModel: plantModel ?? this.plantModel,
        quantity: quantity ?? this.quantity);
  }
}

class Cart {
  final int id;
  List<CartItem> items;
  double total;

  Cart({required this.id, required this.items})
      : total = items.fold<double>(
            0.0, (previousValue, element) => previousValue + element.total);

  Cart copyWith({int? id, List<CartItem>? items}) {
    return Cart(id: id ?? this.id, items: items ?? this.items);
  }

  @override
  String toString() {
    return "Cart{total: $total, items: $items}";
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Cart &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          items == other.items &&
          total == other.total;

  @override
  int get hashCode => Object.hash(id, items, total);
}

List<PlantModel> plantModels = [
  const PlantModel(
      id: 1,
      name: "TARANTO",
      description: "Good",
      price: 1299.99,
      type: PlantType.plants,
      imageUrl: "assets/images/img1-removebg-preview.png"),
  const PlantModel(
      id: 2,
      name: "KAKTI",
      description: "Good",
      price: 1999.99,
      type: PlantType.flowers,
      imageUrl: "assets/images/img2-removebg-preview.png"),
  const PlantModel(
      id: 3,
      name: "ALONA",
      description: "Nice",
      price: 2999.99,
      type: PlantType.cacti,
      imageUrl: "assets/images/img4-removebg-preview.png"),
  const PlantModel(
      id: 4,
      name: "QUERY",
      description: "Nice",
      price: 2999.99,
      type: PlantType.cacti,
      imageUrl: "assets/images/img4-removebg-preview.png"),
  const PlantModel(
      id: 5,
      name: "QUERY",
      description: "Nice",
      price: 2999.99,
      type: PlantType.cacti,
      imageUrl: "assets/images/img4-removebg-preview.png"),
  const PlantModel(
      id: 6,
      name: "QUERY",
      description: "Nice",
      price: 2999.99,
      type: PlantType.cacti,
      imageUrl: "assets/images/img4-removebg-preview.png"),
];
List<CartItem> cartItems = [for(int i =0;i< plantModels.length;i++)CartItem(id: plantModels[i].id, plantModel: plantModels[i])];
enum PlantType { plants, flowers, cacti, herbs, boxibon }

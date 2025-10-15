class Item {
  final int? id; // optional, because SQLite auto-generates this
  final String name;
  final String description;

  Item({this.id, required this.name, required this.description});

  // Convert an Item object into a Map (for inserting into SQLite)
  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'description': description};
  }

  // Convert a Map (from SQLite) back into an Item object
  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'],
      name: map['name'],
      description: map['description'],
    );
  }

  @override
  String toString() {
    return 'Item{id: $id, name: $name, description: $description}';
  }
}

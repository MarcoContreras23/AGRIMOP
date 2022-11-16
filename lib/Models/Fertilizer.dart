class Fertilizer {
  int id;
  String name;

  Fertilizer({required this.id, required this.name});

  Map<String, dynamic> toMap(){
    return {'id': id, 'name': name};
  }

  @override
  String toString() {
    return 'Fertilizer{id: id, name: name}';
  }
}
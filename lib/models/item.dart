abstract class Item {
  String id;
  String title;
  bool completed;

  Item({required this.id, required this.title, this.completed = false});

  Item fromMap(Map<String, dynamic> map);


}

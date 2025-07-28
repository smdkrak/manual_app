class SubMenu {
  final String id;
  final String title;
  final String description;
  final String image;

  SubMenu({required this.id, required this.title, required this.description, required this.image});

  factory SubMenu.fromJson(Map<String, dynamic> json) {
    return SubMenu(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
    );
  }
}

class Menu {
  final String id;
  final String title;
  final List<SubMenu> subMenus;

  Menu({required this.id, required this.title, required this.subMenus});

  factory Menu.fromJson(Map<String, dynamic> json) {
    var list = json['subMenus'] as List;
    List<SubMenu> subList = list.map((i) => SubMenu.fromJson(i)).toList();

    return Menu(
      id: json['id'],
      title: json['title'],
      subMenus: subList,
    );
  }
}


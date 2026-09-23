class Menus {
  final List<Foods> foods;
  final List<Drinks> drinks;

  Menus({required this.foods, required this.drinks});

  factory Menus.fromJson(Map<String, dynamic> json) {
    return Menus(
      foods: json["foods"] != null
          ? List<Foods>.from(json["foods"]!.map((item) => Foods.fromJson(item)))
          : <Foods>[],
      drinks: json["drinks"] != null
          ? List<Drinks>.from(
              json["drinks"]!.map((item) => Drinks.fromJson(item)),
            )
          : <Drinks>[],
    );
  }
}

class Foods {
  final String name;
  Foods({required this.name});
  factory Foods.fromJson(Map<String, dynamic> json) {
    return Foods(name: json["name"]);
  }
}

class Drinks {
  final String name;
  Drinks({required this.name});
  factory Drinks.fromJson(Map<String, dynamic> json) {
    return Drinks(name: json["name"]);
  }
}

class Restaurants {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;

  Restaurants({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
  });
}

final List<Restaurants> restaurantList = [
  Restaurants(
    id: "rqdv5juczeskfw1e867",
    name: "Melting Pot",
    description: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. ...",
    pictureId: "14",
    city: "Medan",
    rating: 4.2,
  ),
  Restaurants(
    id: "s1knt6za9kkfw1e867",
    name: "Kafe Kita",
    description: "Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. ...",
    pictureId: "25",
    city: "Gorontalo",
    rating: 4,
  ),
];

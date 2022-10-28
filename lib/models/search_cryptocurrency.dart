class SearchCryptocurrency {
  final String uuid;
  final String iconUrl;
  final String name;
  final String symbol;
  final double price;

  SearchCryptocurrency({
    required this.uuid,
    required this.iconUrl,
    required this.name,
    required this.symbol,
    required this.price,
  });

  SearchCryptocurrency.fromMap(Map<String, dynamic> map)
      : uuid = map["uuid"],
        iconUrl = map["iconUrl"],
        name = map["name"],
        symbol = map["symbol"],
        price = double.parse(map["price"]);
}

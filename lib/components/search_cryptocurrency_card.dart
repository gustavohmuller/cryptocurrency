import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import 'package:cryptocurrency/models/search_cryptocurrency.dart';

class SearchCryptocurrencyCard extends StatelessWidget {
  final SearchCryptocurrency cryptocurrency;

  const SearchCryptocurrencyCard({Key? key, required this.cryptocurrency})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NumberFormat numberFormat = NumberFormat.decimalPattern("en_US");
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: SvgPicture.network(
                      cryptocurrency.iconUrl,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(cryptocurrency.name),
                      Text("${cryptocurrency.symbol}/USD"),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("\$${numberFormat.format(cryptocurrency.price)}"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

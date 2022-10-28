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
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0XFF3B4252),
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: const Color(0XFF3B4252).withOpacity(0.5)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Row(
                  children: [
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: SvgPicture.network(
                        cryptocurrency.iconUrl,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cryptocurrency.name,
                            style: const TextStyle(
                              color: Color(0XFFE6E6E6),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            "${cryptocurrency.symbol}/USD",
                            style: const TextStyle(
                              color: Color(0XFFE6E6E6),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "\$${numberFormat.format(cryptocurrency.price)}",
                    style: const TextStyle(
                      color: Color(0XFFE6E6E6),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import 'package:cryptocurrency/models/cryptocurrency.dart';

class CryptocurrencyCard extends StatelessWidget {
  final Cryptocurrency cryptocurrency;

  const CryptocurrencyCard({Key? key, required this.cryptocurrency})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NumberFormat numberFormat = NumberFormat.decimalPattern("en_US");
    final NumberFormat percentFormat =
        NumberFormat.decimalPercentPattern(locale: "en_US", decimalDigits: 2);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.grey[300]!.withOpacity(0.5)),
          boxShadow: [
            BoxShadow(
              offset: const Offset(5, 3),
              blurRadius: 15,
              spreadRadius: 1,
              color: Colors.grey[200]!,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 32,
                    height: 32,
                    child: SvgPicture.network(
                      cryptocurrency.iconUrl,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cryptocurrency.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 2.0),
                      Text(
                        "${cryptocurrency.symbol}/USD",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("\$${numberFormat.format(cryptocurrency.price)}"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        cryptocurrency.change > 0
                            ? Icons.arrow_drop_up_rounded
                            : Icons.arrow_drop_down_rounded,
                        size: 24,
                        color: getColor(cryptocurrency.change),
                      ),
                      Text(
                        percentFormat.format(cryptocurrency.change / 100),
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: getColor(cryptocurrency.change),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Color getColor(double change) {
  if (change > 0) {
    return Colors.green;
  }

  return Colors.red;
}

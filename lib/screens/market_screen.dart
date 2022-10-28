import 'package:flutter/material.dart';

import 'package:cryptocurrency/components/cryptocurrency_card.dart';
import 'package:cryptocurrency/models/cryptocurrency.dart';
import 'package:cryptocurrency/services/cryptocurrency_service.dart';

const List<int> list = <int>[20, 40, 60, 80, 100];
ValueNotifier<int> limit = ValueNotifier<int>(list.first);

class MarketScreen extends StatefulWidget {
  const MarketScreen({Key? key}) : super(key: key);

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFF0075FF),
        elevation: 0,
        title: const Text(
          "Market",
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Popular Cryptocurrencies",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color(0XFF0075FF),
                    ),
                  ),
                  Column(
                    children: const [
                      Text("Cryptos"),
                      SizedBox(width: 55, child: MarketDropdownButton()),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              ValueListenableBuilder(
                valueListenable: limit,
                builder: (context, value, child) => Column(
                  children: [
                    FutureBuilder<List<Cryptocurrency>>(
                      future: CryptocurrencyService.getCryptocurrencies(
                          limit: limit),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height / 1.5,
                            child: const Center(
                              child: CircularProgressIndicator(
                                color: Color(0XFF0075FF),
                              ),
                            ),
                          );
                        } else if (snapshot.hasData) {
                          List<Cryptocurrency> cryptocurrencysList =
                              snapshot.data!;
                          return Column(
                            children: cryptocurrencysList
                                .map((cryptocurrency) => CryptocurrencyCard(
                                    cryptocurrency: cryptocurrency))
                                .toList(),
                          );
                        }
                        return const Text("Try again later!");
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MarketDropdownButton extends StatefulWidget {
  const MarketDropdownButton({Key? key}) : super(key: key);

  @override
  State<MarketDropdownButton> createState() => _MarketDropdownButtonState();
}

class _MarketDropdownButtonState extends State<MarketDropdownButton> {
  int dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        value: dropdownValue,
        icon: const Icon(Icons.arrow_drop_down),
        elevation: 0,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        onChanged: (int? selectedValue) {
          setState(() {
            dropdownValue = selectedValue!;
            limit.value = selectedValue;
          });
        },
        items: list.map<DropdownMenuItem<int>>((int value) {
          return DropdownMenuItem<int>(
            value: value,
            child: Text(value.toString()),
          );
        }).toList(),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:cryptocurrency/components/bottom_bar.dart';
import 'package:cryptocurrency/components/cryptocurrency_card.dart';
import 'package:cryptocurrency/models/cryptocurrency.dart';
import 'package:cryptocurrency/services/cryptocurrency_service.dart';

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
        title: const Text("Market"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: Column(
            children: [
              const Text(
                "Popular Cryptocurrencies",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Column(
                children: [
                  FutureBuilder<List<Cryptocurrency>>(
                    future: CryptocurrencyService.getCryptocurrencies(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
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
                      return const Text("Try again!");
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}

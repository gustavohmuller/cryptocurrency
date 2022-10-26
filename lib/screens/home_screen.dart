import 'package:cryptocurrency/components/cryptocurrency_card.dart';
import 'package:cryptocurrency/models/cryptocurrency.dart';
import 'package:cryptocurrency/services/cryptocurrency_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: "Market",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: "Wallet",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: "Account",
          ),
        ],
      ),
    );
  }
}

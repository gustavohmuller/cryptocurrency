import 'package:cryptocurrency/components/bottom_bar.dart';
import 'package:cryptocurrency/components/search_cryptocurrency_card.dart';
import 'package:cryptocurrency/models/search_cryptocurrency.dart';
import 'package:cryptocurrency/services/cryptocurrency_service.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isLoading = false;

  List<SearchCryptocurrency> searchCryptocurrencyList = [];

  Future<void> searchCryptocurrency(String query) async {
    setState(() {
      isLoading = true;
    });
    searchCryptocurrencyList =
        (await CryptocurrencyService.getSearchCryptocurrency(query))!;
        print(searchCryptocurrencyList.length);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: Column(
            children: [
              TextField(
                onChanged: (query) {
                  searchCryptocurrency(query);
                },
              ),
              isLoading
                  ? const CircularProgressIndicator()
                  : ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: searchCryptocurrencyList.length,
                      itemBuilder: (context, index) {
                        return SearchCryptocurrencyCard(
                          cryptocurrency: searchCryptocurrencyList[index],
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}

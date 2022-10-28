import 'package:flutter/material.dart';

import 'package:cryptocurrency/components/search_cryptocurrency_card.dart';
import 'package:cryptocurrency/models/search_cryptocurrency.dart';
import 'package:cryptocurrency/services/cryptocurrency_service.dart';

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

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF2E3440),
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Search",
          textAlign: TextAlign.start,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  suffixIcon: const Icon(
                    Icons.search,
                    color: Color(0XFFE6E6E6),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        width: 0.0,
                        style: BorderStyle.none,
                      )),
                  hintText: "Search for cryptocurrency",
                  hintStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0XFF606777),
                  ),
                  fillColor: const Color(0XFF3B4252),
                  filled: true,
                ),
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0XFFE6E6E6),
                ),
                onChanged: (query) {
                  searchCryptocurrency(query);
                },
              ),
              const SizedBox(height: 4.0),
              isLoading
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height / 1.5,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: Color(0XFFE6E6E6),
                        ),
                      ),
                    )
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
    );
  }
}

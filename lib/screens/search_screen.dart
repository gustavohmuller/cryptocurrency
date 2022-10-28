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
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Search",
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
              TextField(
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.grey[500],
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        width: 0.0,
                        style: BorderStyle.none,
                      )),
                  hintText: "Search for cryptocurrency",
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[300],
                  ),
                  fillColor: Colors.grey[100],
                  filled: true,
                ),
                onChanged: (query) {
                  searchCryptocurrency(query);
                },
              ),
              isLoading
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height / 1.5,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: Color(0XFF0075FF),
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

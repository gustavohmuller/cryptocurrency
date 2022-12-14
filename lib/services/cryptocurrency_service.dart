import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:cryptocurrency/models/cryptocurrency.dart';
import 'package:cryptocurrency/models/search_cryptocurrency.dart';

class CryptocurrencyService {
  static const String url = "https://coinranking1.p.rapidapi.com";

  static const Map<String, String> headers = {
    'X-RapidAPI-Key': '0bf53b80f9mshd4f162b937ccd05p17b5ccjsnc87a78a80819',
    'X-RapidAPI-Host': 'coinranking1.p.rapidapi.com'
  };

  static Future<List<Cryptocurrency>> getCryptocurrencies(
      {required ValueNotifier<int> limit}) async {
    List<Cryptocurrency> cryptocurrencyList = [];

    http.Response response = await http
        .get(Uri.parse("$url/coins?limit=${limit.value}"), headers: headers);

    if (response.statusCode == 200) {
      List<dynamic> dynamicList = jsonDecode(response.body)["data"]["coins"];
      for (var jsonMap in dynamicList) {
        cryptocurrencyList.add(Cryptocurrency.fromMap(jsonMap));
      }
    }

    return cryptocurrencyList;
  }

  static Future<List<SearchCryptocurrency>?> getSearchCryptocurrency(
      String query) async {
    List<SearchCryptocurrency> cryptocurrencyList = [];

    http.Response response = await http.get(
        Uri.parse("$url/search-suggestions?query=$query"),
        headers: headers);

    if (response.statusCode == 200) {
      List<dynamic> dynamicList = jsonDecode(response.body)["data"]["coins"];
      for (var jsonMap in dynamicList) {
        cryptocurrencyList.add(SearchCryptocurrency.fromMap(jsonMap));
      }
    }

    return cryptocurrencyList;
  }
}

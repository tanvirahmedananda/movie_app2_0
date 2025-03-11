import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app2_0/model/now_showing_model.dart';
import 'package:movie_app2_0/services/base_api.dart';


class NowPlayingApiService{
  static Future<NowPlayingModel?> fetchNowpayingData(BuildContext context) async {
    print('********Service Now paying Function Called*******');
    NowPlayingModel? nowPlayingModel;
    final uri = '${baseUrl}now_playing?api_key=1b11a9f6356e930cb7542b3606c403f9&language=en-US&page=1';
    try{
      var response = await http.get(Uri.parse(uri),headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });
      var map = jsonDecode(response.body);
      if(response.statusCode==200){
        nowPlayingModel = NowPlayingModel.fromJson(map);
        return nowPlayingModel;
      }
    }
    catch(error){
      print('Error : $error');
    }
    print('Data fetch failed');
    return nowPlayingModel;
  }
}
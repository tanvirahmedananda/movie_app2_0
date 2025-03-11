import 'package:flutter/material.dart';
import 'package:movie_app2_0/model/now_showing_model.dart';
import 'package:movie_app2_0/model/popular_model.dart';
import 'package:movie_app2_0/services/now_playing_api_service.dart';

import '../services/popular_api_service.dart';

class HomeProvider extends ChangeNotifier{


  NowPlayingModel? nowPlayingModel;
  bool isNowPlayingDataLoaded = false;
  fetchHomeProviderNowShowing(BuildContext context) async {
    print('********Provider Now Showing Function Called*******');
    nowPlayingModel = await NowPlayingApiService.fetchNowpayingData(context);
    isNowPlayingDataLoaded = true;
    notifyListeners();
  }


  PopularModel? popularModel;
  bool isPopularDataLoaded = false;
  fetchHomeProviderPopular(BuildContext context) async {
    print('********Provider Popular Function Called*******');
    popularModel = await PopularApiService.fetchPopularData(context);
    isPopularDataLoaded = true;
    notifyListeners();
  }

}


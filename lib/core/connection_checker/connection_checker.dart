import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> isInternet() async {
  var con = await Connectivity().checkConnectivity();
  return con != ConnectivityResult.none;
}
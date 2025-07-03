import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> isConnected() async {
  var con = await Connectivity().checkConnectivity();
  return con != ConnectivityResult.none;
}
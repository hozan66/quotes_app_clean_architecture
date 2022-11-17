// Packages
import 'package:connectivity_plus/connectivity_plus.dart';

abstract class BaseNetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements BaseNetworkInfo {
  @override
  Future<bool> get isConnected async {
    // ConnectivityResult.none ==> means there is no internet connection
    return await Connectivity().checkConnectivity() != ConnectivityResult.none;
  }
}

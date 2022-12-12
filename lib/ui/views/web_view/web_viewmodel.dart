import 'package:stacked/stacked.dart';

const String _webViewLoading = "webview-loading-key";

class RegisterWebViewModel extends BaseViewModel {
  String _initialUrl = '';
  String get initialUrl => _initialUrl;

  bool get isWebViewLoading => busy(_webViewLoading);

  void setWebViewLoading(bool isLoading) {
    setBusyForObject(_webViewLoading, isLoading);
  }

  void initialise(String url) async {
    setWebViewLoading(true);
    _initialUrl = url;
  }
}

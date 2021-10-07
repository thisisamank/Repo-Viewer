import 'package:flutter/material.dart';
import 'package:repo_viewer/auth/infrastructure/github_authenticator.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AuthorizationPage extends StatefulWidget {
  const AuthorizationPage({
    Key? key,
    required this.authorizationUrl,
    required this.onAuthorizationAttempt,
  }) : super(key: key);
  final Uri authorizationUrl;
  final Function(Uri) onAuthorizationAttempt;

  @override
  _AuthorizationPageState createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebView(
          onWebViewCreated: (controller) {
            controller.clearCache();
            CookieManager().clearCookies();
          },
          navigationDelegate: (navigationRequest) {
            if (navigationRequest.url
                .startsWith(GithubAuthenticator.redirectUrl.toString())) {
              widget.onAuthorizationAttempt(Uri.parse(navigationRequest.url));
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
          initialUrl: widget.authorizationUrl.toString(),
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignInScreen(),
    );
  }
}

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final String clientId =
      '783748381221-sd0iaefmre7h65jmgim3t52uih696mpt.apps.googleusercontent.com';
  final String clientSecret = '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';
  final String redirectUri = 'https://lololand-20091.web.app/oauth2redirect';
  final String scope =
      'https://www.googleapis.com/auth/userinfo.profile https://www.googleapis.com/auth/userinfo.email';

  Future<void> _signInWithGoogle() async {
    try {
      final authorizationEndpoint =
          'https://accounts.google.com/o/oauth2/auth?response_type=code&client_id=$clientId&redirect_uri=$redirectUri&scope=$scope';

      final result = await FlutterWebAuth2.authenticate(
        url: authorizationEndpoint,
        callbackUrlScheme: "com.example.oathapp",
      );

      // Extract the full URL from the result
      final fullUrl = Uri.parse(result).queryParameters['full_url'];
      print('Full URL: $fullUrl');

      if (fullUrl != null) {
        // Parse the full URL to extract the authorization code
        final Uri uri = Uri.parse(fullUrl);
        final code = uri.queryParameters['code'];

        if (code != null) {
          print('Authorization Code: $code');

          // Exchange the authorization code for tokens
          final tokenEndpoint = 'https://oauth2.googleapis.com/token';
          final response = await http.post(
            Uri.parse(tokenEndpoint),
            headers: {
              'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: {
              'code': code,
              'client_id': clientId,
              'client_secret': clientSecret,
              'redirect_uri': redirectUri,
              'grant_type': 'authorization_code',
            },
          );

          final Map<String, dynamic> tokens = jsonDecode(response.body);

          final accessToken = tokens['access_token'];
          final refreshToken = tokens['refresh_token'];

          print('Access Token: $accessToken');
          print('Refresh Token: $refreshToken');
        } else {
          print('Authorization code not found in the URL.');
        }
      } else {
        print('No URL received.');
      }
    } catch (e) {
      print('Error during Google Sign-In: $e');
      if (e is PlatformException) {
        print('Error details: ${e.details}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Sign-In'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _signInWithGoogle,
          child: Text('Sign in with Google'),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mucs/Views/auth/Signin/widgets/signin_component.dart';

class SigninScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(child: Column(children: [SigninComponent()])),
    );
  }
}

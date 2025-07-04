import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mucs/Data/blocs/auth/bloc/sigin_bloc.dart';

class SigninComponent extends StatefulWidget {
  const SigninComponent({super.key});

  @override
  State<SigninComponent> createState() => _SigninComponentState();
}

class _SigninComponentState extends State<SigninComponent> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isLoading = false;
  void onTap() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isNotEmpty && password.isNotEmpty) {
      context.read<SiginBloc>().add(
        SigninInitialEvent(email: email, password: password),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter email and password")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SiginBloc, SiginState>(
      listener: (context, state) {
        if (state is SiginLoadingState) {
          setState(() => isLoading = true);
        } else {
          setState(() => isLoading = false);
        }

        if (state is SiginSuccessedState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("✅ Login successful")));
          // Navigate to home or dashboard
        } else if (state is SigninErrorState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("❌ ${state.errMsg}")));
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 24),
              isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                    onPressed: () => onTap(),
                    child: const Text("Sign In"),
                  ),
            ],
          ),
        );
      },
    );
  }
}

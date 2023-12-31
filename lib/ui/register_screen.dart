// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:regres_app/bloc/auth/auth_bloc.dart';
import 'package:regres_app/helper/router_name.dart';
import 'package:regres_app/ui/widget/main_button.dart';
import 'package:regres_app/ui/widget/main_textfield.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final AuthBloc _authBloc = AuthBloc();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Register',
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16.0,
              ),
              MainTextFormField(
                controller: _email,
                hintText: 'Masukkan email',
                maxLines: 1,
              ),
              const SizedBox(
                height: 16.0,
              ),
              MainTextFormField(
                controller: _password,
                hintText: 'Masukkan password',
                obscureText: true,
                maxLines: 1,
              ),
              const SizedBox(
                height: 16.0,
              ),
              BlocConsumer<AuthBloc, AuthState>(
                bloc: _authBloc,
                listener: (context, state) {
                  if (state is PostRegisterSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Success Registrasi')),
                    );
                    context.pushNamed(login);
                  } else if (state is PostRegisterError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.error)),
                    );
                  }
                  // TODO: implement listener
                },
                builder: (context, state) {
                  return MainButton(
                    title: state is PostRegisterLoading
                        ? 'Loading...'
                        : 'Register',
                    onPressed: state is PostRegisterLoading
                        ? null
                        : () {
                            _authBloc.add(PostRegisterEvent(
                                email: _email.text, password: _password.text));
                          },
                  );
                },
              ),
              const SizedBox(
                height: 16.0,
              ),
              Text.rich(TextSpan(children: [
                const TextSpan(text: 'Sudah mempunyai akun? '),
                TextSpan(
                    text: ' Login Sekarang',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => context.pushNamed(login),
                    style: const TextStyle(fontWeight: FontWeight.bold))
              ]))
            ],
          ),
        ),
      ),
    );
  }
}

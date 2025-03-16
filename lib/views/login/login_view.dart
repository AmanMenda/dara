import 'package:dara/constants/routes.dart';
import 'package:dara/helpers/extensions/media_query.dart';
import 'package:dara/helpers/validators.dart';
import 'package:dara/theme/colors.dart';
import 'package:dara/viewmodels/login_viewmodel.dart';
import 'package:dara/views/shared/input_field.dart';
import 'package:flutter/material.dart';
import 'package:dara/views/base.view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dara/theme/sizes.dart';

class LoginView extends StatefulWidget {
  const LoginView({ super.key });

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Positioned(
                left: 0,
                top: context.screenHeight * 0.5, // Commence à 50% de la hauteur
                bottom: 0,
                width: context.screenWidth,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      opacity: 0.7,
                      image: AssetImage('assets/images/1.jpg'),
                      fit: BoxFit.cover,
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                ),
              ),
              SafeArea(child: child!)
            ]
          )
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          right: Spacing.medium,
          left: Spacing.medium
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Dara", style: GoogleFonts.cabin(fontWeight: FontWeight.w900, fontSize: 36)),
            SizedBox(height: context.screenHeight * 0.02),
            Text(
              "Faites les bons choix pour votre santé.",
              softWrap: true,
              maxLines: 2,
              style: GoogleFonts.cabin(fontWeight: FontWeight.w500, fontSize: 22, height: 1.3),
            ),
            SizedBox(height: context.screenHeight * 0.05),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, RoutePaths.register);
                },
                child: Text(
                  "Pas encore de compte ? Clique ici pour t'inscrire",
                  style: GoogleFonts.cabin(
                    color: Colors.grey,
                    decoration: TextDecoration.underline,
                    fontSize: 12
                  )
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: _emailController,
                      hintText: 'Email :',
                      validator: Validators.emailValidator(
                        emptyErrorMsg: 'Le champs email ne peut être laissé vide.',
                        invalidFormatMsg: 'Veuillez entrer une adresse email valide.',
                      ),
                    ),
                    const SizedBox(height: 24),
                    CustomTextFormField(
                      controller: _passwordController,
                      hintText: 'Mot de passe',
                      obscureText: !_isPasswordVisible,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                      validator: Validators.passwordValidator(
                        emptyErrorMsg: "Le champs mot de passe ne peut être laissé vide.",
                        invalidFormatMsg: "Le mot de passe doit contenir au moins 8 caractères.",
                      )
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.yellow.withOpacity(0.8),
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
                        ),
                        onPressed: () {
                          // if (_formKey.currentState!.validate()) {
                          //   model.login(_emailController.text, _passwordController.text);
                          // }
                        },
                        child: Text('Se connecter', style: GoogleFonts.cabin(fontWeight: FontWeight.w400, fontSize: 14, height: 1.3, color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
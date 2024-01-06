import 'package:app_cafe/features/auth/presentation/widgets/double_bezier_curve_clipper.dart';
import 'package:app_cafe/features/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import '../../../../config/theme/app_theme.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colorScheme = AppTheme().getTheme().colorScheme;
    final textTheme = AppTheme().getTheme().textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: DoubleBezierCurveClipper(size: size),
              child: Container(
                height: size.height * 0.55,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 200,
                      left: 30,
                      child: Text(
                        'Inicio de sesión',
                        style: TextStyle(
                            color: colorScheme.background,
                            fontSize: 26,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: size.height * 0.45,
              width: double.infinity,
              child: const _LoginForm(),
            )
          ],
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final iconScheme = AppTheme().getTheme().iconTheme;
    final textStyles = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          const Spacer(),
          CustomTextFormField(
            onFieldSubmitted: (value) {},
            label: 'Correo',
            suffixIcon: Icon(
              Icons.email,
              color: iconScheme.color,
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: 25,
          ),
          CustomTextFormField(
            onFieldSubmitted: (value) {},
            suffixIcon: Icon(
              Icons.remove_red_eye,
              color: iconScheme.color,
            ),
            label: 'Contraseña',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: 60,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            child: CustomFilledButton(
              radius: const Radius.circular(15),
              text: 'Ingresar',
              onPressed: () {},
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '¿Aún no tienes una cuenta?',
                style: textStyles.labelSmall,
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Crea una aquí',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.red,
                    ),
                  ))
            ],
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}

import 'package:app_cafe/features/auth/presentation/providers/auth_provider.dart';
import 'package:app_cafe/features/auth/presentation/providers/login_form_provider.dart';
import 'package:app_cafe/features/auth/presentation/widgets/double_bezier_curve_clipper.dart';
import 'package:app_cafe/features/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../config/theme/app_theme.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colorScheme = AppTheme().getTheme().colorScheme;
    //final textTheme = AppTheme().getTheme().textTheme;

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
              child: const Center(child: _LoginForm()),
              //child: const Center(child: Text('data')),
            )
          ],
        ),
      ),
    );
  }
}

class _LoginForm extends ConsumerWidget {
  const _LoginForm({super.key});

  //Method that displays scaffold message
  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final iconScheme = AppTheme().getTheme().iconTheme;
    final textStyles = Theme.of(context).textTheme;
    // Watch: Get the value of the state and know when if it changes
    final loginForm = ref.watch(loginFormProvider);

    ref.listen(authNotifierProvider, (prevState, nextState) {
      if (nextState.errorMessage.isEmpty) return;
      _showMessage(context, nextState.errorMessage);
    });

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Correo',
            suffixIcon: Icon(
              Icons.email,
              color: iconScheme.color,
            ),
            keyboardType: TextInputType.emailAddress,
            errorMessage:
                loginForm.isFormPosted ? loginForm.email.errorMessage : null,
            onChanged: (value) {
              // Read: Get the value of a provider just once (dont listen for state changes)
              ref.read(loginFormProvider.notifier).onEmailChange(value);
            },
          ),
          const SizedBox(
            height: 25,
          ),
          CustomTextFormField(
            //obscureText: true,
            suffixIcon: Icon(
              Icons.remove_red_eye,
              color: iconScheme.color,
            ),
            label: 'Contraseña',
            errorMessage:
                loginForm.isFormPosted ? loginForm.password.errorMessage : null,
            onChanged: (value) {
              ref.read(loginFormProvider.notifier).onPasswordChanged(value);
            },
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            child: CustomFilledButton(
              radius: const Radius.circular(15),
              text: 'Ingresar',
              onPressed: () {
                ref.read(loginFormProvider.notifier).onFormSubmit();
              },
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
        ],
      ),
    );
  }
}

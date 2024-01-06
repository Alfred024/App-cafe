import 'package:app_cafe/config/theme/app_theme.dart';
import 'package:app_cafe/features/auth/presentation/providers/login_form_provider.dart';
import 'package:app_cafe/features/auth/presentation/providers/register_form_provider.dart';
import 'package:app_cafe/features/auth/presentation/widgets/double_bezier_curve_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/widgets/widgets.dart';

// TODO: Implementar función para comparar las 2 contraseñas
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppTheme().getTheme().colorScheme;
    final size = MediaQuery.of(context).size;
    //final scaffoldBackgroundColor = Theme.of(context).scaffoldBackgroundColor;
    final textStyles = Theme.of(context).textTheme;

    return Scaffold(
        body: SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipPath(
            clipper: DoubleBezierCurveClipper(size: size),
            child: Container(
              height: size.height * 0.35,
              width: double.infinity,
              decoration: BoxDecoration(
                color: colorScheme.primary,
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 100,
                    left: 30,
                    child: Text(
                      'Crea una cuenta',
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
            height: size.height * 0.65,
            width: double.infinity,
            child: const Center(child: _RegisterForm()),
          ),
        ],
      ),
    ));
  }
}

class _RegisterForm extends ConsumerWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const textFieldsWidth = 320.0;
    const textFieldsHeight = 65.0;
    final iconScheme = AppTheme().getTheme().iconTheme;
    final textStyles = Theme.of(context).textTheme;
    final registerForm = ref.watch(registerFormProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          CustomTextFormField(
            width: textFieldsWidth,
            height: textFieldsHeight,
            label: 'Nombre completo',
            keyboardType: TextInputType.name,
            suffixIcon: Icon(
              Icons.account_circle_rounded,
              color: iconScheme.color,
            ),
            errorMessage: registerForm.isFormPosted
                ? registerForm.name.errorMessage
                : null,
            onChanged: (value) {
              ref.read(registerFormProvider.notifier).onNameChanged(value);
            },
          ),
          const SizedBox(height: 25),
          CustomTextFormField(
            width: textFieldsWidth,
            height: textFieldsHeight,
            label: 'Correo',
            keyboardType: TextInputType.emailAddress,
            suffixIcon: Icon(
              Icons.email,
              color: iconScheme.color,
            ),
            errorMessage: registerForm.isFormPosted
                ? registerForm.email.errorMessage
                : null,
            onChanged: (value) {
              ref.read(registerFormProvider.notifier).onEmailChange(value);
            },
          ),
          const SizedBox(height: 25),
          CustomTextFormField(
            width: textFieldsWidth,
            height: textFieldsHeight,
            label: 'Contraseña',
            suffixIcon: Icon(
              Icons.lock,
              color: iconScheme.color,
            ),
            errorMessage: registerForm.isFormPosted
                ? registerForm.password.errorMessage
                : null,
            onChanged: (value) {
              ref.read(registerFormProvider.notifier).onPasswordChanged(value);
            },
          ),
          const SizedBox(height: 25),
          CustomTextFormField(
            width: textFieldsWidth,
            height: textFieldsHeight,
            label: 'Confirme la contraseña',
            suffixIcon: Icon(
              Icons.lock,
              color: iconScheme.color,
            ),
            errorMessage: registerForm.isFormPosted
                ? registerForm.password.errorMessage
                : null,
            onChanged: (value) {
              ref.read(registerFormProvider.notifier).onPasswordChanged(value);
            },
          ),
          const SizedBox(height: 60),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            child: CustomFilledButton(
              radius: const Radius.circular(15),
              text: 'Registrar cuenta',
              onPressed: () {
                ref.read(registerFormProvider.notifier).onFormSubmit();
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '¿Ya tienes una cuenta?',
                style: textStyles.labelSmall,
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Ingresa aquí',
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

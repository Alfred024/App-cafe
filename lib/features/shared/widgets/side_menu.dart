import 'package:app_cafe/config/config.dart';
import 'package:app_cafe/features/auth/presentation/providers/auth_provider.dart';
import 'package:app_cafe/features/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SideMenu extends ConsumerStatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({super.key, required this.scaffoldKey});

  @override
  SideMenuState createState() => SideMenuState();
}

class SideMenuState extends ConsumerState<SideMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;
    final textStyles = Theme.of(context).textTheme;
    final colorScheeme = AppTheme().getTheme().colorScheme;
    final size = MediaQuery.of(context).size;

    return NavigationDrawer(
        elevation: 1,
        selectedIndex: navDrawerIndex,
        onDestinationSelected: (value) {
          setState(() {
            navDrawerIndex = value;
          });

          // final menuItem = appMenuItems[value];
          // context.push( menuItem.link );
          widget.scaffoldKey.currentState?.closeDrawer();
        },
        children: [
          Container(
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.fromLTRB(20, hasNotch ? 0 : 20, 16, 0),
            child: Text('Saludos usuario', style: textStyles.titleMedium),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 16, 28, 10),
            child: Divider(
              color: colorScheeme.primary,
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 10, 16, 10),
            child: Text('Otras opciones proximamente...'),
          ),
          SizedBox(
            height: size.height * 0.65,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomFilledButton(
              onPressed: () {
                ref.read(authNotifierProvider.notifier).logout();
              },
              text: 'Cerrar sesión',
              radius: const Radius.circular(20),
            ),
          ),
        ]);
  }
}

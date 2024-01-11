import 'package:app_cafe/config/menu/menu_items.dart';
import 'package:app_cafe/features/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import '../../../../config/theme/app_theme.dart';
// Agregar la dependencia go_router
//import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      endDrawer: SideMenu(scaffoldKey: scaffoldKey),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            //onPressed: () => context.pop(),
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Text('Profile page'),
        centerTitle: true,
      ),
      body: Column(children: [
        const SizedBox(
          height: 200,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/pp.jpg'),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Dora la exploradora',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 70,
        ),
        Expanded(
            child: ListView.builder(
                itemCount: profilePageMenuItems.length,
                itemBuilder: (context, index) {
                  final menuItem = profilePageMenuItems[index];
                  return _MenuListItem(menuItem: menuItem);
                })),
      ]),
    );
  }
}

class _MenuListItem extends StatelessWidget {
  final MenuItem menuItem;
  const _MenuListItem({required this.menuItem});

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme().getTheme().colorScheme;

    return ListTile(
      title: Text(menuItem.title),
      leading: Icon(menuItem.icon, color: colors.primary),
      trailing: Icon(
        Icons.edit,
        color: colors.primary,
      ),
      onTap: () {},
      //onTap: () => context.push(menuItem.link);,
    );
  }
}

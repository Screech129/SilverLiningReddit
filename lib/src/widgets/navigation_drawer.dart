import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sparkitecture/src/blocs/authentication_bloc.dart';
import 'package:sparkitecture/src/helpers/constants.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Sparkitecture'),
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
            ),
          ),
          ListTile(
            title: Text('Logout'),
            onTap: () {
              BlocProvider.of<AuthenticationBloc>(context).add(
                LogOutButtonPressed(),
              );
              Navigator.of(context).pushNamedAndRemoveUntil(
                  NavigationConstants.home, (Route<dynamic> route) => false);
            },
          ),
        ],
      ),
    );
  }
}

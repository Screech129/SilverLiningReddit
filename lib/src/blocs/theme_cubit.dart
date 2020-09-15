import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:sparkitecture/src/helpers/theme.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit(ThemeData state) : super(state);

  void lightThemeEmitter() => emit(lightTheme);

  void darkThemeEmitter() => emit(darkTheme);
}

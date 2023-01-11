part of 'app_bloc.dart';

abstract class AppState extends Equatable {
  const AppState();
}

class AppInitial extends AppState {
  @override
  List<Object> get props => [];
}

class ChangeLocalizationState extends AppState {
  final Locale locale;

  const ChangeLocalizationState({required this.locale});

  @override
  List<Object> get props => [locale];
}

class LightAppModeState extends AppState {

  @override
  List<Object> get props => [];
}

class DarkAppModeState extends AppState {

  @override
  List<Object> get props => [];
}
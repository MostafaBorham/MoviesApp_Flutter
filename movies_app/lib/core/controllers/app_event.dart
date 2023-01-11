part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();
}

class ChangeLocalizationEvent extends AppEvent {
  final BuildContext context;

  const ChangeLocalizationEvent({required this.context});

  @override
  List<Object> get props => [];
}

class ChangeAppModeEvent extends AppEvent {
  final bool isDarkMode;

  const ChangeAppModeEvent({required this.isDarkMode});
  @override
  List<Object> get props => [isDarkMode];
}
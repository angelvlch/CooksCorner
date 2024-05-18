part of 'main_page_bloc.dart';

@immutable
sealed class MainPageEvent {}

class TabChange extends MainPageEvent {
  final int tabIndex;

  TabChange({required this.tabIndex});
}

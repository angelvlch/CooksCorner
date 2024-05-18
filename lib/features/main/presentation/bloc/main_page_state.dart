part of 'main_page_bloc.dart';

@immutable
sealed class MainPageState {
  final int tabIndex;

  const MainPageState({required this.tabIndex});
}

final class MainPageInitial extends MainPageState {
  const MainPageInitial({required super.tabIndex});
}

part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class HomeLoading extends HomeState {}
final class HomeLoaded extends HomeState {
  final List<ThemeModel> themes;
  final List<MinifigModel> minifigs;
  final List<SetModel> sets;
  HomeLoaded(this.themes, this.minifigs, this.sets);
}
final class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}

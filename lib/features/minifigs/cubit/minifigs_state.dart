part of 'minifigs_cubit.dart';

@immutable
sealed class MinifigsState {}

final class MinifigsInitial extends MinifigsState {}
final class MinifigsLoading extends MinifigsState {}
final class MinifigsLoaded extends MinifigsState {
  final List<MinifigModel> minifigs;
  MinifigsLoaded(this.minifigs);
}
final class MinifigsError extends MinifigsState {
  final String message;
  MinifigsError(this.message);
}

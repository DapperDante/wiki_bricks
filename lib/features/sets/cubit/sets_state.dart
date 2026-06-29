part of 'sets_cubit.dart';

@immutable
sealed class SetsState {}

final class SetsInitial extends SetsState {}
final class SetsLoading extends SetsState {}
final class SetsLoaded extends SetsState {
  final List<SetModel> sets;
  SetsLoaded(this.sets);
}
final class SetsError extends SetsState {
  final String message;
  SetsError(this.message);
}
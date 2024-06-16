part of 'amthal_cubit.dart';

@immutable
sealed class AmthalState {}

final class AmthalInitial extends AmthalState {}
final class AmthalLoading extends AmthalState {}
final class AmthalLoaded extends AmthalState {}
final class AmthalError extends AmthalState {}

part of 'avatar_cubit.dart';

sealed class AvatarState extends Equatable {
  const AvatarState();

  @override
  List<Object> get props => [];
}

final class AvatarInitial extends AvatarState {}
// ignore: must_be_immutable
final class AvatarData extends AvatarState {
  Color color;
  IconData shape;
  String name;
  String action;

  AvatarData({
    required this.color,
    required this.shape,
    required this.name,
    required this.action
  });

  @override
  List<Object> get props => [action, name, shape, color];

  AvatarData copyThis({
    Color? color,
    IconData? shape,
    String? name,
    String? action,
  }) {
    return AvatarData(
      color: color ?? this.color,
      shape: shape ?? this.shape,
      name: name ?? this.name,
      action: action ?? this.action,
    );
  }
}

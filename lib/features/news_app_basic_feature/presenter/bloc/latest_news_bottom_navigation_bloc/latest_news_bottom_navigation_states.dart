import 'package:equatable/equatable.dart';

abstract class LatestNewsBottomNavigationState extends Equatable {}

class LatestNewsBottomNavigationCurrentState
    extends LatestNewsBottomNavigationState {
  final int _currentIndex;

  LatestNewsBottomNavigationCurrentState({int? currentIndex})
      : _currentIndex = currentIndex ?? 0;

  get currentIndex => _currentIndex;

  @override
  List<Object?> get props => [_currentIndex];
}

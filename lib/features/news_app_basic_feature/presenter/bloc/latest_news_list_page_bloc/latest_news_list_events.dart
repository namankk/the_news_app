import 'package:equatable/equatable.dart';

abstract class LatestNewsEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnLatestNewsViewInitialise extends LatestNewsEvents {}

class OnTapLatestNewsTile extends LatestNewsEvents {}

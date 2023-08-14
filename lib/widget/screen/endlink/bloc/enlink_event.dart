part of 'endlink_bloc.dart';


@immutable
abstract class EndlinkEvent {}

class GetEnlinkModel extends EndlinkEvent {}
class UpdateUrl extends EndlinkEvent {
  final String url;

  UpdateUrl({required this.url});
}
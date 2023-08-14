part of 'endlink_bloc.dart';

class EndlinkDataState extends Equatable {
  final String url;
  final bool loading;
  final EndlinkModel endlinkModel;

  EndlinkDataState({required String this.url, required bool this.loading, required EndlinkModel this.endlinkModel});

  @override
  List<Object?> get props => [
        url,
        loading,
        endlinkModel,
      ];

  EndlinkDataState copyWith({
    String? url,
    bool? loading,
    EndlinkModel? endlinkModel,
  }) {
    return EndlinkDataState(
      url: url ?? this.url,
      loading: loading ?? this.loading,
      endlinkModel: endlinkModel ?? this.endlinkModel,
    );
  }


  /// {@macro dealer_sign_in_state}
  factory EndlinkDataState.initial() {
    return EndlinkDataState(
      url: 'iss85Nyk',
      endlinkModel: EndlinkModel(),
      loading: true,
    );
  }
}

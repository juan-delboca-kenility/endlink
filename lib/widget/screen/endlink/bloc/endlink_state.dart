part of 'endlink_bloc.dart';

class EndlinkDataState extends Equatable {
  final String url;
  final bool loading;
  final int currentIndex;
  final EndlinkModel endlinkModel;

  EndlinkDataState({required this.url, required this.loading, required this.endlinkModel, required this.currentIndex});

  @override
  List<Object?> get props => [
        url,
        loading,
        endlinkModel,
        currentIndex,
      ];

  EndlinkDataState copyWith({
    String? url,
    bool? loading,
    EndlinkModel? endlinkModel,
    int? currentIndex,
  }) {
    return EndlinkDataState(
      url: url ?? this.url,
      loading: loading ?? this.loading,
      currentIndex: currentIndex ?? this.currentIndex,
      endlinkModel: endlinkModel ?? this.endlinkModel,
    );
  }


  /// {@macro dealer_sign_in_state}
  factory EndlinkDataState.initial() {
    return EndlinkDataState(
      url: 'iss85Nyk',
      endlinkModel: EndlinkModel(),
      loading: true,
      currentIndex: 0,
    );
  }
}

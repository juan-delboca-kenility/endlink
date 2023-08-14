import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:enterprise_endlink/model/endlink_model.dart';
import 'package:enterprise_endlink/service/media/_interface.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'enlink_event.dart';

part 'endlink_state.dart';

class EndlinkBloc extends Bloc<EndlinkEvent, EndlinkDataState> {
  EndlinkBloc() : super(EndlinkDataState.initial()) {
    on<GetEnlinkModel>(_getEndlinkModel);
    on<UpdateUrl>(_updateUrl);
  }

  Future<FutureOr<void>> _getEndlinkModel(GetEnlinkModel event, Emitter emit) async {
    emit(state.copyWith(loading: true));
    MediaService mediaService = GetIt.I.get();
    log('CHALLENGE about to gett the endlink');
    final endlinkModel = await mediaService.fetchEndlink(state.url);
    log('CHALLENGE storing the endlink');
    emit(state.copyWith(endlinkModel: endlinkModel, loading: false));
    log('CHALLENGE endlink stored');
  }

  FutureOr<void> _updateUrl(UpdateUrl event, Emitter<EndlinkDataState> emit) {
    emit(state.copyWith(url: event.url));
  }
}
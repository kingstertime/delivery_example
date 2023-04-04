import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:superdostavka/core/safe_coding/src/either.dart';
import 'package:superdostavka/domain/catalog/catalog.dart';
import 'package:superdostavka/domain/core/extended_errors.dart';
import 'package:superdostavka/logic/core/state_data.dart';
import 'package:superdostavka/logic/repository.dart';

part 'catalog_bloc.freezed.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  static CatalogBloc makeInstance() {
    return _instance ??= CatalogBloc._();
  }

  static CatalogBloc? _instance;
  CatalogBloc._() : super(const CatalogState.initial()) {
    on<_CatalogEventGetCatalog>(_getCatalog);
  }

  Future _getCatalog(
      _CatalogEventGetCatalog event, Emitter<CatalogState> emit) async {
    emit(const CatalogState.gotCatalog(StateData.loading()));
    final repo = Repository.makeInstance();
    final result = await repo.getCatalog(event.cityId);
    emit(CatalogState.gotCatalog(StateData.result(result)));
  }
}

@freezed
class CatalogEvent with _$CatalogEvent {
  const factory CatalogEvent() = _CatalogEvent;

  const factory CatalogEvent.getCatalog(int cityId) = _CatalogEventGetCatalog;
}

/// Передается внутреннее подсостояние типа [CatalogStateData<T>],
/// каждое из которых
/// может содержать динамику.
@freezed
class CatalogState with _$CatalogState {
  const factory CatalogState.initial() = _CatalogStateInitial;

  const factory CatalogState.gotCatalog(
          StateData<Either<ExtendedErrors, Catalog>> data) =
      _CatalogStateGotCatalog;
}

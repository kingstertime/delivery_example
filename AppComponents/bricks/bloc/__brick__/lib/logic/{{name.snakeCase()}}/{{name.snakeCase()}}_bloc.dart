/*
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '{{name.snakeCase()}}_bloc.freezed.dart';

class {{name.pascalCase()}}Bloc extends Bloc<{{name.pascalCase()}}Event, {{name.pascalCase()}}State> {
  static {{name.pascalCase()}}Bloc makeInstance() {
    return _instance ??= {{name.pascalCase()}}Bloc._();
  }
  static {{name.pascalCase()}}Bloc? _instance;
  {{name.pascalCase()}}Bloc._() : super(const {{name.pascalCase()}}State.initial()) {

    // Примеры подключения
    on<_{{name.pascalCase()}}SampleIntEvent>(_sampleWithIntData);
    on<_{{name.pascalCase()}}SampleBoolEvent>(_sampleWithBoolData);

  }

  /// Пример #1 обработки подсостояний
  Future _sampleWithIntData(_{{name.pascalCase()}}SampleIntEvent event, Emitter<{{name.pascalCase()}}State> emit) async {
    emit(const {{name.pascalCase()}}State.sampleWithIntData(StateData.loading()));

  // какие-то дела

  // результат
  if(DateTime.now() == DateTime.now()){
    emit({{name.pascalCase()}}State.sampleWithIntData(StateData.result(left(ExtendedErrors.empty()))));
  }
    emit({{name.pascalCase()}}State.sampleWithIntData(StateData.result(right(10))));
  }

  /// Пример #2 обработки подсостояний
  Future _sampleWithBoolData(_{{name.pascalCase()}}SampleBoolEvent event, Emitter<{{name.pascalCase()}}State> emit) async {
    emit(const {{name.pascalCase()}}State.sampleWithBoolData(StateData.loading()));

    // какие-то дела

    // результат
    if(DateTime.now() == DateTime.now()){
      emit({{name.pascalCase()}}State.sampleWithBoolData(StateData.result(left(ExtendedErrors.empty()))));
    }
    emit({{name.pascalCase()}}State.sampleWithBoolData(StateData.result(right(true))));
  }

}


@freezed
class {{name.pascalCase()}}Event with _${{name.pascalCase()}}Event {
  const factory {{name.pascalCase()}}Event() = _{{name.pascalCase()}}Event;

  // Примеры!
  const factory {{name.pascalCase()}}Event.sampleInt() = _{{name.pascalCase()}}SampleIntEvent;
  const factory {{name.pascalCase()}}Event.sampleBool() = _{{name.pascalCase()}}SampleBoolEvent;
  //~ Примеры!

}

/// Передается внутреннее подсостояние типа [{{name.pascalCase()}}StateData<T>],
/// каждое из которых
/// может содержать динамику.
@freezed
class {{name.pascalCase()}}State with _${{name.pascalCase()}}State {
  const factory {{name.pascalCase()}}State.initial() = _{{name.pascalCase()}}StateInitial;

  // Примеры!

  /// Пример простого стейта без субсостояний
  const factory {{name.pascalCase()}}State.sampleLoading() = _{{name.pascalCase()}}StateLoading;
  /// Пример простого стейта без субсостояний
  const factory {{name.pascalCase()}}State.sampleError(ExtendedErrors error) = _{{name.pascalCase()}}StateError;
  /// Пример простого стейта без субсостояний
  const factory {{name.pascalCase()}}State.sampleResult(int data) = _{{name.pascalCase()}}StateResult;

  // Примеры стейта с данными субсостояния.
  //  Могут заменить три простых для одного типа данных
  const factory {{name.pascalCase()}}State.sampleWithIntData(StateData<ErrOrInt> data) = _{{name.pascalCase()}}StateSampleWithIntData;
  //  Могут заменить три простых для одного типа данных
  const factory {{name.pascalCase()}}State.sampleWithBoolData(StateData<ErrOrBool> data) = _{{name.pascalCase()}}StateSampleWithBoolData;

  //~ Примеры!

}

*/

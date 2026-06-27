import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'skils_event.dart';
part 'skils_state.dart';

class SkilsBloc extends Bloc<SkilsEvent, SkilsState> {
  SkilsBloc() : super(SkilsInitial()) {
    on<SkilsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

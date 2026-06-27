import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'edaduation_event.dart';
part 'edaduation_state.dart';

class EdaduationBloc extends Bloc<EdaduationEvent, EdaduationState> {
  EdaduationBloc() : super(EdaduationInitial()) {
    on<EdaduationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

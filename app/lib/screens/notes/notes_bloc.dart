import 'package:flutter_bloc/flutter_bloc.dart';
import 'notes_event.dart';
import 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  NotesBloc() : super(NotesState.initial()) {
    // Aquí registramos el manejador para el evento AddNote
    on<AddNote>((event, emit) {
      // Se agrega la nota al estado actual
      final updatedNotes = List<String>.from(state.notes)..add(event.note);
      // Se emite el nuevo estado con la lista de notas actualizada
      emit(state.copyWith(notes: updatedNotes));
    });
  }
}

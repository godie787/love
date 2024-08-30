import 'package:equatable/equatable.dart';

abstract class NotesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddNote extends NotesEvent {
  final String note;

  AddNote(this.note);

  @override
  List<Object> get props => [note];
}

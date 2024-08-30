import 'package:equatable/equatable.dart';

class NotesState extends Equatable {
  final List<String> notes;

  NotesState({required this.notes});

  factory NotesState.initial() {
    return NotesState(notes: []);
  }

  NotesState copyWith({List<String>? notes}) {
    return NotesState(
      notes: notes ?? this.notes,
    );
  }

  @override
  List<Object> get props => [notes];
}

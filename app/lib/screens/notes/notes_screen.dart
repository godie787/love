import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'notes_bloc.dart';
import 'notes_event.dart';
import 'notes_state.dart';

class NotesScreen extends StatefulWidget {
  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> with SingleTickerProviderStateMixin {
  final TextEditingController _controller = TextEditingController();
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notitas',
          style: GoogleFonts.pacifico(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        backgroundColor: Colors.pinkAccent,
      ),
      body: BlocBuilder<NotesBloc, NotesState>(
        builder: (context, state) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple.shade600, Colors.pink.shade400],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: state.notes.isEmpty
                ? _buildEmptyState(context)
                : SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            spacing: 20, // Espacio horizontal entre burbujas
                            runSpacing: 20, // Espacio vertical entre burbujas
                            children: List.generate(state.notes.length, (index) {
                              return _buildNoteBubble(context, text: state.notes[index], index: index);
                            }),
                          ),
                        ),
                      ),
                    ),
                  ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddNoteDialog(context);
        },
        backgroundColor: Colors.pinkAccent,
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.pinkAccent,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: GoogleFonts.pacifico(fontSize: 12, fontWeight: FontWeight.w300),
        unselectedLabelStyle: GoogleFonts.pacifico(fontSize: 12, fontWeight: FontWeight.w300),
        currentIndex: 1, // Indica que estamos en la pantalla de Notas
        onTap: (int index) {
          if (index == 0) {
            Navigator.pop(context); // Volver a la pantalla principal
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note),
            label: 'Notas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note),
            label: 'Notas express',
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "No hay burbujas aún...",
            style: GoogleFonts.pacifico(
              textStyle: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          SizedBox(height: 20),
          Icon(Icons.sentiment_dissatisfied, color: Colors.white.withOpacity(0.8), size: 60),
        ],
      ),
    );
  }

  Widget _buildNoteBubble(BuildContext context, {required String text, required int index}) {
    // Cambiar tamaño de la burbuja basado en el índice
    double size = 100 + (index % 3) * 40; // 3 tamaños diferentes para variar el diseño

    return ScaleTransition(
      scale: Tween(begin: 0.95, end: 1.05).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Curves.easeInOut,
        ),
      ),
      child: Container(
        width: size,
        height: size,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black.withOpacity(0.3),
          backgroundBlendMode: BlendMode.overlay,
          border: Border.all(
            color: Colors.blueAccent.withOpacity(0.7),
            width: 2.0,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.blueAccent.withOpacity(0.4),
              blurRadius: 15.0,
              offset: Offset(0.0, 0.0),
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.pacifico(
              textStyle: TextStyle(
                color: Colors.white.withOpacity(0.9),
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  void _showAddNoteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.pink.shade50,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text(
            "Nueva Nota",
            style: GoogleFonts.pacifico(fontSize: 24, fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
          content: TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: "Escribe una notita...",
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Cancelar",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  context.read<NotesBloc>().add(AddNote(_controller.text));
                  _controller.clear();
                  Navigator.of(context).pop();
                }
              },
              child: Text("Agregar"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

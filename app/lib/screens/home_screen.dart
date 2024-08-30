import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../screens/notes/notes_screen.dart';
import '../screens/notes/notes_bloc.dart';
import '../screens/notes/notes_state.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NotesScreen()),
      );
    }
    // Puedes agregar más navegaciones aquí según el index
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Nuestra App',
          style: GoogleFonts.pacifico(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        backgroundColor: Colors.pinkAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Acción de búsqueda
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 16.0), // Margen superior de 16.0
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple.shade600, Colors.pink.shade400],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            // Sección de "Historias"
            Container(
              height: 100,
              padding: EdgeInsets.symmetric(vertical: 10),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildStoryItem(
                    context,
                    label: "Álbum de Fotos",
                    icon: Icons.photo_album,
                    color: Colors.pinkAccent,
                    onPressed: () {
                      // Navegar a la pantalla de Álbum de Fotos
                    },
                  ),
                  _buildStoryItem(
                    context,
                    label: "Notas",
                    icon: Icons.note,
                    color: Colors.purpleAccent,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NotesScreen()),
                      );
                    },
                  ),
                  _buildStoryItem(
                    context,
                    label: "Calendario",
                    icon: Icons.calendar_today,
                    color: Colors.orangeAccent,
                    onPressed: () {
                      // Navegar a la pantalla de Calendario
                    },
                  ),
                  _buildStoryItem(
                    context,
                    label: "Películas y Series",
                    icon: Icons.movie,
                    color: Colors.blueAccent,
                    onPressed: () {
                      // Navegar a la pantalla de Películas y Series
                    },
                  ),
                  _buildStoryItem(
                    context,
                    label: "Metas y Sueños",
                    icon: Icons.favorite,
                    color: Colors.redAccent,
                    onPressed: () {
                      // Navegar a la pantalla de Metas y Sueños
                    },
                  ),
                  _buildStoryItem(
                    context,
                    label: "Recetas",
                    icon: Icons.fastfood,
                    color: Colors.greenAccent,
                    onPressed: () {
                      // Navegar a la pantalla de Recetas
                    },
                  ),
                ],
              ),
            ),
            
            // Sección del Feed
            Expanded(
              child: BlocBuilder<NotesBloc, NotesState>(
                builder: (context, state) {
                  if (state.notes.isNotEmpty) {
                    final lastNote = state.notes.last;
                    return ListView(
                      padding: EdgeInsets.all(16),
                      children: [
                        _buildFeedItem(
                          context,
                          title: "Última Nota",
                          description: lastNote,
                          color: Colors.purpleAccent,
                        ),
                        // Puedes agregar más ítems similares
                      ],
                    );
                  } else {
                    return Center(
                      child: Text(
                        "No hay notas aún",
                        style: GoogleFonts.pacifico(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.pinkAccent,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: GoogleFonts.pacifico(fontSize: 12, fontWeight: FontWeight.w300),
        unselectedLabelStyle: GoogleFonts.pacifico(fontSize: 12, fontWeight: FontWeight.w300),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
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
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }

  Widget _buildStoryItem(BuildContext context,
      {required String label, required IconData icon, required Color color, required VoidCallback onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 80,
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: color,
              child: Icon(icon, color: Colors.white),
            ),
            SizedBox(height: 5),
            Flexible(
              child: Text(
                label,
                style: GoogleFonts.pacifico(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeedItem(BuildContext context,
      {required String title, required String description, required Color color}) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.pacifico(
              textStyle: TextStyle(
                color: color,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            description,
            style: GoogleFonts.pacifico(
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

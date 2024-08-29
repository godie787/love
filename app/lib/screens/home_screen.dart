import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Nuestra Aventura',
          style: GoogleFonts.pacifico(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 24,
              shadows: [
                Shadow(
                  blurRadius: 6.0,
                  color: Colors.black26,
                  offset: Offset(1.0, 1.0),
                ),
              ],
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple.shade600, Colors.pink.shade400],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            children: [
              _buildOptionCard(
                context,
                icon: Icons.photo_album,
                label: "Álbum de Fotos",
                color: Colors.pinkAccent,
                onTap: () {
                  // Navegar al álbum de fotos
                },
              ),
              _buildOptionCard(
                context,
                icon: Icons.note,
                label: "Notas",
                color: Colors.purpleAccent,
                onTap: () {
                  // Navegar a las notas
                },
              ),
              _buildOptionCard(
                context,
                icon: Icons.calendar_today,
                label: "Tareas y Calendario",
                color: Colors.orangeAccent,
                onTap: () {
                  // Navegar al calendario
                },
              ),
              _buildOptionCard(
                context,
                icon: Icons.movie,
                label: "Películas y Series",
                color: Colors.blueAccent,
                onTap: () {
                  // Navegar a la lista de películas y series
                },
              ),
              _buildOptionCard(
                context,
                icon: Icons.favorite,
                label: "Metas y Sueños",
                color: Colors.redAccent,
                onTap: () {
                  // Navegar a las metas y sueños compartidos
                },
              ),
              _buildOptionCard(
                context,
                icon: Icons.fastfood,
                label: "Recetas Favoritas",
                color: Colors.greenAccent,
                onTap: () {
                  // Navegar a las recetas
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionCard(BuildContext context,
      {required IconData icon,
      required String label,
      required Color color,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50,
              color: Colors.white,
            ),
            SizedBox(height: 10),
            Text(
              label,
              style: GoogleFonts.pacifico(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  shadows: [
                    Shadow(
                      blurRadius: 4.0, // Reducción de la sombra
                      color: Colors.black26, // Sombra más suave
                      offset: Offset(1.0, 1.0),
                    ),
                  ],
                  fontWeight: FontWeight.w300, // Letras más finas
                ),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

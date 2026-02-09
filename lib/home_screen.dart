import 'package:flutter/material.dart';

class SignSightHome extends StatelessWidget {
  const SignSightHome({super.key});

  static const primaryColor = Color(0xFF2B2D5D);
  static const pageBg = Color(0xFFF5F7FF);
  static const iconCircle = Color(0xFFE9F3FF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBg,

      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        title: const Text(
          "SignSight",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Container(
              width: double.infinity,
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(24),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    // ===== Title =====
                    const Text(
                      "SignSight",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      "Breaking communication barriers with real-time sign language translation",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),

                    const SizedBox(height: 24),

                    _primaryButton("Start Translating"),

                    const SizedBox(height: 32),

                    // Feature Cards
                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      alignment: WrapAlignment.center,
                      children: [
                        _featureCard(
                          icon: Icons.camera_alt_outlined,
                          title: "Capture Signs",
                          subtitle:
                          "Use your camera to capture sign language in real-time.",
                          isMobile: constraints.maxWidth < 650,
                        ),
                        _featureCard(
                          icon: Icons.text_fields,
                          title: "Text Translation",
                          subtitle:
                          "Convert signs to readable text instantly.",
                          isMobile: constraints.maxWidth < 650,
                        ),
                        _featureCard(
                          icon: Icons.volume_up_outlined,
                          title: "Voice Output",
                          subtitle:
                          "Listen to spoken translations for better communication.",
                          isMobile: constraints.maxWidth < 650,
                        ),
                      ],
                    ),

                    const SizedBox(height: 32),

                    _howItWorksCard(),

                    const SizedBox(height: 24),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _primaryButton("Start Translating"),
                        const SizedBox(width: 16),
                        OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 22,
                              vertical: 14,
                            ),
                            side: const BorderSide(color: primaryColor),
                          ),
                          onPressed: () {},
                          icon: const Icon(Icons.history, color: primaryColor),
                          label: const Text(
                            "View History",
                            style: TextStyle(color: primaryColor),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),


      // ===== Bottom Navigation =====
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: primaryColor,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.translate), label: "Translate"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
        ],
      ),
    );
  }

  // ===== Primary Button =====
  static Widget _primaryButton(String text) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: () {},
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }

  static Widget _featureCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool isMobile,
  }) {
    return Container(
      width: isMobile ? double.infinity : 240,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: const BoxDecoration(
              color: iconCircle,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: primaryColor),
          ),
          const SizedBox(height: 14),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: primaryColor,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black54, fontSize: 14),
          ),
        ],
      ),
    );
  }

  // ===== How It Works =====
  static Widget _howItWorksCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "How It Works",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: primaryColor,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 12),
          Text("1. Point your camera at sign language gestures."),
          SizedBox(height: 6),
          Text("2. Press and hold the record button to capture signs."),
          SizedBox(height: 6),
          Text("3. View the translation as text or listen to voice output."),
          SizedBox(height: 6),
          Text("4. All translations are saved in your History for future reference."),
        ],
      ),
    );
  }
}
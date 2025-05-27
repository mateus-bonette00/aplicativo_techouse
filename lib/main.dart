import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:android_intent_plus/android_intent.dart';
import 'package:device_apps/device_apps.dart';


void main() => runApp(ITASEGApp());

class ITASEGApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TecHouse',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFF1A1A1A),
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => HomeScreen()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0301),
      body: const Center(
        child: Image(
          image: AssetImage('assets/logo.png'),
          width: 200,
        ),
      ),
    );
  }
}

Future<void> _launchExternal(Uri uri) async {
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    debugPrint('Não conseguiu abrir $uri');
  }
}

class HomeScreen extends StatelessWidget {
  final Uri instaUri = Uri.parse('https://instagram.com/techouseitajuba');
  final Uri mapsUri = Uri.parse(
    'https://www.google.com/maps/search/?api=1&query=Rua+Coronel+Goulart+6,+Boa+Vista,+Itajubá,+MG,+Brasil',
  );

  void _openWhatsApp() =>
    _launchExternal(Uri.parse('whatsapp://send?phone=5535998829986'));

  void _openInstagram() => _launchExternal(instaUri);
  void _openGoogleMaps() => _launchExternal(mapsUri);

  /// Abre o app Android do pacote [packageName] direto,
/// sem mostrar o chooser.
Future<void> _openApp(String packageName) async {
  // verifica se está instalado
  final isInstalled = await DeviceApps.isAppInstalled(packageName);
  if (!isInstalled) {
    debugPrint('App $packageName não está instalado');
    return;
  }
  // abre direto a MainActivity
  await DeviceApps.openApp(packageName);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0301),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // Logo
              Container(
                margin: const EdgeInsets.symmetric(vertical: 40),
                child: const Image(
                  image: AssetImage('assets/logo.png'),
                  width: 120, height: 120,
                ),
              ),
              // Botões
              Expanded(
                child: Column(
                  children: [
                    _buildStyledButton(
                      label: 'WhatsApp',
                      icon: SvgPicture.asset(
                        'assets/wpp.svg',
                        width: 24, height: 24, color: Colors.white,
                      ),
                      onPressed: _openWhatsApp,
                    ),
                    const SizedBox(height: 16),
                    _buildStyledButton(
                      label: 'Instagram',
                      icon: SvgPicture.asset(
                        'assets/insta.svg',
                        width: 24, height: 24, color: Colors.white,
                      ),
                      onPressed: _openInstagram,
                    ),
                    const SizedBox(height: 16),
                    _buildStyledButton(
                      label: 'Localização',
                      icon: SvgPicture.asset(
                        'assets/location.svg',
                        width: 24, height: 24, color: Colors.white,
                      ),
                      onPressed: _openGoogleMaps,
                    ),
                   const SizedBox(height: 16),
_buildStyledButton(
  label: 'ISIC Lite',
  icon: const Icon(Icons.apps, color: Colors.white),
  onPressed: () => _openApp('com.intelbras.isiclite'),  // de br.com… para com.intelbras…
),
const SizedBox(height: 16),

_buildStyledButton(
  label: 'WD-MOB V2',
  icon: const Icon(Icons.apps, color: Colors.white),
  onPressed: () => _openApp('com.mcu.JFL'),             // JFL corresponde ao WD-MOB V2
),
const SizedBox(height: 16),

_buildStyledButton(
  label: 'AMT Mobile V2',
  icon: const Icon(Icons.apps, color: Colors.white),
  onPressed: () => _openApp('br.com.amt.v2'),            // achado como br.com.amt.v2
),
const SizedBox(height: 16),

_buildStyledButton(
  label: 'Active Mobile V4',
  icon: const Icon(Icons.apps, color: Colors.white),
  onPressed: () => _openApp('br.virtus.jfl.amiot'),
),
                  ],
                ),
              ),
              // Footer
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.copyright, color: Colors.white70, size: 16),
                    SizedBox(width: 4),
                    Text(
                      'Desenvolvido por Mateus Bonette',
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStyledButton({
    required String label,
    required Widget icon,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: double.infinity, height: 56,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 8, offset: const Offset(0, 2),
        )],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Container(
                  width: 40, height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF8C00),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(child: icon),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    label,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black87),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

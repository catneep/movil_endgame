import 'package:flutter/material.dart';

import '../widgets/elements/profile_image.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({ Key? key }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          // TODO: change static values with DB
          children: const [
            ProfilePortrait(image: 'https://static01.nyt.com/images/2021/09/14/science/07CAT-STRIPES/07CAT-STRIPES-jumbo.jpg?quality=75&auto=webp'),
            SizedBox(height: 16),
            ProfileText(
              name: 'dasdadsgsggadgadfvadbfb',
              accountType: 'accountType',
              flag: 'flag'
            ),
            SizedBox(height: 40),
            _ProfileOptions()
          ],
        ),
      ),
    );
  }
}

class _ProfileOptions extends StatelessWidget {
  const _ProfileOptions({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Sincronizar con tarjeta
        Card(
          child: TextButton(
            onPressed: () {},
            child: const Text('Sincronizar con tarjeta'),
            
          ),
        ),
        // Calibrar giroscopio
        TextButton(
          onPressed: () {},
          child: const Text('Calibrar giroscopio'),
        ),
        // Cerrar sesión
        TextButton(
          onPressed: () {},
          child: const Text('Cerrar sesión'),
        ),
      ]
      
    );
  }
}
import 'package:flutter/material.dart';

class ModuleTile extends StatelessWidget {
  const ModuleTile({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
  }) : super(key: key);
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.3,
      child: ListTile(
        visualDensity: VisualDensity.comfortable,
        contentPadding: const EdgeInsets.all(12),
        title: LayoutBuilder(
          builder: (_, cons) => Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width >= 900
                    ? cons.biggest.width / 5
                    : 22,
              ),
              Container(
                height: 46,
                width: 46,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF03425F),
                ),
                child: Center(
                  child: Icon(
                    icon,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  final List<String> services = const [
    'GST Filing',
    'Business Advisory',
    'Licensing & Registration',
    'Intellectual Property',
    'Shareholding Agreements',
  ];

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.onPrimary;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Divider(thickness: 1, color: Colors.white30),
        const SizedBox(height: 24),
        Text(
          'Services We Provide',
          style: textTheme.headlineSmall?.copyWith(
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 24,
          runSpacing: 12,
          children:
              services
                  .map(
                    (service) => Text(
                      service,
                      style: textTheme.bodyLarge?.copyWith(
                        color: color,
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  )
                  .toList(),
        ),
        const SizedBox(height: 40),
        Divider(color: Colors.white24),
        const SizedBox(height: 16),
        Text(
          '© 2025 MUCS | Madhav Upadhyay – Company Secretary',
          textAlign: TextAlign.center,
          style: textTheme.bodySmall?.copyWith(
            color: Colors.white70,
            fontSize: 13,
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final int count;
  final Color color;

  const DashboardCard({
    super.key,
    required this.icon,
    required this.label,
    required this.count,
    this.color = Colors.blueAccent,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: 150,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: color.withOpacity(0.1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 36, color: color),
            const SizedBox(height: 12),
            Text(
              '$count',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color),
            ),
            Text(
              label,
              style: const TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}


class DashboardCards extends StatelessWidget {
  const DashboardCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: const [
        DashboardCard(
          icon: Icons.store,
          label: 'Vendors',
          count: 48,
          color: Colors.deepPurple,
        ),
        DashboardCard(
          icon: Icons.engineering,
          label: 'Technicians',
          count: 122,
          color: Colors.orange,
        ),
        DashboardCard(
          icon: Icons.design_services,
          label: 'Services',
          count: 76,
          color: Colors.green,
        ),
        DashboardCard(
          icon: Icons.build_circle,
          label: 'Refurbished',
          count: 32,
          color: Colors.teal,
        ),
        DashboardCard(
          icon: Icons.people,
          label: 'Users',
          count: 1400,
          color: Colors.indigo,
        ),
        DashboardCard(
          icon: Icons.reviews,
          label: 'Reviews',
          count: 320,
          color: Colors.redAccent,
        ),
      ],
    );
  }
}

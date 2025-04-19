import 'package:auto_route/auto_route.dart';
import 'package:fixitbhaii_admin/widgets/app_drawer.dart';
import 'package:fixitbhaii_admin/widgets/dashboard_card.dart';
import 'package:fixitbhaii_admin/widgets/quick_action_card.dart';
import 'package:fixitbhaii_admin/widgets/syncfusion_chart_widget.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FixitBhaii Admin Dashboard')),
      drawer: const AdminDrawer(), // optional drawer
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Welcome Admin",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            DashboardCards(), // stats cards
            const SizedBox(height: 24),
            const Text("Analytics",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 12),
            SizedBox(
              height: 250,
              child: SyncfusionChart(), // you'll create this separately
            ),
            const SizedBox(height: 24),
            const Text("Quick Access",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                QuickActionCard(
                    icon: Icons.store,
                    label: 'Vendors',
                    onTap: () {/* route */}),
                QuickActionCard(
                    icon: Icons.build,
                    label: 'Technicians',
                    onTap: () {/* route */}),
                QuickActionCard(
                    icon: Icons.miscellaneous_services,
                    label: 'Services',
                    onTap: () {/* route */}),
                QuickActionCard(
                    icon: Icons.recycling,
                    label: 'Refurbished',
                    onTap: () {/* route */}),
                QuickActionCard(
                    icon: Icons.support,
                    label: 'Complaints',
                    onTap: () {/* route */}),
                QuickActionCard(
                    icon: Icons.campaign,
                    label: 'Notify',
                    onTap: () {/* route */}),
                QuickActionCard(
                    icon: Icons.bar_chart,
                    label: 'Reports',
                    onTap: () {/* route */}),
                QuickActionCard(
                    icon: Icons.settings,
                    label: 'Settings',
                    onTap: () {/* route */}),
              ],
            )
          ],
        ),
      ),
    );
  }
}

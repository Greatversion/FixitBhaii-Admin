import 'package:auto_route/auto_route.dart';
import 'package:fixitbhaii_admin/routes/app.route_names.dart';
import 'package:fixitbhaii_admin/routes/app.routes.gr.dart';
import 'package:flutter/material.dart';


@RoutePage()
class AdminDrawer extends StatefulWidget {
  const AdminDrawer({super.key});

  @override
  State<AdminDrawer> createState() => _AdminDrawerState();
}

class _AdminDrawerState extends State<AdminDrawer> {
  
  @override
  Widget build(BuildContext context) {
    // final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.deepPurple.shade100,
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                      'assets/images/admin_avatar.png'), // Add placeholder
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Admin Panel",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "admin@fixitbhaii.com",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildDrawerItem(context,
                    icon: Icons.dashboard,
                    title: "Dashboard",
                    route: AppRouteName.dashboard),
                _buildDrawerItem(context,
                    icon: Icons.category,
                    title: "Categories",
                    route: AppRouteName.dashboard),
                _buildDrawerItem(context,
                    icon: Icons.layers,
                    title: "Divisions",
                    route: AppRouteName.dashboard),
                _buildDrawerItem(context,
                    icon: Icons.home_repair_service,
                    title: "Services",
                    route: AppRouteName.dashboard),
                _buildDrawerItem(context,
                    icon: Icons.store,
                    title: "Vendors",
                    route: AppRouteName.dashboard),
                _buildDrawerItem(context,
                    icon: Icons.engineering,
                    title: "Technicians",
                    route: AppRouteName.dashboard),
                _buildDrawerItem(context,
                    icon: Icons.people,
                    title: "Users",
                    route: AppRouteName.dashboard),
                _buildDrawerItem(context,
                    icon: Icons.devices_other,
                    title: "Refurbished",
                    route: AppRouteName.dashboard),
                _buildDrawerItem(context,
                    icon: Icons.reviews,
                    title: "Reviews",
                    route: AppRouteName.dashboard),
                _buildDrawerItem(context,
                    icon: Icons.account_balance_wallet,
                    title: "Transactions",
                    route: AppRouteName.dashboard),
                _buildDrawerItem(context,
                    icon: Icons.image,
                    title: "Banners",
                    route: AppRouteName.dashboard),
                _buildDrawerItem(context,
                    icon: Icons.developer_mode,
                    title: "Feature Flags",
                    route: AppRouteName.dashboard),
                _buildDrawerItem(context,
                    icon: Icons.bug_report,
                    title: "System Logs",
                    route: AppRouteName.dashboard),
              ],
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Logout"),
            onTap: () async {
              // await authProvider.logout();
              if (mounted) {
                // ignore: use_build_context_synchronously
                // AutoRouter.of(context).push(LoginRoute());
              }
            },
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String route,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () => AutoRouter.of(context).pushNamed(route),
    );
  }
}

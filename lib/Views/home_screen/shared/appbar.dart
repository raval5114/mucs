import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final double elevation;
  final Color backgroundColor;
  final bool showBackButton;
  final Widget titleWidget;
  final void Function(int)? onNavItemTap;

  const CustomAppBar({
    super.key,
    this.elevation = 0,
    this.backgroundColor = Colors.transparent,
    this.showBackButton = true,
    required this.titleWidget,
    this.onNavItemTap,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 12);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  String selectedRole = 'Login';

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 800;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return AppBar(
      backgroundColor: widget.backgroundColor,
      elevation: widget.elevation,
      automaticallyImplyLeading: widget.showBackButton,
      title: widget.titleWidget,
      actions:
          isWide
              ? [
                _buildNavItem(context, 'About Us', 1),
                _buildNavItem(context, 'Services', 2),
                _buildNavItem(context, 'Clients', 3),
                _buildNavItem(context, 'Blogs', 4),
                _buildNavItem(context, 'Contact Us', 5),
                _buildLoginDropdown(context),
                const SizedBox(width: 12),
              ]
              : [_buildResponsiveMenu(context), const SizedBox(width: 12)],
    );
  }

  Widget _buildNavItem(BuildContext context, String label, int index) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: TextButton.icon(
        onPressed: () => widget.onNavItemTap?.call(index),
        icon: const Icon(Icons.circle, size: 6, color: Colors.white),
        label: Text(
          label,
          style: textTheme.bodyMedium?.copyWith(
            color: colorScheme.onPrimary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildLoginDropdown(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        dropdownColor: colorScheme.primary,
        iconEnabledColor: colorScheme.onPrimary,
        value: selectedRole == 'Login' ? null : selectedRole,
        hint: Text(
          'Login',
          style: textTheme.bodyMedium?.copyWith(
            color: colorScheme.onPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        items:
            ['Admin', 'Clients']
                .map(
                  (String role) => DropdownMenuItem<String>(
                    value: role,
                    child: Text(
                      role,
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onPrimary,
                      ),
                    ),
                  ),
                )
                .toList(),
        onChanged: (String? newValue) {
          if (newValue != null) {
            setState(() {
              selectedRole = newValue;
            });
            // Redirect logic
          }
        },
      ),
    );
  }

  Widget _buildResponsiveMenu(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return PopupMenuButton<int>(
      icon: Icon(Icons.menu, color: colorScheme.onPrimary),
      onSelected: (index) {
        // Use Future.microtask to prevent triggering after unmount
        Future.microtask(() {
          if (index == 1001) {
            // Navigate to Admin login
          } else if (index == 1002) {
            // Navigate to Client login
          } else {
            widget.onNavItemTap?.call(index);
          }
        });
      },
      itemBuilder:
          (context) => [
            PopupMenuItem<int>(
              value: 1,
              child: Text('About Us', style: textTheme.bodyMedium),
            ),
            PopupMenuItem<int>(
              value: 2,
              child: Text('Services', style: textTheme.bodyMedium),
            ),
            PopupMenuItem<int>(
              value: 4,
              child: Text('Blogs', style: textTheme.bodyMedium),
            ),
            PopupMenuItem<int>(
              value: 5,
              child: Text('Contact Us', style: textTheme.bodyMedium),
            ),
            const PopupMenuDivider(),
            PopupMenuItem<int>(
              enabled: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Login as', style: textTheme.labelLarge),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () => Navigator.pop(context, 1001),
                    child: Text('• Admin', style: textTheme.bodyMedium),
                  ),
                  const SizedBox(height: 4),
                  GestureDetector(
                    onTap: () => Navigator.pop(context, 1002),
                    child: Text('• Client', style: textTheme.bodyMedium),
                  ),
                ],
              ),
            ),
          ],
      color: colorScheme.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }
}

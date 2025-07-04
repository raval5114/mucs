import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mucs/Data/blocs/homescreen/homepage/bloc/homescreen_bloc.dart';
import 'package:shimmer/shimmer.dart';

class AboutUsSection extends StatefulWidget {
  const AboutUsSection({super.key});

  @override
  State<AboutUsSection> createState() => _AboutUsSectionState();
}

class _AboutUsSectionState extends State<AboutUsSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final color = Theme.of(context).colorScheme.onPrimary;

    // Simulated highlight data (would typically come from backend)

    final Map<String, IconData> iconMap = {
      "verified_user": Icons.verified_user,
      "workspace_premium": Icons.workspace_premium,
      "gavel": Icons.gavel,
      "access_time": Icons.access_time,
      "thumb_up": Icons.thumb_up,
      "check_circle": Icons.check_circle,
    };

    return BlocConsumer<HomescreenBloc, HomescreenState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is HomeScreenLoadingState) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          );
        }

        if (state is HomeScreenSucessState) {
          final List<Map<String, dynamic>> highlights =
              state.data['aboutSection']['highlights'];
          List<String> aboutText = state.data['aboutSection']['aboutTexts'];
          return FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1000),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 48),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'About Me',
                          textAlign: TextAlign.center,
                          style: textTheme.headlineMedium?.copyWith(
                            color: color,
                            fontWeight: FontWeight.bold,
                            fontSize: 38,
                          ),
                        ),
                        const SizedBox(height: 24),
                        ...aboutText.map(
                          (e) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Text(
                              '$e',
                              textAlign: TextAlign.center,
                              style: textTheme.titleMedium?.copyWith(
                                color: color.withOpacity(0.95),
                                fontSize: 20,
                                height: 1.7,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Wrap(
                          spacing: 32,
                          runSpacing: 16,
                          alignment: WrapAlignment.center,
                          children:
                              highlights.map((item) {
                                final iconKey = item['icon']?.toString() ?? '';
                                final icon =
                                    iconMap.containsKey(iconKey)
                                        ? iconMap[iconKey]
                                        : Icons.info_outline;

                                return Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(icon, color: color),
                                    const SizedBox(width: 8),
                                    Text(
                                      item['text'] ?? '',
                                      style: textTheme.titleSmall?.copyWith(
                                        color: color,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                );
                              }).toList(),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }

        return const SizedBox(); // fallback
      },
    );
  }
}

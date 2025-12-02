import 'dart:ui';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  static const List<Color> gradientColors = [
    Color(0xFF0D1B2A),
    Color(0xFF1B263B),
    Color(0xFF415A77),
    Color(0xFF778DA9),
    Color(0xFF9A8C98),
    Color(0xFFE9C46A),
    Color(0xFFF4A261),
    Color(0xFFE76F51),
  ];

  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: gradientColors,
  );

  static const Color primaryColor = Color(0xFF004D40);
  static const Color accentColor = Color(0xFFE9C46A);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 800;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: backgroundGradient),
        child: SafeArea(
          child: Column(
            children: [
              _buildNavigation(context),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildHeroSection(context, isMobile),
                      const SizedBox(height: 80),
                      _buildFeaturesSection(context, isMobile),
                      const SizedBox(height: 80),
                      _buildScreenshotsSection(context, isMobile),
                      const SizedBox(height: 80),
                      _buildFinalCTASection(context, isMobile),
                      const SizedBox(height: 60),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavigation(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              _IconBadge(icon: Icons.auto_awesome),
              const SizedBox(width: 12),
              const Text(
                'For Fajr',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: () => _navigateToSignUp(context),
            child: const Text(
              'Sign In',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context, bool isMobile) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 60.0),
      child: isMobile
          ? Column(
              children: [
                _buildHeroContent(context),
                const SizedBox(height: 40),
                _buildHeroVisual(),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: _buildHeroContent(context)),
                const SizedBox(width: 40),
                Expanded(child: _buildHeroVisual()),
              ],
            ),
    );
  }

  Widget _buildHeroContent(BuildContext context) {
    return _GlassContainer(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _IconBadge(icon: Icons.auto_awesome, size: 60),
            const SizedBox(height: 24),
            const Text(
              'Start Sharing Khayr',
              style: TextStyle(
                color: Colors.white,
                fontSize: 48,
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Connect with your community, share moments of faith, and inspire others on their spiritual journey.',
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.7),
                fontSize: 20,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 32),
            Wrap(
              spacing: 16,
              runSpacing: 12,
              children: [
                ElevatedButton(
                  onPressed: () => _navigateToSignUp(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                OutlinedButton(
                  onPressed: () => _navigateToSignUp(context),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: accentColor,
                    side: const BorderSide(color: accentColor, width: 2),
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Explore Features',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroVisual() {
    return _GlassContainer(
      child: Container(
        height: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.auto_awesome,
                size: 80,
                color: accentColor,
              ),
              const SizedBox(height: 20),
              Text(
                'For Fajr',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeaturesSection(BuildContext context, bool isMobile) {
    final features = [
      {
        'icon': Icons.people,
        'title': 'Community Connection',
        'description': 'Connect with Muslims worldwide and share your journey',
      },
      {
        'icon': Icons.photo_library,
        'title': 'Share Moments',
        'description': 'Post photos, videos, and thoughts that inspire',
      },
      {
        'icon': Icons.notifications_active,
        'title': 'Prayer Reminders',
        'description': 'Never miss Fajr with smart notifications',
      },
      {
        'icon': Icons.mosque,
        'title': 'Find Mosques',
        'description': 'Discover nearby mosques and Islamic centers',
      },
      {
        'icon': Icons.book,
        'title': 'Daily Content',
        'description': 'Get daily Quran verses, Hadith, and reminders',
      },
      {
        'icon': Icons.groups,
        'title': 'Join Groups',
        'description': 'Participate in study circles and community events',
      },
    ];

    final cards = features
        .map(
          (feature) => _FeatureCard(
            icon: feature['icon'] as IconData,
            title: feature['title'] as String,
            description: feature['description'] as String,
          ),
        )
        .toList();

    final List<Widget> columnCards = [];
    for (var i = 0; i < cards.length; i++) {
      columnCards.add(SizedBox(width: double.infinity, child: cards[i]));
      if (i != cards.length - 1) {
        columnCards.add(const SizedBox(height: 16));
      }
    }

    final Widget featuresLayout = isMobile
        ? Column(children: columnCards)
        : Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: cards
                .map(
                  (card) => SizedBox(
                    width: 320,
                    child: card,
                  ),
                )
                .toList(),
          );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const Text(
            'Features',
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Everything you need for a meaningful social experience',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.7),
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 48),
          featuresLayout,
        ],
      ),
    );
  }

  Widget _buildScreenshotsSection(BuildContext context, bool isMobile) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const Text(
            'Experience For Fajr',
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'A beautiful interface designed for the modern Muslim',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.7),
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 48),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: [
              _PreviewCard(
                title: 'News Feed',
                description: 'Stay connected with your community',
                icon: Icons.home,
              ),
              _PreviewCard(
                title: 'Profile',
                description: 'Showcase your spiritual journey',
                icon: Icons.person,
              ),
              _PreviewCard(
                title: 'Discover',
                description: 'Find inspiring content and people',
                icon: Icons.explore,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFinalCTASection(BuildContext context, bool isMobile) {
    return _GlassContainer(
      child: Padding(
        padding: const EdgeInsets.all(48.0),
        child: Column(
          children: [
            _IconBadge(icon: Icons.auto_awesome, size: 48),
            const SizedBox(height: 24),
            const Text(
              'Ready to Join For Fajr?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Start your journey today and connect with millions of Muslims worldwide',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.7),
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => _navigateToSignUp(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Create Your Account',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToSignUp(BuildContext context) {
    Navigator.of(context).pushNamed('/signup');
  }
}

class _IconBadge extends StatelessWidget {
  final IconData icon;
  final double size;

  const _IconBadge({
    required this.icon,
    this.size = 32,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(size * 0.3),
      decoration: BoxDecoration(
        color: LandingScreen.accentColor.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: LandingScreen.accentColor.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Icon(
        icon,
        color: LandingScreen.accentColor,
        size: size,
      ),
    );
  }
}

class _GlassContainer extends StatelessWidget {
  final Widget child;

  const _GlassContainer({
    required this.child,
  });

  static const double _borderRadius = 12;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(_borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(_borderRadius),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.2),
              width: 1,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return _GlassContainer(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: LandingScreen.primaryColor.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 32,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.7),
                fontSize: 16,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PreviewCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const _PreviewCard({
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 400,
      child: _GlassContainer(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      LandingScreen.primaryColor.withValues(alpha: 0.3),
                      LandingScreen.accentColor.withValues(alpha: 0.2),
                    ],
                  ),
                ),
                child: Center(
                  child: Icon(
                    icon,
                    size: 80,
                    color: Colors.white.withValues(alpha: 0.5),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.7),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

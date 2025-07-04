class Homepagerepo {
  Future<Map<String, dynamic>> getData() async {
    try {
      return {
        "heroSection": ["img1", "img2", "img3", "img4"],
        "aboutSection": {
          "aboutTexts": [
            'I am Madhav Upadhyay, a dedicated Company Secretary based in India, offering personalized consultancy and compliance services. With a keen eye for detail and an unwavering commitment to ethical practice, I assist individuals, startups, and businesses in navigating the legal frameworks and ensuring smooth regulatory functioning.',
            'Over the last decade, I have worked independently with a wide range of clients, offering services in company law, GST, startup registration, and more. Unlike large firms, I offer hands-on attention to every client, ensuring a trustworthy and reliable experience tailored to your specific needs.',
          ],
          "highlights": [
            {"icon": "verified_user", "text": "Trusted by 150+ Clients"},
            {"icon": "workspace_premium", "text": "10+ Years of Experience"},
            {"icon": "gavel", "text": "Specialized in Compliance & Drafting"},
            {
              "icon": "non_existing_icon",
              "text": "Placeholder for Unknown Icon",
            },
          ],
        },
        "services": [
          {'title': 'Company Law', 'icon': 'business_center'},
          {'title': 'Startup Registration', 'icon': 'rocket_launch'},
          {'title': 'RERA', 'icon': 'house'},
          {'title': 'SEBI', 'icon': 'trending_up'},
          {'title': 'FEMA', 'icon': 'language'},
          {'title': 'GST', 'icon': 'receipt_long'},
          {'title': 'Trade Mark', 'icon': 'verified'},
          {'title': 'MSME', 'icon': 'factory'},
          {'title': 'Registered Valuer', 'icon': 'account_balance'},
          {'title': 'Digital Signature', 'icon': 'key'},
          {'title': 'Labour Law', 'icon': 'group'},
          {'title': 'Account', 'icon': 'account_balance_wallet'},
          {'title': 'Audit', 'icon': 'search'},
          {'title': 'TDS/TCS', 'icon': 'account_tree'},
          {'title': 'PF', 'icon': 'attach_money'},
        ],
        "clients": [
          {'name': 'ABC Pvt Ltd', 'icon': 'business'},
          {'name': 'StartupX Tech', 'icon': 'rocket_launch'},
          {'name': 'LegalEase India', 'icon': 'gavel'},
          {'name': 'GrowthHub', 'icon': 'trending_up'},
          {'name': 'FinMart', 'icon': 'account_balance'},
          {'name': 'HR Hive', 'icon': 'people'},
        ],
        "blogs": [
          {
            'title': '5 Compliance Mistakes to Avoid',
            'summary':
                'Startups often overlook critical compliance steps when registering their businesses or filing annually. This guide will help you avoid those costly mistakes by outlining what not to do when dealing with ROC, GST, and labor regulations.',
          },
          {
            'title': 'Understanding ROC Filings',
            'summary':
                'What are ROC filings and why are they essential? We break down each type — annual returns, financial statements, event-based filings — and how to make sure your company is up-to-date with government requirements.',
          },
          {
            'title': 'Why You Need a Company Secretary',
            'summary':
                'A Company Secretary is more than just paperwork — they’re strategic advisors who ensure your business stays legally secure. Learn how a CS can guide corporate governance, help with legal drafting, and more.',
          },
          {
            'title': 'LLP vs Pvt Ltd: What Should You Choose?',
            'summary':
                'Confused between LLP and Private Limited Company? Here’s a complete breakdown of legal structure, compliance burden, taxation, and investor preference.',
          },
        ],
        "contactUs": [
          {
            'label': 'Email',
            'value': 'contact@mucs.in',
            'icon': 'email_outlined',
          },
          {
            'label': 'Phone',
            'value': '+91 98765 43210',
            'icon': 'phone_android',
          },
          {
            'label': 'Address',
            'value': '123, Legal Street, Mumbai',
            'icon': 'location_on_outlined',
          },
        ],
        "footer": [
          'GST Filing',
          'Business Advisory',
          'Licensing & Registration',
          'Intellectual Property',
          'Shareholding Agreements',
        ],
      };
    } catch (e) {
      rethrow;
    }
  }
}

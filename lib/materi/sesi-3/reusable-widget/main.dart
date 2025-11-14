import 'package:flutter/material.dart';
import 'button.dart';
import 'text_field.dart';
import 'product_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Reusable Widget Example')),
        body: const ReusableWidgetPage(),
      ),
    );
  }
}

class ReusableWidgetPage extends StatefulWidget {
  const ReusableWidgetPage({super.key});

  @override
  State<ReusableWidgetPage> createState() => _ReusableWidgetPageState();
}

class _ReusableWidgetPageState extends State<ReusableWidgetPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final List<Map<String, String>> products = [
    {
      'name': 'Flutter Course',
      'price': '\$99',
      'imageUrl': 'https://placehold.co/200/png?text=Flutter+Course',
    },
    {
      'name': 'Dart Basics',
      'price': '\$49',
      'imageUrl': 'https://placehold.co/200/png?text=Dart+Basics',
    },
    {
      'name': 'Firebase Setup',
      'price': '\$79',
      'imageUrl': 'https://placehold.co/200/png?text=Firebase+Setup',
    },
    {
      'name': 'UI Design Tips',
      'price': '\$59',
      'imageUrl': 'https://placehold.co/200/png?text=UI+Design+Tips',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Section 1: Text Field Example
        Text(
          'Reusable TextField',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        AppTextField(
          label: 'Email',
          controller: _emailController,
        ),
        const SizedBox(height: 12),
        AppTextField(
          label: 'Password',
          controller: _passwordController,
          obscure: true,
        ),
        const SizedBox(height: 24),

        // Section 2: Button Example
        Text(
          'Reusable Button',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        PrimaryButton(
          label: 'Submit',
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Email: ${_emailController.text}, Password: ${_passwordController.text}',
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 24),

        // Section 3: Product Card Example
        Text(
          'Reusable Product Card',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ProductCard(
              name: products[index]['name']!,
              price: products[index]['price']!,
              imageUrl: products[index]['imageUrl']!,
            );
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

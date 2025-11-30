import 'package:flutter/material.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAQ'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Frequently Asked Questions',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            _FAQItem(
              question: 'How do I add an item?',
              answer: 'Tap the + button on the home screen, fill in the details, and tap "Add Item".',
            ),
            _FAQItem(
              question: 'What do the colors mean?',
              answer: 'Green means the item is fresh (> 7 days). Orange means consume soon (3-7 days). Red means expired or expiring very soon (< 3 days).',
            ),
            _FAQItem(
              question: 'Is my data saved online?',
              answer: 'No, EcoPantry is an offline-first app. All your data is stored locally on your device.',
            ),
            _FAQItem(
              question: 'How do I delete an item?',
              answer: 'Swipe left on an item in the list and tap the delete icon.',
            ),
          ],
        ),
      ),
    );
  }
}

class _FAQItem extends StatelessWidget {
  final String question;
  final String answer;

  const _FAQItem({required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(answer),
        ],
      ),
    );
  }
}

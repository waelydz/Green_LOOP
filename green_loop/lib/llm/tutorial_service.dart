import 'dart:convert';
import 'package:http/http.dart' as http;

class TutorialStep {
<<<<<<< Updated upstream
  final String stepText;
  final String imageUrl;

  TutorialStep(this.stepText, this.imageUrl);
}

class TutorialService {
  static const String _apiKey = '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'; 
=======
  final String text;
  final String imageUrl;

  TutorialStep(this.text, this.imageUrl);
}

class TutorialService {
  static const String _apiKey = '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'; // Replace with env var/backend call!
>>>>>>> Stashed changes
  static const String _chatUrl = 'https://api.openai.com/v1/chat/completions';
  static const String _imageUrl = 'https://api.openai.com/v1/images/generations';

  static Future<List<TutorialStep>> generateTutorial(String prompt) async {
    final gptResponse = await http.post(
      Uri.parse(_chatUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_apiKey'
      },
      body: jsonEncode({
<<<<<<< Updated upstream
        'model': 'gpt-4o',
        'messages': [
          {
            'role': 'system',
            'content': "You are a cheerful and excited recycling educator 🧼♻️Create a detailed, fun, and friendly step-by-step tutorial on how to recycle and reuse the material provided by prompt at home. Include tips on sorting, cleaning, cutting, and turning them into useful household items like plant pots, storage containers, or decorative items (choose which item to focus and showcase the steps of making based on what's most suitable for the material). The tutorial should be beginner-friendly and explain each step clearly and fully. Include safety precautions and materials needed for each project. Format the output as: 'Step #: <explanation>\nImage prompt: \"<description>\"'. Make sure the image prompt clearly describes how to execute the step in detail (e.g. actions, tools, surroundings). Keep the tone light and motivating!"
          },
          {'role': 'user', 'content': prompt}
=======
        "model": "gpt-4o",
        "messages": [
          {
            "role": "system",
            "content": "You are a cheerful and excited recycling educator 🧼♻️Create a detailed, fun, and friendly step-by-step tutorial on how to recycle and reuse the material provided by prompt at home. Include tips on sorting, cleaning, cutting, and turning them into useful household items like plant pots, storage containers, or decorative items (choose which item to focus and showcase the steps of making based on what's most suitable for the material). The tutorial should be beginner-friendly and explain each step clearly. Include safety precautions and materials needed for each project. Format the output as: 'Step #: <explanation>\nImage prompt: \"<description>\"'. Make sure the image prompt clearly describes how to execute the step in detail (e.g. actions, tools, surroundings). Use emojis and keep the tone light and motivating!"
          },
          {"role": "user", "content": prompt}
>>>>>>> Stashed changes
        ]
      }),
    );

    final gptData = jsonDecode(gptResponse.body);
    if (gptResponse.statusCode != 200 || gptData['choices'] == null) {
      throw Exception(gptData['error']?['message'] ?? 'Unknown error');
    }

    final gptText = gptData['choices'][0]['message']['content'];
    final stepRegex = RegExp(r'Step \d+: (.*?)\nImage prompt: "(.*?)"', dotAll: true);
    final matches = stepRegex.allMatches(gptText);

    final steps = <TutorialStep>[];

    for (final match in matches) {
      final stepText = match.group(1) ?? "";
      final imagePrompt = match.group(2) ?? "";

      final imageRes = await http.post(
        Uri.parse(_imageUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_apiKey'
        },
        body: jsonEncode({
<<<<<<< Updated upstream
          'model': 'dall-e-3',
          'prompt': imagePrompt,
          'n': 1,
          'size': '1024x1024'
=======
          "model": "dall-e-3",
          "prompt": imagePrompt,
          "n": 1,
          "size": "1024x1024"
>>>>>>> Stashed changes
        }),
      );

      final imageData = jsonDecode(imageRes.body);
      final imageUrl = imageData['data'][0]['url'];
      steps.add(TutorialStep(stepText, imageUrl));
    }

    return steps;
  }
}

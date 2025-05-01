import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class AnalyzedObject {
  final String name;
  final List<String> materials;
  final String recycleIdea;
  final String reuseIdea;

  AnalyzedObject({
    required this.name,
    required this.materials,
    required this.recycleIdea,
    required this.reuseIdea,
  });

  factory AnalyzedObject.fromJson(Map<String, dynamic> json) {
    return AnalyzedObject(
      name: json['name'],
      materials: List<String>.from(json['materials']),
      recycleIdea: json['recycleIdea'],
      reuseIdea: json['reuseIdea'],
    );
  }
}

class OpenAIService {
  static const _apiKey = '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';
  static const _apiUrl = 'https://api.openai.com/v1/chat/completions';

  static Future<String> suggestAlternatives(String userPrompt) async {
  final response = await http.post(
    Uri.parse(_apiUrl),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $_apiKey',
    },
    body: jsonEncode({
      'model': 'gpt-4o',
      'messages': [
        {
          'role': 'system',
          'content': '''
          You are an expert in sustainable materials. Given a user prompt, first identify any materials mentioned.
          Then, provide a list of eco-friendly alternatives to those materials each with their advantages and disadvantages.
          '''
        },
        {
          'role': 'user',
          'content': userPrompt
        }
      ],
    }),
  );

  final decoded = json.decode(response.body);
  return decoded['choices'][0]['message']['content'].trim();
}


//   static Future<String> analyzeImage(File imageFile) async {
//     final bytes = await imageFile.readAsBytes();
//     final base64Image = base64Encode(bytes);

//     final response = await http.post(
//       Uri.parse(_apiUrl),
//       headers: {
//         'Content-Type': 'application/json',
//         'Authorization': 'Bearer $_apiKey',
//       },
//       body: jsonEncode({
//         'model': 'gpt-4o',
//         'messages': [
//           {
//             'role': 'system',
//             'content': '''You are an expert in recycling and image analysis. Identify the *main item* in the image and return:
// - name: the object (e.g., "plastic water bottle")
// - materials: a list of materials (e.g., ["plastic", "label paper"])
// - recycleIdea: how to recycle it
// - reuseIdea: how to creatively reuse it
// '''
//           },
//           {
//             'role': 'user',
//             'content': 'Analyze this image: data:image/jpeg;base64,$base64Image'
//           }
//         ],
//       }),
//     );

//     final decoded = json.decode(response.body);
//     final content = decoded['choices'][0]['message']['content'];
//     return content;
//   }
// }

  static Future<String> analyzeImage(File imageFile) async {
    final bytes = await imageFile.readAsBytes();
    final base64Image = base64Encode(bytes);

    final response = await http.post(
      Uri.parse(_apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_apiKey',
      },
      body: jsonEncode({
        'model': 'gpt-4o',
        'messages': [
          {
            'role': 'system',
            'content': 'You are a helpful assistant that analyzes images and describes the main item and materials seen in them and provides recycling tips based on the item material.'
          },
          {
            'role': 'user',
            'content': [
              {
                'type': 'image_url',
                'image_url': {
                  'url': 'data:image/jpeg;base64,$base64Image'
                }
              },
              {
                'type': 'text',
                'text': 'What item is this and what materials is it made of?'
              }
            ]
          }
        ],
      }),
    );

    final decoded = json.decode(response.body);
    return decoded['choices'][0]['message']['content'].trim();
  }
}

class MaterialRecognitionScreen extends StatefulWidget {
  const MaterialRecognitionScreen({Key? key}) : super(key: key);

  @override
  State<MaterialRecognitionScreen> createState() => _MaterialRecognitionScreenState();
}

class _MaterialRecognitionScreenState extends State<MaterialRecognitionScreen> {
  File? _image;
  String? _analysisResult;
  bool _isLoading = false;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _analysisResult = null;
      });
    }
  }

  Future<void> _analyzeImage() async {
    if (_image == null) return;
    setState(() {
      _isLoading = true;
    });
    final result = await OpenAIService.analyzeImage(_image!);
    setState(() {
      _analysisResult = result;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Material Recognition')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text('Select Image'),
            ),
            const SizedBox(height: 20),
            _image != null ? Image.file(_image!, height: 200) : const Text('No image selected.'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _analyzeImage,
              child: const Text('Analyze Image'),
            ),
            const SizedBox(height: 20),
            _isLoading
                ? const CircularProgressIndicator()
                : _analysisResult != null
                    ? Expanded(child: SingleChildScrollView(child: Text(_analysisResult!)))
                    : Container(),
          ],
        ),
      ),
    );
  }
}

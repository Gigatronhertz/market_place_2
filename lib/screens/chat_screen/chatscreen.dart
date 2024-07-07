import 'dart:convert'; // For encoding and decoding JSON data
import 'dart:io'; // For file handling

import 'package:cloud_firestore/cloud_firestore.dart'; // Firebase Firestore for database
import 'package:file_picker/file_picker.dart'; // For picking files from device
import 'package:flutter/material.dart'; // For building the UI
import 'package:flutter/services.dart' show rootBundle; // For accessing assets
import 'package:flutter_chat_types/flutter_chat_types.dart'
    as types; // For chat message types
import 'package:flutter_chat_ui/flutter_chat_ui.dart'; // For chat UI
import 'package:http/http.dart' as http; // For making HTTP requests
import 'package:image_picker/image_picker.dart'; // For picking images
import 'package:intl/date_symbol_data_local.dart'; // For date formatting
import 'package:market_place_2/globals/customaizables.dart'; // Custom theme/colors
import 'package:mime/mime.dart'; // For getting MIME types
import 'package:open_filex/open_filex.dart'; // For opening files
import 'package:path_provider/path_provider.dart'; // For accessing device storage
import 'package:uuid/uuid.dart'; // For generating unique IDs

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<types.Message> _messages = []; // List to store chat messages
  final _user = const types.User(
      id: '82091008-a484-4a89-ae75-a22bf8d6f3ac', // Unique ID for the user
      firstName: 'John', // User's first name
      lastName: 'Doe', // User's last name
      imageUrl: 'https://example.com/avatar.jpg' // URL for user's avatar
      );

  @override
  void initState() {
    super.initState();
    _loadMessagesFromFirestore(); // Load messages from Firebase Firestore on init
  }

  // Add a message to the list of messages
  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message); // Insert message at the top of the list
    });
  }

  // Handle attachment button press
  void _handleAttachmentPressed() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) => SafeArea(
        child: SizedBox(
          height: 144,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Button for selecting a photo
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _handleImageSelection(); // Handle image selection
                },
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('Photo'),
                ),
              ),
              // Button for selecting a file
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _handleFileSelection(); // Handle file selection
                },
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('File'),
                ),
              ),
              // Button to cancel
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('Cancel'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Handle file selection
  void _handleFileSelection() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any, // Allow picking any type of file
    );

    if (result != null && result.files.single.path != null) {
      final message = types.FileMessage(
        author: _user, // Author of the message
        createdAt: DateTime.now().millisecondsSinceEpoch, // Timestamp
        id: const Uuid().v4(), // Generate a unique ID for the message
        mimeType: lookupMimeType(result.files.single.path!), // Get MIME type
        name: result.files.single.name, // File name
        size: result.files.single.size, // File size
        uri: result.files.single.path!, // File URI
      );

      _addMessage(message); // Add file message to the list
    }
  }

  // Handle image selection
  void _handleImageSelection() async {
    final result = await ImagePicker().pickImage(
      imageQuality: 70, // Image quality
      maxWidth: 1440, // Max width of the image
      source: ImageSource.gallery, // Pick image from gallery
    );

    if (result != null) {
      final bytes = await result.readAsBytes(); // Read image bytes
      final image = await decodeImageFromList(bytes); // Decode image

      final message = types.ImageMessage(
        author: _user, // Author of the message
        createdAt: DateTime.now().millisecondsSinceEpoch, // Timestamp
        height: image.height.toDouble(), // Image height
        id: const Uuid().v4(), // Generate a unique ID for the message
        name: result.name, // Image name
        size: bytes.length, // Image size
        uri: result.path, // Image URI
        width: image.width.toDouble(), // Image width
      );

      _addMessage(message); // Add image message to the list
    }
  }

  // Handle message tap (for files)
  void _handleMessageTap(BuildContext _, types.Message message) async {
    if (message is types.FileMessage) {
      var localPath = message.uri;

      // If the file URI is a remote URL
      if (message.uri.startsWith('http')) {
        try {
          final index =
              _messages.indexWhere((element) => element.id == message.id);
          final updatedMessage =
              (_messages[index] as types.FileMessage).copyWith(
            isLoading: true, // Show loading indicator
          );

          setState(() {
            _messages[index] = updatedMessage;
          });

          // Download the file
          final client = http.Client();
          final request = await client.get(Uri.parse(message.uri));
          final bytes = request.bodyBytes;
          final documentsDir = (await getApplicationDocumentsDirectory()).path;
          localPath = '$documentsDir/${message.name}';

          // Save the file locally if it doesn't already exist
          if (!File(localPath).existsSync()) {
            final file = File(localPath);
            await file.writeAsBytes(bytes);
          }
        } finally {
          final index =
              _messages.indexWhere((element) => element.id == message.id);
          final updatedMessage =
              (_messages[index] as types.FileMessage).copyWith(
            isLoading: null, // Remove loading indicator
          );

          setState(() {
            _messages[index] = updatedMessage;
          });
        }
      }

      await OpenFilex.open(localPath); // Open the file
    }
  }

  // Handle preview data fetched for text messages (e.g., link previews)
  void _handlePreviewDataFetched(
    types.TextMessage message,
    types.PreviewData previewData,
  ) {
    final index = _messages.indexWhere((element) => element.id == message.id);
    final updatedMessage = (_messages[index] as types.TextMessage).copyWith(
      previewData: previewData, // Add preview data to the message
    );

    setState(() {
      _messages[index] = updatedMessage;
    });
  }

  // Handle send button pressed
  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user, // Author of the message
      createdAt: DateTime.now().millisecondsSinceEpoch, // Timestamp
      id: const Uuid().v4(), // Generate a unique ID for the message
      text: message.text, // Message text
    );

    _addMessage(textMessage); // Add text message to the list
  }

  // Load messages from Firebase Firestore
  void _loadMessagesFromFirestore() async {
    final querySnapshot =
        await FirebaseFirestore.instance.collection('messages').get();
    final messages = querySnapshot.docs.map((doc) {
      final data = doc.data();
      // Assuming the Firestore data has the same structure as the JSON data
      return types.Message.fromJson(data);
    }).toList();

    setState(() {
      _messages = messages; // Update the messages list with Firestore data
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          backgroundColor: white,
          title: Text("Taiwo"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Chat(
            theme: DefaultChatTheme(
                primaryColor: green,
                secondaryColor: lightgreen1,
                inputBackgroundColor: Color.fromARGB(31, 30, 255, 0),
                inputTextColor: Colors.black,
                deliveredIcon: Image.asset(
                  "assets/images/icons8-double-tick-50.png",
                )),
            messages: _messages, // List of messages to display
            onAttachmentPressed:
                _handleAttachmentPressed, // Handle attachment button press
            onMessageTap: _handleMessageTap, // Handle message tap (for files)
            onPreviewDataFetched:
                _handlePreviewDataFetched, // Handle preview data fetched for text messages
            onSendPressed: _handleSendPressed, // Handle send button pressed
            showUserAvatars: true, // Show user avatars
            showUserNames: true, // Show user names
            user: _user, // Current user information
          ),
        ),
      );
}

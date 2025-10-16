import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// --- 1. Data Model for our posts ---
class Post {
  final String? id;
  final String title;
  final String message;
  final DateTime timestamp;

  Post({
    this.id,
    required this.title,
    required this.message,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

  // A factory constructor to create a Post from a Firestore document.
  factory Post.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Post(
      id: doc.id,
      title: data['title'] ?? 'No Title',
      message: data['message'] ?? 'No Message',
      // Safely convert Firestore Timestamp to Dart DateTime
      timestamp: (data['timestamp'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }
}

// --- 2. Main Screen Widget (Exp9) ---
class Exp9 extends StatefulWidget {
  const Exp9({super.key});

  @override
  State<Exp9> createState() => _Exp9State();
}

class _Exp9State extends State<Exp9> {
  // Text controllers for input fields
  final _titleController = TextEditingController();
  final _messageController = TextEditingController();

  // Reference to the 'posts' collection in Firestore
  final CollectionReference _postsCollection = FirebaseFirestore.instance.collection('posts');

  // Method to add a new post to Firestore.
  Future<void> _addPost() async {
    if (_titleController.text.isNotEmpty && _messageController.text.isNotEmpty) {
      try {
        await _postsCollection.add({
          'title': _titleController.text,
          'message': _messageController.text,
          // Use server time for consistency and sorting
          'timestamp': FieldValue.serverTimestamp(), 
        });
        
        // Clear the input fields and hide the keyboard
        _titleController.clear();
        _messageController.clear();
        FocusScope.of(context).unfocus();
        
      } catch (e) {
        // Log the error if the write operation fails
        print('Error adding post to Firestore: $e');
        // You could show a SnackBar to the user here.
      }
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practical 9: Firestore Posts', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.indigo,
        elevation: 4,
      ),
      body: Column(
        children: [
          _buildInputArea(context),
          const Divider(height: 1, color: Colors.grey),
          // Takes up the remaining vertical space
          _buildPostsList(), 
        ],
      ),
    );
  }

  // UI for the input fields and button.
  Widget _buildInputArea(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              labelText: 'Title', 
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _messageController,
            decoration: const InputDecoration(
              labelText: 'Message', 
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _addPost, 
              icon: const Icon(Icons.send),
              label: const Text('Add Post', style: TextStyle(fontSize: 16)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // UI for displaying the list of posts in real-time using StreamBuilder.
  Widget _buildPostsList() {
    return Expanded(
      child: StreamBuilder<QuerySnapshot>(
        // Listen to real-time changes, ordered by timestamp
        stream: _postsCollection.orderBy('timestamp', descending: true).snapshots(),
        builder: (context, snapshot) {
          // Error handling
          if (snapshot.hasError) {
            return Center(child: Text('Something went wrong: ${snapshot.error}'));
          }
          // Loading state
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          // Check for empty data
          if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No posts yet. Add one!', style: TextStyle(color: Colors.grey)));
          }
         
          // Map documents to Post objects
          final posts = snapshot.data!.docs.map((doc) => Post.fromFirestore(doc)).toList();

          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return Card(
                elevation: 1,
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: ListTile(
                  title: Text(post.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  subtitle: Text(
                    '${post.message}\n${post.timestamp.toLocal().toString().substring(0, 16)}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                  isThreeLine: true,
                  trailing: const Icon(Icons.message_outlined, color: Colors.indigo),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

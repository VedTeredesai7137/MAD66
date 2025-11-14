import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: UserProfilePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('User Profile'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
            SizedBox(height: 20),
            Text(
              'John Doe',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'john.doe@example.com',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

----------------------------------------------------------------------------------------------------------------

Task 2: Build a Simple Login Form
 Objective: Implement a Form with input fields and a button.
Steps:
1. Use a Form widget as the body.
2. Inside the form, add two TextFormField widgets: one for "Email" and one for "Password". Set
the obscureText property of the password field to true.
3. Add an ElevatedButton at the bottom.
4. When the button is pressed, use a print() statement to output "Login Button Pressed".

CODE:

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    print("Login Button Pressed");
                  },
                  child: Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


---------------------------------------------------------------------------------------------------------------

Task 3: Implement a Row of Action Buttons
 Objective: Use the Row widget for horizontal layout.
Steps:
1. Place a Row widget in the center of the screen.
2. Inside the Row, add three IconButton widgets (e.g., for Call, Message, Email).
3. Use the mainAxisAlignment property to space the buttons evenly.

CODE:

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ActionButtonsPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class ActionButtonsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Action Buttons'),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.call, color: Colors.green, size: 30),
              onPressed: () {
                print('Call button pressed');
              },
            ),
            IconButton(
              icon: Icon(Icons.message, color: Colors.blue, size: 30),
              onPressed: () {
                print('Message button pressed');
              },
            ),
            IconButton(
              icon: Icon(Icons.email, color: Colors.red, size: 30),
              onPressed: () {
                print('Email button pressed');
              },
            ),
          ],
        ),
      ),
    );
  }
}

------------------------------------------------------------------------------------------------------

Task 4: Create a Page with Navigation
 Objective: Implement basic navigation between two screens.
Steps:
1. Create two separate Dart files for two screens (e.g., home_screen.dart and profile_screen.dart).
2. On the home screen, add an ElevatedButton.
3. Use Navigator.push() inside the button's onPressed callback to navigate to the profile screen.
4. On the profile screen, add an AppBar with a back button (automatically provided by Scaffold).

CODE:

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

// Home Screen
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Go to Profile Screen'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          },
        ),
      ),
    );
  }
}

// Profile Screen
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Screen'),
        centerTitle: true,
        // Back button automatically provided
      ),
      body: Center(
        child: Text(
          'Welcome to Profile!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

----------------------------------------------------------------------------------------------------------------

Task 5: Add a Simple Fade-In Animation
 Objective: Implement a basic implicit animation.
Steps:
1. Create a boolean variable _visible initialized to false.
2. In the initState() method, use Future.delayed to set _visible to true after 1 second.
3. In the build method, use an AnimatedOpacity widget.
4. Set its opacity to _visible ? 1.0 : 0.0 and its duration to 1 second.
5. The child of AnimatedOpacity can be any widget (e.g., a "Welcome" text).

CODE:

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: FadeInDemo(),
    debugShowCheckedModeBanner: false,
  ));
}

class FadeInDemo extends StatefulWidget {
  @override
  _FadeInDemoState createState() => _FadeInDemoState();
}

class _FadeInDemoState extends State<FadeInDemo> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    // Delay of 1 second before showing the widget
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _visible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fade-In Animation'),
        centerTitle: true,
      ),
      body: Center(
        child: AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: Duration(seconds: 1),
          child: Text(
            'Welcome!',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.indigo),
          ),
        ),
      ),
    );
  }
}

---------------------------------------------------------------------------------------------------------

Task 6: Display a List of Items
 Objective: Use a ListView to display scrollable content.
Steps:
1. Use a ListView.builder as the body.
2. Define an itemCount (e.g., 10).
3. In the itemBuilder, return a ListTile widget for each item.
4. Set the title of the ListTile to "Item ${index + 1}".

CODE:

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ItemListScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class ItemListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Items'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 10, // Number of items
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text('${index + 1}'),
              backgroundColor: Colors.indigo,
              foregroundColor: Colors.white,
            ),
            title: Text('Item ${index + 1}'),
            subtitle: Text('This is item number ${index + 1}'),
            trailing: Icon(Icons.arrow_forward_ios),
          );
        },
      ),
    );
  }
}

-----------------------------------------------------------------------------------------------------------------

Task 7: Read and Display Data from a Local JSON String
 Objective: Demonstrate basic JSON handling.
Steps:
1. Define a String variable containing a simple JSON array (e.g., '[{"name":"Apple"},
{"name":"Banana"}]').
2. Use json.decode() to parse the string into a list.
3. Use a ListView.builder to display the list of fruits, displaying each name in a Text widget.

CODE:

import 'dart:convert';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: JsonListScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class JsonListScreen extends StatelessWidget {
  // Local JSON string
  final String jsonString = '[{"name":"Apple"},{"name":"Banana"},{"name":"Orange"},{"name":"Mango"}]';

  @override
  Widget build(BuildContext context) {
    // Decode JSON string into a list
    List<dynamic> fruits = json.decode(jsonString);

    return Scaffold(
      appBar: AppBar(
        title: Text('Fruits from JSON'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: fruits.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.local_florist, color: Colors.green),
            title: Text(fruits[index]['name']),
          );
        },
      ),
    );
  }
}

-----------------------------------------------------------------------------------------------------------------

Task 8: Implement a Bottom Navigation Bar
 Objective: Create a multi-page app structure.
Steps:
1. Create a StatefulWidget.
2. Define an int _currentIndex variable.
3. In the Scaffold, add a BottomNavigationBar.
4. Set the currentIndex property to _currentIndex.
5. In the onTap callback, use setState() to update _currentIndex.
6. Use a conditional statement in the body to display different containers/text based
on _currentIndex.

CODE:

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: BottomNavDemo(),
    debugShowCheckedModeBanner: false,
  ));
}

class BottomNavDemo extends StatefulWidget {
  @override
  _BottomNavDemoState createState() => _BottomNavDemoState();
}

class _BottomNavDemoState extends State<BottomNavDemo> {
  int _currentIndex = 0;

  // Screens for each tab
  final List<Widget> _screens = [
    Center(child: Text('Home Screen', style: TextStyle(fontSize: 24))),
    Center(child: Text('Search Screen', style: TextStyle(fontSize: 24))),
    Center(child: Text('Profile Screen', style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Navigation Demo'),
        centerTitle: true,
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

-------------------------------------------------------------------------------------------------------------

Task 9: Simple Widget Test for a Text Widget
 Objective: Write a basic unit test for a widget.
Steps:
1. In the test folder, create a file widget_test.dart.
2. Use the testWidgets function.
3. Use pumpWidget() to build a MaterialApp containing a Text('Hello') widget.
4. Use expect(find.text('Hello'), findsOneWidget) to verify the text is found on the screen.

CODE:

main.dart

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('My App')),
        body: const Center(child: Text('Hello')),
      ),
    );
  }
}


create test folder, create widget_test.dart inside it

widget_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:your_app_name/main.dart'; // replace with your actual package name

void main() {
  testWidgets('Main app shows Hello text', (WidgetTester tester) async {
    // Build the app from main.dart
    await tester.pumpWidget(const MyApp());

    // Wait for the widget tree to settle
    await tester.pumpAndSettle();

    // Verify the Text widget exists
    expect(find.text('Hello'), findsOneWidget);
  });
}

-----------------------------------------------------------------------------------------------------------

Task 10: Implement a Draggable Widget
 Objective: Demonstrate understanding of the Draggable and DragTarget widgets.
Steps:
1. Create a Draggable widget (e.g., a colored Container with a "Drag me" text) as the child of
a Center widget.
2. Set the feedback of the Draggable to a slightly transparent version of the same container.
3. Place a DragTarget widget elsewhere on the screen (e.g., in a Row or Column).
4. In the DragTarget's onAccept callback, use setState() to change its color or child text to show
the item was dropped.

CODE:

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: DraggableDemo(),
    debugShowCheckedModeBanner: false,
  ));
}

class DraggableDemo extends StatefulWidget {
  @override
  _DraggableDemoState createState() => _DraggableDemoState();
}

class _DraggableDemoState extends State<DraggableDemo> {
  Color targetColor = Colors.grey[300]!; // Initial color of DragTarget
  String targetText = 'Drop Here';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Draggable Demo'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Draggable<String>(
              data: 'Dropped!',
              child: Container(
                width: 120,
                height: 120,
                color: Colors.indigo,
                alignment: Alignment.center,
                child: Text(
                  'Drag me',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              feedback: Container(
                width: 120,
                height: 120,
                color: Colors.indigo.withOpacity(0.5),
                alignment: Alignment.center,
                child: Text(
                  'Drag me',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SizedBox(height: 50),
          DragTarget<String>(
            onAccept: (data) {
              setState(() {
                targetColor = Colors.green;
                targetText = data;
              });
            },
            builder: (context, candidateData, rejectedData) {
              return Container(
                width: 150,
                height: 150,
                color: targetColor,
                alignment: Alignment.center,
                child: Text(
                  targetText,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

--------------------------------------------------------------------------------------------------------------------

Task 11: Create an Image Gallery with GestureDetector
 Objective: Use GestureDetector for a tap interaction on images.
Steps:
1. Use a Row or GridView to display 3 Image.network widgets (using free online placeholder
image URLs).
2. Wrap each Image widget in a GestureDetector.
3. In the onTap callback of the GestureDetector, use a print() statement or a SnackBar to show a
message like "Image 1 tapped".

CODE:

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ImageGalleryDemo(),
    debugShowCheckedModeBanner: false,
  ));
}

class ImageGalleryDemo extends StatelessWidget {
  final List<Color> colors = [Colors.red, Colors.green, Colors.blue];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Gallery'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(colors.length, (index) {
            return GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Image ${index + 1} tapped')),
                );
                print('Image ${index + 1} tapped');
              },
              child: Container(
                width: 100,
                height: 100,
                color: colors[index],
                alignment: Alignment.center,
                child: Icon(
                  Icons.image,
                  size: 50,
                  color: Colors.white,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

--------------------------------------------------------------------------------------------------------------------

Task 12: Build a Simple Color Toggler
 Objective: Manage a widget's state locally to change its appearance.
 Short Steps:
1. In a StatefulWidget, create a Color _backgroundColor = Colors.white; variable.
2. In the Scaffold, set the backgroundColor to _backgroundColor.
3. Add a FloatingActionButton to the screen.
4. In
the
button's onPressed callback,
use setState() to
toggle _backgroundColor between Colors.white and Colors.blue.

CODE:

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ColorToggler(),
    debugShowCheckedModeBanner: false,
  ));
}

class ColorToggler extends StatefulWidget {
  @override
  _ColorTogglerState createState() => _ColorTogglerState();
}

class _ColorTogglerState extends State<ColorToggler> {
  Color _backgroundColor = Colors.white;

  void _toggleColor() {
    setState(() {
      _backgroundColor =
          _backgroundColor == Colors.white ? Colors.blue : Colors.white;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        title: Text('Color Toggler'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Tap the button to toggle color',
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleColor,
        child: Icon(Icons.color_lens),
      ),
    );
  }
}

---------------------------------------------------------------------------------------------------------------

Task 13: Create an Animated Container
 Objective: Implement an implicit animation that responds to user input.
Steps:
1. In a StatefulWidget, create a double _width = 100; and double _height = 100; variable.
2. In the body, use an AnimatedContainer widget. Set its width, height, duration (e.g., 1 second),
and color.
3. Add a FloatingActionButton.
4. In the button's onPressed, use setState() to change _width and _height to a new random or
fixed size (e.g., 200). The container will animate to the new size.

CODE:

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: AnimatedContainerDemo(),
    debugShowCheckedModeBanner: false,
  ));
}

class AnimatedContainerDemo extends StatefulWidget {
  @override
  _AnimatedContainerDemoState createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  double _width = 100;
  double _height = 100;

  void _changeSize() {
    setState(() {
      // Toggle between 100 and 200 for width and height
      _width = _width == 100 ? 200 : 100;
      _height = _height == 100 ? 200 : 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
        centerTitle: true,
      ),
      body: Center(
        child: AnimatedContainer(
          width: _width,
          height: _height,
          color: Colors.indigo,
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
          alignment: Alignment.center,
          child: Text(
            'Tap Button!',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeSize,
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}

------------------------------------------------------------------------------------------------------------------

Task 14: Simple TabBar Layout
 Objective: Implement navigation using a TabBar and TabBarView.
 Short Steps:
1. Create a DefaultTabController widget as the root of your app.
2. Set the length property to 2.
3. In the Scaffold, add an AppBar with a bottom property that is a TabBar with two tabs (e.g.,
"Chats", "Status").
4. Set the body of the Scaffold to a TabBarView with two children (e.g., a Center(child:
Text("Chats Screen")) and Center(child: Text("Status Screen"))).

CODE:

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: TabBarDemo(),
    debugShowCheckedModeBanner: false,
  ));
}

class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text('Simple TabBar'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Chats', icon: Icon(Icons.chat)),
              Tab(text: 'Status', icon: Icon(Icons.info)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text('Chats Screen', style: TextStyle(fontSize: 24))),
            Center(child: Text('Status Screen', style: TextStyle(fontSize: 24))),
          ],
        ),
      ),
    );
  }
}

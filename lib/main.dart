import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uiexperimentchenn/body2.dart';
import 'package:uiexperimentchenn/themedata.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Management UI',
      theme: ThemeData(
        useMaterial3: false,
        fontFamily: GoogleFonts.ubuntu().fontFamily,
        primarySwatch: Colors.deepPurple,
      ),
      home: TaskManagementScreen(),
    );
  }
}

class TaskManagementScreen extends StatefulWidget {
  @override
  State<TaskManagementScreen> createState() => _TaskManagementScreenState();
}

class _TaskManagementScreenState extends State<TaskManagementScreen> {
  int _bottomNavIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        onTap: (index) {
          if (index <= 1) {
            setState(() {
              _bottomNavIndex = index;
            });
          }
        },
        icons: const [
          Icons.home,
          Icons.edit_document,
          Icons.mail,
          Icons.settings
        ],
        gapLocation: GapLocation.center,
        leftCornerRadius: 12,
        inactiveColor: Colors.grey,
        activeColor: const Color.fromARGB(255, 114, 136, 244),
        rightCornerRadius: 12,
        activeIndex: _bottomNavIndex,
        shadow: const BoxShadow(
          offset: Offset(0, 1),
          blurRadius: 12,
          spreadRadius: 0.5,
          color: Colors.black12,
        ),
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBarWithAvatar(),
      ),
      body: [const Body1(), const Body2()].elementAt(_bottomNavIndex),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: kblue, // Adjust the color as needed
              blurRadius: 15.0,
              spreadRadius: 4.0,
              offset: const Offset(0, 10), // Shifts the shadow to the bottom
            ),
          ],
        ),
        child: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
          },
          child: const Icon(Icons.add),
          backgroundColor: kblue, // Adjust the color as needed
        ),
      ),
    );
  }
}

class Body1 extends StatelessWidget {
  const Body1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 8),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Hello',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 113, 110, 110),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Alex Marconi',
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 22),
                    Column(
                      mainAxisAlignment: MainAxisAlignment
                          .center, // Centers the rows on the main axis
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceEvenly, // Even spacing between the buttons
                          children: <Widget>[
                            _buildButton(context, Icons.loop, 'In Progress',
                                const Color.fromARGB(255, 249, 190, 101)),
                            const SizedBox(
                              width: 10,
                            ),
                            _buildButton(context, Icons.cached, 'Ongoing',
                                const Color.fromARGB(255, 111, 134, 248)),
                          ],
                        ),
                        const SizedBox(height: 16), // Spacing between the rows
                        Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceEvenly, // Even spacing between the buttons
                          children: <Widget>[
                            _buildButton(
                                context,
                                Icons.check_circle,
                                'Completed',
                                const Color.fromARGB(255, 98, 217, 102)),
                            const SizedBox(
                              width: 10,
                            ),
                            _buildButton(context, Icons.cancel, 'Cancel',
                                const Color.fromARGB(255, 252, 100, 66)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding:
                  EdgeInsets.only(left: 8, right: 8, top: 22.0, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Daily Task",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    "All Tasks",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.grey),
                  )
                ],
              ),
            ),
            // Directly placing the ListView
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                CustomListTile(
                  valuecolor: Colors.blue,
                  leadicon:
                      Icon(Icons.check_circle_rounded, color: Colors.blue),
                  text: 'DashBoard Design',
                ),
                CustomListTile(
                  valuecolor: Colors.amber,
                  leadicon: Icon(Icons.check_circle_outline),
                  text: 'App Animation',
                ),
                CustomListTile(
                  valuecolor: Colors.green,
                  leadicon:
                      Icon(Icons.check_circle_rounded, color: Colors.green),
                  text: 'UI/UX Design',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final Color valuecolor;
  final Icon leadicon;
  final String text;
  const CustomListTile({
    super.key,
    required this.valuecolor,
    required this.leadicon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: .1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
          leading: leadicon, // Replace with appropriate icon
          title: Text(text),
          subtitle: LinearProgressIndicator(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            minHeight: 7,
            value: 0.5, // Adjust the progress level as needed
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(valuecolor),
          ),
          trailing: const StackedPeaople()),
    );
  }
}

class StackedPeaople extends StatelessWidget {
  const StackedPeaople({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width:
          110, // Ensure this is wide enough to fit all the avatars + the icon
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            child: CircleAvatar(
              backgroundImage:
                  AssetImage('assets/avaters/Avatar 2.jpg'), // First user
              radius: 15,
            ),
          ),
          Positioned(
            left: 20, // Overlap by adjusting the left property
            child: CircleAvatar(
              backgroundImage:
                  AssetImage('assets/avaters/Avatar 6.jpg'), // Second user
              radius: 15,
            ),
          ),
          Positioned(
            left: 40, // Increase the left property to overlap further
            child: CircleAvatar(
              backgroundImage:
                  AssetImage('assets/avaters/Avatar 3.jpg'), // Third user
              radius: 15,
            ),
          ),
          Positioned(
            right: 0, // Positioned to the right
            child: Icon(Icons.chevron_right), // Trailing icon
          ),
        ],
      ),
    );
  }
}

// This method creates a button with an icon, text, and background color
Widget _buildButton(
    BuildContext context, IconData icon, String text, Color color) {
  return Expanded(
    child: SizedBox(
      height: 100,
      child: ElevatedButton.icon(
        icon: Icon(icon, color: Colors.white),
        label: Text(text),
        onPressed: () {
          // Define the button's action
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: color, // Background color
          onPrimary: Colors.white, // Text color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          padding: const EdgeInsets.symmetric(
              horizontal: 32, vertical: 16), // Padding inside the button
        ),
      ),
    ),
  );
}

class AppBarWithAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.all(0), // Adjust the margin as needed
      decoration: BoxDecoration(
        color: Colors.white, // Set the background color of the AppBar
        borderRadius:
            BorderRadius.circular(0), // Adjust the border radius as needed
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          const SizedBox(width: 10), // Spacing before the avatar
          const CircleAvatar(
            backgroundImage: AssetImage(
                'assets/avaters/Avatar 2.jpg'), // Replace with your image URL
            radius: 25,
          ),
          const Spacer(), // Use a Spacer widget to create space between the avatar and the icon
          IconButton(
            icon: const Icon(
              Icons.search_sharp,
              size: 33,
            ),
            onPressed: () {
              // Define the action when the search icon is pressed
            },
          ),
          const SizedBox(width: 10), // Spacing after the search icon
        ],
      ),
    );
  }
}

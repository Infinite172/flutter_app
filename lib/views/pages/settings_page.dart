import 'package:flutter/material.dart';
import 'package:flutter_app/views/pages/expanded_flexible_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key, required this.title});

  final String title;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController controller = TextEditingController();
  bool? isChecked = false;
  bool isSwitched = false;  
  bool isSwitched2 = false;
  double sliderValue = 3;
  String? menuValue;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: 
      AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.purple,
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),        
        // automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Data saved successfully!"),
                    duration: Duration(seconds: 2),
                    behavior: SnackBarBehavior.floating,
                    ),
                );
              },
              child: Text('Open SnackBar'),
            ),
            Divider(
              // color: Colors.amber,
              // thickness: 5.0,
            ),
            
            // SizedBox(
            //   height: 200,
            //   child: VerticalDivider(
            //     color: Colors.red,
            //     thickness: 5.0,
            //   ),
            //   ),

            ElevatedButton(
              onPressed: () {
                  showDialog(context: context, 
                    builder: (context) {
                    return AlertDialog(
                      title: Text('Dialog Title'),
                      content: Text('This is dialog content.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Close'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Open Dialog'),
            ),

            DropdownButton(
              value: menuValue,
               items: [
                DropdownMenuItem(
                  value: 'Mechi',
                  child: Text('Mechi'),
                ),
                DropdownMenuItem(
                  value: 'Koshi',
                  child: Text('Koshi'),
                ),
              ],
                onChanged: (String? value) {
                  setState(() {
                    menuValue = value;
                  });
            }
            ),

            TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    controller.clear();
                  },
                ),
              ),
                onEditingComplete: () {
                  setState(() { });
                },
            ),
            Text(controller.text),
      
            Checkbox(
              tristate: true,
              value: isChecked, onChanged: (bool? value) {
              setState(() {
                isChecked = value;
              });
            }),
            
            CheckboxListTile(
              tristate: true,
              title: Text('Accept Terms and Conditions'),
              value: isChecked,
              onChanged: (bool? value) {
              setState(() {
                isChecked = value;
              });
            },
            ),
            
            Switch(
              value: isSwitched,
              onChanged: (bool value) {
                setState(() {
                  isSwitched = value;
                });
              },
            ),

            SwitchListTile.adaptive(
              value: isSwitched2,
              title: Text('Enable Notifications'),
              onChanged: (bool value) {
                setState(() {
                  isSwitched2 = value;
                },
              );
              },
            ),

            Slider(
              max: 10,
              divisions: 10,
              value: sliderValue,
              onChanged: (double value) {
              setState(() {
                sliderValue = value;
              });
            }),

            InkWell(
              splashColor: Colors.blue.withAlpha(50),
              onTap: () {
              },
              child: Container(
                height: 300,
                width: double.infinity,
                color: Colors.white12,
              )
              ),
            
            FilledButton(
              onPressed: () {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context){
                  return ExpandedFlexiblePage();
                }));
              },
              child: Text('Show Flexible and Expanded'),
            ),
            TextButton(
              onPressed: () {
              },
              child: Text('Text Button'),
            ),
            OutlinedButton(
              onPressed: () {
              },
              child: Text('Outlined Button'),
            ),
            CloseButton(),
            BackButton(),
          ],
        ),
      ),
    )
    );
  }
}
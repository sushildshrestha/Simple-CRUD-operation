import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notes/components/custom_buttons.dart';
import 'package:notes/components/custom_textfield.dart';
import 'package:notes/models/contact_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Contact> contacts = List.empty(growable: true);
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('C O N T A C T  L I S T'),
        centerTitle: true,
        elevation: 1,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
              child: Column(
                children: [
                  CustomTextField(
                    controller: nameController,
                    hintText: 'Contact Name',
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    keyboardType: TextInputType.number,
                    controller: numberController,
                    maxLength: 10,
                    hintText: 'Contact Number',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomButtons(
                          onPressed: () {
                            String name = nameController.text.trim();
                            String contact = numberController.text.trim();
                            if (name.isNotEmpty && contact.isNotEmpty) {
                              setState(() {
                                nameController.text = '';
                                numberController.text = '';
                                contacts
                                    .add(Contact(name: name, contact: contact));
                              });
                            }
                          },
                          child: Text(
                            'Save',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      CustomButtons(
                          onPressed: () {
                            String name = nameController.text.trim();
                            String contact = numberController.text.trim();
                            if (name.isNotEmpty && contact.isNotEmpty) {
                              setState(() {
                                nameController.text = '';
                                numberController.text = '';
                                contacts[selectedIndex].name = name;
                                contacts[selectedIndex].contact = contact;
                                selectedIndex = -1;
                              });
                            }
                          },
                          child: Text(
                            'Update',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                    ],
                  )
                ],
              ),
            ),
            contacts.isEmpty
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "No Contact Avaiable Yet.",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                        itemCount: contacts.length,
                        itemBuilder: ((context, index) => getContact(index))),
                  )
          ],
        ),
      ),
    );
  }

  Widget getContact(int index) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: index % 2 == 0 ? Colors.red : Colors.blue,
          foregroundColor: Colors.black,
          child: Text(contacts[index].name[0]),
        ),
        title: Column(
          children: [
            Text(contacts[index].name),
            Text(contacts[index].contact),
          ],
        ),
        trailing: SizedBox(
          width: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: () {
                    nameController.text = contacts[index].name;
                    numberController.text = contacts[index].contact;
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Icon(Icons.edit)),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      //Removing the contact
                      contacts.removeAt(index);
                    });
                  },
                  child: Icon(Icons.delete))
            ],
          ),
        ),
      ),
    );
  }
}

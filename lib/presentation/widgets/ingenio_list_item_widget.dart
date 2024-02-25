import 'package:flutter/material.dart';

class IngenioListItem extends StatelessWidget {
  const IngenioListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            foregroundImage: NetworkImage(
                'https://upload.wikimedia.org/wikipedia/commons/9/93/Google_Contacts_icon.svg'),
          ),
          title: Text('First Name Last Name'),
          subtitle: Text('Role'),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {},
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'DescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescription',
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

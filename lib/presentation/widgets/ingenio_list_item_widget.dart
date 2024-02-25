import 'package:flutter/material.dart';
import 'package:ingenio/data/utils/common_constants.dart';
import 'package:ingenio/domain/entities/ingenio_item.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class IngenioListItem extends StatelessWidget {
  final Employee? employee;
  final Function()? onPressed;
  final bool separator;
  const IngenioListItem({
    Key? key,
    this.employee,
    this.onPressed,
    this.separator = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            onForegroundImageError: (exception, stackTrace) {
              print(exception.toString());
            },
            backgroundImage: Svg(
                '${CommonConstants.imagesPath}${CommonConstants.defaultContactIcon}'),
            foregroundImage: NetworkImage(employee?.avatar ?? ''),
          ),
          title: Text('${employee?.firstName} ${employee?.lastName}'),
          subtitle: Text('${employee?.title}'),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: onPressed,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  '${employee?.bio}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: separator
              ? Container(
                  width: double.maxFinite,
                  height: 1.0,
                  color: Theme.of(context).dividerColor.withOpacity(0.5),
                )
              : const SizedBox.shrink(),
        )
      ],
    );
  }
}

part of 'part_of_learn.dart';

class _PartOfAppbar extends StatelessWidget with PreferredSizeWidget {
  const _PartOfAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("axeon"),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.settings_outlined))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

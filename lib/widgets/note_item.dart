// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../cubit/cubit/notes_cubit.dart';
// import '../models/note_model.dart';
// import '../views/edit_note_view.dart';
//
// class NoteItem extends StatelessWidget {
//   const NoteItem({Key? key, required this.note}) : super(key: key);
//
//   final NoteModel note;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) {
//             return EditNoteView(
//               note: note,
//             );
//           }),
//         );
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           color: Color(note.color),
//           borderRadius: BorderRadius.circular(16),
//         ),
//         padding: const EdgeInsets.only(left: 16, top: 24, bottom: 24),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             ListTile(
//               title: Text(
//                 note.title,
//                 style: const TextStyle(
//                   fontSize: 26,
//                   color: Colors.black,
//                 ),
//               ),
//               subtitle: Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 16),
//                 child: Text(
//                   note.subTitle,
//                   style: TextStyle(
//                     fontSize: 18,
//                     color: Colors.black.withOpacity(.4),
//                   ),
//                 ),
//               ),
//               trailing: IconButton(
//                 onPressed: () {
//                   note.delete();
//
//                   BlocProvider.of<NotesCubit>(context).fetchAllNotes();
//                 },
//                 icon: const Icon(
//                   Icons.delete,
//                   color: Colors.black,
//                   size: 30,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24),
//               child: Text(
//                 note.date,
//                 style: TextStyle(
//                   color: Colors.black.withOpacity(.4),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../cubit/cubit/notes_cubit.dart';
import '../models/note_model.dart';
import '../views/edit_note_view.dart';


class NoteItem extends StatelessWidget {
  const NoteItem({Key? key, required this.note}) : super(key: key);
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          note.delete();
          BlocProvider.of<NotesCubit>(context).fetchAllNotes();
        }
      },
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Icon(
          FontAwesomeIcons.trash,
          color: Colors.white,
        ),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditNoteView(
                note: note,
              ),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.only(left: 16, top: 24, bottom: 24),
          decoration: BoxDecoration(
            color: Color(note.color),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(
                  note.title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
                  child: Text(
                    note.subTitle,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 18,
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    note.delete();
                  },
                  icon: const Icon(FontAwesomeIcons.trash),
                  color: Colors.black,
                  iconSize: 28,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24),
                child: Text(
                  note.date,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

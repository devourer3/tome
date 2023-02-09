import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tome/ui/base/custom_dialog/custom_dialog.dart';

class Input extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InputState();
}

class _InputState extends State<Input> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: FittedBox(fit: BoxFit.none, child: Text('제목을 넣어주세요', style: const TextStyle(fontSize: 18))),
        actions: [
          IconButton( // 카드 삭제
            onPressed: () {
              // 삭제 버튼
              showDialog(
                  context: context,
                  builder: (context) {
                    return CustomDialog(title: tr('card_remove_title'), desc: tr('card_remove_desc'), actionButtons: [
                      TextButton(
                        onPressed: () {
                          // context.read<CreditCardBloc>().add(CreditCardRemoved(state.selectedCard?.uid ?? ''));
                          // Navigator.pushNamedAndRemoveUntil(context, Routes.urlHome, (route) => false);
                        },
                        child: Text(tr('yes')),
                      ),
                      TextButton(
                        onPressed: () => {
                          Navigator.pop(context, 'Cancel'),
                        },
                        child: Text(tr('no')),
                      ),
                    ]);
                  });
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Container(
        child: const Text('입력/수정'),
      ),
    );
  }

  @override
  void initState() {
    print('initState');
  }

  @override
  void activate() {
    print('activate');
  }
}
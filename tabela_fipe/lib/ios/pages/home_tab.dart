import 'package:flutter/cupertino.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 36.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Home',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: SizedBox(
                    width: 71.0,
                    height: 36.0,
                    child: CupertinoButton(
                      color: const Color(0xffFAAD14),
                      padding: EdgeInsets.zero,
                      borderRadius: BorderRadius.circular(8.0),
                      child: const Text(
                        'Add new',
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                          color: CupertinoColors.black,
                        ),
                      ),
                      onPressed: () {
                        debugPrint("Clicou no botão");
                      },
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Center(
                child: Container(
                  height: 1.0,
                  width: 382.0,
                  color: CupertinoColors.systemGrey3,
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                  itemCount: 10,
                  padding: const EdgeInsets.all(16.0),
                  separatorBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Container(
                        height: 1.0,
                        width: 382.0,
                        color: CupertinoColors.systemGrey3,
                      ),
                    );
                  },
                  itemBuilder: (context, index) {
                    return CupertinoListTile(
                      padding: const EdgeInsets.all(0.0),
                      leading: Image.asset('images/thumb.png'),
                      leadingSize: 48.0,
                      leadingToTitle: 8.0,
                      title: const Text("Title",
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w700,
                          )),
                      subtitle: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Year',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                              )),
                          SizedBox(height: 2.0),
                          Text(
                            'View More',
                            style: TextStyle(
                              fontSize: 10.0,
                              fontWeight: FontWeight.w300,
                              color: Color(0xff00ADEE),
                            ),
                          ),
                        ],
                      ),
                      trailing: const Icon(
                        CupertinoIcons.ellipsis_vertical,
                        color: Color(0xff595959),
                      ),
                      onTap: () {
                        debugPrint("Clicou no item $index");
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

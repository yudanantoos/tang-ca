import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter/blocs/slot_bloc/slot.dart';
import 'package:starter/models/slot.dart';
import 'package:starter/routes.dart';
import 'package:starter/screens/home/widgets/slot_item.dart';

class Home extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  BuildContext _context;
  SlotBloc _bloc;

  void _onSlotTap(Slot slot) {
    Router.of(_context).push(Routes.slotDetail, arguments: {"slot": slot});
  }

  void _onSlotDismissed(Slot slot, DismissDirection direction) {
    _bloc.dispatch(RemoveSlot(slot));

    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text("${slot.description} đã bị xóa"),
        action: SnackBarAction(
          label: "Khôi phục",
          onPressed: () => _bloc.dispatch(AddSlot(slot)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    _bloc = SlotBloc.of(context);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Tăng Caaaa"),
        centerTitle: true,
      ),
      body: Container(
        child: BlocBuilder(
          bloc: _bloc,
          builder: _buildSlotList,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Router.of(context).push(Routes.slotDetail),
      ),
    );
  }

  Widget _buildSlotList(BuildContext context, SlotState state) {
    switch (state.runtimeType) {
      case SlotsLoading:
        return Center(
          child: CircularProgressIndicator(),
        );

      case SlotsLoaded:
        final slots = (state as SlotsLoaded).slots
          ..sort((a, b) => a.date.isBefore(b.date) || a.from.isBefore(b.from) ? -1 : 1);

        return ListView.builder(
          itemCount: slots.length,
          itemBuilder: (context, index) {
            final slot = slots[index];

            return Dismissible(
              key: Key("${slot.id}"),
              background: Container(color: Colors.red[700]),
              child: SlotItem(
                slot: slot,
                onTap: () => _onSlotTap(slot),
              ),
              onDismissed: (direction) => _onSlotDismissed(slot, direction),
            );
          },
        );
        break;

      case SlotsNotLoaded:
      default:
        return Center(
          child: Text("Có lỗi trong quá trình lấy dữ liệu"),
        );
    }
  }
}

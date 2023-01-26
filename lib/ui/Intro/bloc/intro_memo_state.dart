import 'package:equatable/equatable.dart';
import 'package:tome/data/db/model/memory.dart';
import 'package:tome/ui/constants/bloc_status.dart';

class MemoryState extends Equatable {
  final BlocStatus status;
  final List<MemoryItemModel> memoryList;

  const MemoryState({
    this.status = BlocStatus.initial,
    this.memoryList = const [],
  });

  MemoryState setState({BlocStatus? pStatus, List<MemoryItemModel>? pMemoryList}) {
    return MemoryState(
      status: pStatus ?? BlocStatus.loading,
      memoryList: pMemoryList ?? [],
    );
}

  @override
  List<Object?> get props => [status, memoryList];
}

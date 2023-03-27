import 'package:equatable/equatable.dart';
import 'package:tome/data/db/model/memory.dart';

abstract class MemoryEvent extends Equatable {
  const MemoryEvent();
}

class MemoryInit extends MemoryEvent {
  @override
  List<Object> get props => [];
}

class MemoryAdded extends MemoryEvent {
  const MemoryAdded(this.memoryItemModel);
  final MemoryItemModel memoryItemModel;
  @override
  List<Object> get props => [memoryItemModel];
}

class MemoryModified extends MemoryEvent {
  const MemoryModified(this.memoryItemModel);
  final MemoryItemModel memoryItemModel;
  @override
  List<Object> get props => [memoryItemModel];
}

class MemoryRemoved extends MemoryEvent {
  const MemoryRemoved(this.uid);
  final String uid;
  @override
  List<Object> get props => [uid];
}

class EvSetCreditCardState extends MemoryEvent {
  const EvSetCreditCardState({this.memoryItemList });
  final List<MemoryItemModel>? memoryItemList;
  @override
  List<Object?> get props => [memoryItemList];
}

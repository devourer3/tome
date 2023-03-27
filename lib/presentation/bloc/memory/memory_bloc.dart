import 'package:bloc/bloc.dart';
import 'package:tome/data/db/model/memory.dart';
import 'package:tome/domain/local/memory_repository.dart';
import 'package:tome/presentation/bloc/memory/memory_state.dart';
import 'package:tome/presentation/ui/constants/bloc_status.dart';

import 'memory_event.dart';

// bloc vs cubit
// https://ppantaleon.medium.com/flutter-bloc-vs-cubit-100a0fb0efcf
// cubit 은 ui 에 간단한 작업을 진행할 떄,
// bloc 은 repository 와 관련된 복잡한 것, 디버그가 필요할 때
class MemoryBloc extends Bloc<MemoryEvent, MemoryState> {
  MemoryBloc({required MemoryRepository memoryRepository}) : _memoryRepository = memoryRepository,
  super(const MemoryState(status: BlocStatus.success, memoryList: [])) {
    on<MemoryInit>(_onInitialized);
    on<MemoryAdded>(_onAdded);
    on<MemoryRemoved>(_onRemoved);
  }

  final MemoryRepository _memoryRepository;

  Future<void> _onInitialized(
    MemoryInit event,
    Emitter<MemoryState> emit,
  ) async {
    emit(state.setState(pStatus: BlocStatus.loading));
    try {
      final List<MemoryItemModel> memoryList = await _memoryRepository.getAllMemory();
      emit(state.setState(pStatus: BlocStatus.success, pMemoryList: memoryList));
    } catch (e) {
      print('initialized invoke Error! $e');
      emit(state.setState(pStatus: BlocStatus.failure));
    }
  }

  Future<void> _onAdded(
      MemoryAdded event,
      Emitter<MemoryState> emit,
      ) async {
    emit(state.setState(pStatus: BlocStatus.loading));
    try {
      await _memoryRepository.insertMemory(event.memoryItemModel);
      final List<MemoryItemModel> memoryList = await _memoryRepository.getAllMemory();
      emit(state.setState(pStatus: BlocStatus.success, pMemoryList: memoryList));
    } catch (e) {
      print('onAdded invoke Error! $e');
      emit(state.setState(pStatus: BlocStatus.failure));
    }
  }

  Future<void> _onRemoved(
      MemoryRemoved event,
      Emitter<MemoryState> emit,
      ) async {
    emit(state.setState(pStatus: BlocStatus.loading));
    try {
      // await _creditCardRepository.removeCardItem(event.uid);
      // final List<CreditCard> cardList = await _creditCardRepository.selectSampleCards();
      // emit(state.setState(setStatus: () => LoadStatus.success, setCardList: () => cardList));
    } catch (e) {
      print('creditCard onAdded invoke Error! $e');
      emit(state.setState(pStatus: BlocStatus.failure));
    }
  }
}

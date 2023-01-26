import 'package:bloc/bloc.dart';
import 'package:tome/data/db/model/memory.dart';
import 'package:tome/domain/local/memory_repository.dart';
import 'package:tome/ui/Intro/bloc/intro_memo_state.dart';
import 'package:tome/ui/constants/bloc_status.dart';

import 'intro_memo_event.dart';

// bloc vs cubit
// https://ppantaleon.medium.com/flutter-bloc-vs-cubit-100a0fb0efcf
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
      // await _creditCardRepository.insertCreditCard(event.creditCard);
      // final List<CreditCard> creditCardList = await _creditCardRepository.selectSampleCards();
      // emit(state.setState(setStatus: () => LoadStatus.success, setCardList: () => creditCardList));
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

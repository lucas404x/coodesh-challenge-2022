abstract class HomeBlocEvent {} 

class GetProductsEvent extends HomeBlocEvent {}

class DeleteProductEvent extends HomeBlocEvent {
  final int index;
  DeleteProductEvent(this.index);
}
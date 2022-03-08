abstract class HomeBlocEvent {} 

class GetProductsEvent extends HomeBlocEvent {}

class UpdateProductEvent extends HomeBlocEvent {
  final int index;
  UpdateProductEvent(this.index);
}

class DeleteProductEvent extends HomeBlocEvent {
  final int index;
  DeleteProductEvent(this.index);
}
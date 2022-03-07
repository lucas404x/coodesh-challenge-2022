abstract class ProductBlocEvent {}

class LoadProductEvent extends ProductBlocEvent {
  final String id;

  LoadProductEvent({required this.id});
}

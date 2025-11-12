import '../../features/orders/domain/entities/order_entity.dart';
import '../../features/orders/domain/entities/order_product_entity.dart';
import '../../features/orders/domain/entities/shipping_address_entity.dart';
import '../enums/order_status_enums.dart';

OrderEntity getDummyOrder() {
  // Create a sample shipping address
  ShippingAddressEntity shippingAddress = ShippingAddressEntity(
    name: 'John Doe',
    phone: '123-456-7890',
    addressDetails: '123 Main St',
    floor: '5th Floor',
    city: 'New York',
    email: 'johndoe@example.com',
  );

  // Create a sample list of order products
  List<OrderProductEntity> orderProducts = [
    OrderProductEntity(
      productName: 'Product A',
      productCode: 'A123',
      imageUrl:
          'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-169994-674010.jpg&fm=jpg',
      productPrice: 49.99,
      count: 2,
    ),
    OrderProductEntity(
      productName: 'Product B',
      productCode: 'B456',
      imageUrl:
          'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-169994-674010.jpg&fm=jpg',
      productPrice: 29.99,
      count: 1,
    ),
    OrderProductEntity(
      productName: 'Product C',
      productCode: 'C789',
      imageUrl:
          'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-169994-674010.jpg&fm=jpg',
      productPrice: 19.99,
      count: 3,
    ),
  ];

  // Calculate total price
  double totalPrice = orderProducts.fold(
    0,
    (sum, product) => sum + (product.productPrice * product.count),
  );

  // Create and return the OrderModel
  return OrderEntity(
    orderId: '12345',
    totalPrice: totalPrice,
    status: OrderStatusEnum.pending,
    uId: 'user123',
    shippingAddressEntity: shippingAddress,
    orderProducts: orderProducts,
    paymentMethod: 'Cash',
    date: DateTime.now().toString(),
  );
}

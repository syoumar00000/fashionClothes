import 'package:fashion/mockups/products-mockup.dart';
import 'package:fashion/models/cart.dart';
import 'package:fashion/models/order.dart';

final List<Order> orderMockup = [
  Order(
    id: "56476",
    total: 11.37,
    discount: 0,
    tax: 11.37 * 0.18,
    deliveryCost: 2,
    cartItems: [
      CartItem(
        product: productMockup[0],
        selectedPrice: productMockup[0].prices![0],
        quantity: 2,
      ),
      CartItem(
        product: productMockup[1],
        selectedPrice: productMockup[1].prices![0],
        quantity: 1,
      )
    ],
    status: OrderStatus.confirmed,
    estimatedTime: DateTime(2021, 9, 30, 16, 35),
  ),
  Order(
    id: "87940",
    total: 14.37,
    discount: 1,
    tax: 14.37 * 0.18,
    deliveryCost: 2,
    cartItems: [
      CartItem(
        product: productMockup[0],
        selectedPrice: productMockup[0].prices![0],
        quantity: 2,
      ),
      CartItem(
        product: productMockup[1],
        selectedPrice: productMockup[1].prices![0],
        quantity: 1,
      )
    ],
    status: OrderStatus.processed,
    estimatedTime: DateTime(2021, 9, 30, 15, 15),
  ),
  Order(
    id: "56476",
    total: 8.37,
    discount: 0,
    tax: 8.37 * 0.18,
    deliveryCost: 2,
    cartItems: [
      CartItem(
        product: productMockup[0],
        selectedPrice: productMockup[0].prices![0],
        quantity: 2,
      ),
    ],
    status: OrderStatus.processed,
    estimatedTime: DateTime(2021, 9, 29, 10, 30),
  ),
  Order(
    id: "96476",
    total: 25.37,
    discount: 0,
    tax: 25.37 * 0.18,
    deliveryCost: 2,
    cartItems: [
      CartItem(
        product: productMockup[0],
        selectedPrice: productMockup[0].prices![0],
        quantity: 2,
      ),
      CartItem(
        product: productMockup[2],
        selectedPrice: productMockup[2].prices![0],
        quantity: 1,
      ),
      CartItem(
        product: productMockup[3],
        selectedPrice: productMockup[3].prices![0],
        quantity: 3,
      )
    ],
    status: OrderStatus.picking,
    estimatedTime: DateTime(2021, 9, 28, 18, 30),
  ),
  Order(
    id: "56476",
    total: 45.37,
    discount: 5,
    tax: 45.37 * 0.18,
    deliveryCost: 2,
    cartItems: [
      CartItem(
        product: productMockup[4],
        selectedPrice: productMockup[4].prices![0],
        quantity: 3,
      ),
      CartItem(
        product: productMockup[2],
        selectedPrice: productMockup[2].prices![0],
        quantity: 1,
      ),
      CartItem(
        product: productMockup[3],
        selectedPrice: productMockup[3].prices![0],
        quantity: 3,
      )
    ],
    status: OrderStatus.delivered,
    estimatedTime: DateTime(2021, 9, 20, 19, 30),
  ),
  Order(
    id: "97476",
    total: 31.37,
    discount: 3,
    tax: 31.37 * 0.18,
    deliveryCost: 2,
    cartItems: [
      CartItem(
        product: productMockup[4],
        selectedPrice: productMockup[4].prices![0],
        quantity: 3,
      ),
      CartItem(
        product: productMockup[2],
        selectedPrice: productMockup[2].prices![0],
        quantity: 1,
      ),
      CartItem(
        product: productMockup[10],
        selectedPrice: productMockup[10].prices![0],
        quantity: 3,
      ),
      CartItem(
        product: productMockup[12],
        selectedPrice: productMockup[12].prices![0],
        quantity: 3,
      )
    ],
    status: OrderStatus.delivered,
    estimatedTime: DateTime(2021, 10, 10, 19, 30),
  ),
  Order(
    id: "78476",
    total: 11.37,
    discount: 0,
    tax: 11.37 * 0.18,
    deliveryCost: 2,
    cartItems: [
      CartItem(
        product: productMockup[0],
        selectedPrice: productMockup[0].prices![0],
        quantity: 2,
      ),
      CartItem(
        product: productMockup[1],
        selectedPrice: productMockup[1].prices![0],
        quantity: 1,
      )
    ],
    status: OrderStatus.delivered,
    estimatedTime: DateTime(2021, 9, 9, 16, 35),
  ),
];

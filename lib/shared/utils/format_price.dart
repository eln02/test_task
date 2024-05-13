String formatPrice(int price) {
  return '${price.toString().substring(0, (price.toString().length > 3 ? price.toString().length - 3 : 0))} ${price.toString().substring((price.toString().length > 3 ? price.toString().length - 3 : 0))}';
}

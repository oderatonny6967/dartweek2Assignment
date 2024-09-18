// Function to calculate the total price of items, including an optional tax parameter
double calculateTotal(List<double> prices, {double taxPercentage = 0.0}) {
  double total = prices.reduce((value, element) => value + element);
  total += total * (taxPercentage / 100);  // Add tax if provided
  return total;
}

// Function to filter out items below a certain threshold using an anonymous function
List<double> filterItems(List<double> prices, double threshold) {
  return prices.where((price) => price >= threshold).toList();
}

// Higher-order function to apply a discount using a discount function
List<double> applyDiscount(List<double> prices, double Function(double) discountFunc) {
  return prices.map((price) => discountFunc(price)).toList();
}

// Discount function to reduce price by a percentage
double percentageDiscount(double price, double discountPercentage) {
  return price - (price * (discountPercentage / 100));
}

// Recursive function to calculate a special discount based on the factorial of the number of items
int calculateFactorialDiscount(int n) {
  if (n <= 1) return 1;
  return n * calculateFactorialDiscount(n - 1);  // Recursively calculate factorial
}

void main() {
  // List of item prices in the cart
  List<double> cartPrices = [50.0, 15.0, 75.0, 8.0, 22.0];

  // Step 1: Filter out items below $10 using an anonymous function
  double threshold = 10.0;
  List<double> filteredPrices = filterItems(cartPrices, threshold);
  print("Filtered items (price >= $threshold): $filteredPrices");

  // Step 2: Apply a discount using a higher-order function
  double discountPercentage = 20.0;
  List<double> discountedPrices = applyDiscount(filteredPrices, (price) => percentageDiscount(price, discountPercentage));
  print("Prices after $discountPercentage% discount: $discountedPrices");

  // Step 3: Calculate the total price after applying tax
  double taxPercentage = 8.0;
  double totalPrice = calculateTotal(discountedPrices, taxPercentage: taxPercentage);
  print("Total price after applying $taxPercentage% tax: \$${totalPrice.toStringAsFixed(2)}");

  // Step 4: Calculate the factorial discount based on the number of items in the cart
  int itemCount = filteredPrices.length;
  int factorialDiscount = calculateFactorialDiscount(itemCount);
  print("Factorial discount for $itemCount items: $factorialDiscount%");

  // Step 5: Apply the factorial discount to the total price
  double finalPrice = percentageDiscount(totalPrice, factorialDiscount.toDouble());
  print("Final price after applying factorial discount: \$${finalPrice.toStringAsFixed(2)}");
}

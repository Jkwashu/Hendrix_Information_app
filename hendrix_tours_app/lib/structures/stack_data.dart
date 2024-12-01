// Stack Data Structure
class StackData<E> {
  List stack = <E>[];
  
  void push(E value) => stack.add(value);

  E pop() => stack.removeLast();

  E peek() => stack.last;

  bool get isEmpty => stack.isEmpty;
  
  @override
  String toString() => stack.toString();
}
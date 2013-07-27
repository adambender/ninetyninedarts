import 'dart:math';
import 'package:unittest/unittest.dart';
import '../lib/ninetyninedarts.dart';

void main() {
  test('Find the last element of a list.', (){
    expect(last([1, 1, 2, 3, 5, 8]), 8);
  });

  test('Find the last but one element of a list.', (){
    expect(penultimate([1, 1, 2, 3, 5, 8]), 5);
  });

  test('Find the Kth element of a list.', (){
    expect(nth(2, [1, 1, 2, 3, 5, 8]), 2);
  });

  test('Find the number of elements of a list.', (){
    expect(length([1, 1, 2, 3, 5, 8]), 6);
  });

  test('Reverse a list.', (){
    expect(reverse([1, 1, 2, 3, 5, 8]), [8, 5, 3, 2, 1, 1]);
  });

  test('Find out whether a list is a palindrome.', (){
    expect(isPalindrome([1, 2, 3, 2, 1]), true);
    expect(isPalindrome([1, 2, 3, 3, 1]), false);
  });

  test('Flatten a nested list structure.', (){
    expect(flatten([[1, 1], 2, [3, [5, 8]]]), [1, 1, 2, 3, 5, 8]);
  });

  test('Eliminate consecutive duplicates of list elements.', (){
    expect(compress(['a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 'a', 'd', 'e', 'e', 'e', 'e']),
        ['a', 'b', 'c', 'a', 'd', 'e']);
  });

  test('Pack consecutive duplicates of list elements into sublists.', (){
    expect(pack(['a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 'a', 'd', 'e', 'e', 'e', 'e']),
        [['a', 'a', 'a', 'a'],['b'], ['c', 'c'], ['a', 'a'],['d'], ['e', 'e', 'e', 'e']]);
  });

  test('Run-length encoding of a list.', (){
    expect(encode(['a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 'a', 'd', 'e', 'e', 'e', 'e']),
        [new T2(4,'a'), new T2(1,'b'), new T2(2, 'c'), new T2(2,'a'), new T2(1,'d'), new  T2(4,'e')]);
  });

  test('Modified run-length encoding.', (){
    expect(encodeModified(['a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 'a', 'd', 'e', 'e', 'e', 'e']),
        [new T2(4,'a'), 'b', new T2(2, 'c'), new T2(2,'a'),'d', new  T2(4,'e')]);
  });

  test('Decode a run-length encoded list.', (){
    expect(decode([new T2(4,'a'), new T2(1,'b'), new T2(2, 'c'), new T2(2,'a'), new T2(1,'d'), new  T2(4,'e')]),
        ['a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 'a', 'd', 'e', 'e', 'e', 'e']);
  });

  test('Run-length encoding of a list (direct solution).', (){
    expect(encodeDirect(['a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 'a', 'd', 'e', 'e', 'e', 'e']),
        [new T2(4,'a'), new T2(1,'b'), new T2(2, 'c'), new T2(2,'a'), new T2(1,'d'), new  T2(4,'e')]);
  });

  test('Duplicate the elements of a list.', (){
    expect(duplicate(['a', 'b', 'c', 'd']),
        ['a', 'a', 'b', 'b', 'c', 'c', 'd', 'd']);
  });

  test('Duplicate the elements of a list a given number of times.', (){
    expect(duplicateN(3, ['a', 'b', 'c', 'd']),
        ['a', 'a', 'a', 'b', 'b', 'b', 'c', 'c', 'c', 'd', 'd', 'd']);
  });

  test('Drop every Nth element from a list.', (){
    expect(drop(3, ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k']),
        ['a', 'b', 'd', 'e', 'g', 'h', 'j', 'k']);
  });

  test('Split a list into two parts.', (){
    T2 splitList = split(3, ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k']);
    expect(splitList.first, ['a', 'b', 'c']);
    expect(splitList.second, [ 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k']);
  });

  test('Extract a slice from a list.', (){
    expect(slice(3, 7,  ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k']),
       ['d', 'e', 'f', 'g']);
  });

  test('Rotate a list N places to the left.', (){
    expect(rotate(3, ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k']),
           ['d', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'a', 'b', 'c']);
    expect(rotate(-2, ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k']),
        ['j', 'k', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i']);
  });

  test('Remove the Kth element from a list.', (){
    T2 result = removeAt(1 , ['a', 'b', 'c', 'd']);
    expect(result.first, ['a', 'c', 'd']);
    expect(result.second, 'b');
  });

  test('Insert an element at a given position into a list.', (){
    expect(insertAt('new', 1, ['a', 'b', 'c', 'd']), ['a', 'new', 'b', 'c', 'd']);
  });

  test('Create a list containing all integers within a given range.', (){
    expect(range(4, 9), [4, 5, 6, 7, 8, 9]);
  });

  test('Extract a given number of randomly selected elements from a list.', (){
    List original  = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'];
    List modifiable  = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'];
    List result = randomSelect(3, modifiable);
    expect(original.toSet().difference(modifiable.toSet()), unorderedEquals(result));
  });

  test('Lotto: Draw N different random numbers from the set 1..M.', (){
    //not a perfect test, but should catch any obvious errors.
    Random rnd = new Random();
    for(int i = 0; i < 1000; i++) {
      var howMany = rnd.nextInt(10) + 5;
      var lottoNumbers = lotto(howMany, 49);
      expect(lottoNumbers.length, howMany);
      lottoNumbers.forEach((_){
        expect(_, greaterThanOrEqualTo(0));
        expect(_, lessThanOrEqualTo(49));
      });
    }
  });

  test('Generate a random permutation of the elements of a list.', (){
    var list = ['a','b','c','d','e','f'];
    for(int i = 0; i < 1000; i++){
      List permuted = randomPermute(list);
      expect(permuted.toSet().difference(list.toSet()), new Set());
      expect(list.toSet().difference(permuted.toSet()), new Set());
    }
  });
}

library ninetyninedarts;

void main() {}

last(List l) => l.last;

penultimate(List l){
  if(l.length < 2)
    throw "no such element";
  //Not to clever, if only I could index with -2 or take from the right
  return l[l.length -2];
}

nth(int n, List l){
  if(n >= 0) return l[n];
  else throw "no such element";
}

length(List l) => l.length;

reverse(List l) => l.reversed;

isPalindrome(List l) => iterableEquals(l, l.reversed);

flatten(List l){
  //dreaming of a iterable.flatMap like in scala :)
  var result = [];
  l.forEach((n){
    if(n is List){
      result.addAll(flatten(n));
    } else {
      result.add(n);
    }
  });
  return result;
}

//Distinction between list and iterable can be kind of annoying since iterable methods
//return iterables which cant be manipulated like lists.
compress(Iterable l){
  if(l.length == 0){
    return [];
  } else {
    var result = [l.first];
    return result..addAll(compress(l.skipWhile((n) => l.first == n )));
  }
}

pack(List l){
  if (l.isEmpty) return [[]];
  else {
    var result = [];
    l.forEach((n){
      if(result.isEmpty || n != result.last.first){
        result.add([n]);
      } else {
        result.last.add(n);
      }
    });
    return result;
  }
}

encode(List l) => pack(l).map((n) => new T2(n.length, n.first));

encodeModified(List l) => pack(l).map((n) => n.length == 1 ? n.first : new T2(n.length, n.first));

decode(List<T2> l) => l.expand((T2 n) => new List.filled(n.first, n.second));

encodeDirect(List l){
  if (l.isEmpty) return [[]];
  else {
    List<T2> result = [new T2(1, l.first)];
    l.skip(1).forEach((n){
      if(n != result.last.second){
        result.add(new T2(1, n));
      } else {
        result.last.first++;
      }
    });
    return result;
  }
}

duplicate(List l) => l.expand((e) => [e, e]);


duplicateN(int times, List l) =>l.expand((e) => new List.filled(times, e));

drop(int n, List l){
  var i = 0;
  return l.where((e){
    i++;
    return !(i % n == 0);
  });
}

split(int n, List l) => new T2(l.take(n).toList(), l.skip(n).toList());

//There is a built in function to make a sublist but this is a more
//illustrative example.
slice(int start, int end, List l) => l.skip(start).take(end - start);

rotate(int n, List l){
  //it would be neat if operaters like skip and take handled negative arugments.
  int index = n  < 0 ? l.length - n.abs() : n;
  return new List.from(l.skip(index))..addAll(l.take(index).toList());
}

removeAt(int n, List l){}

bool iterableEquals(Iterable l1, Iterable l2){
  if(l1.length != l2.length){
    return false;
  }
  for(int i = 0; i < l1.length; i++){
    if(l1.elementAt(i) != l2.elementAt(i)){
      return false;
    }
  }
  return true;
}

//TODO(bendera): should make this generic
class T2 {
  var first;
  var second;
  T2(this.first, this.second);

  String toString() => 'first: $first, second: $second';

  bool operator == (var other) {
    if (other is !T2) return false;
    return first == other.first && second == other.second;
  }

  int get hashCode {
    int result = 17;
    result = 37 * result + first.hashCode;
    result = 37 * result + second.hashCode;
    return result;
  }
}
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
  l.forEach((_){
    if(_ is List){
      result.addAll(flatten(_));
    } else {
      result.add(_);
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
    //would be nice if addall returned the collection;
    result.addAll(compress(l.skipWhile((_) => l.first == _ )));
    return result;
  }
}

pack(List l){
  if (l.isEmpty) [[]];
  else {
    var result = [[l.first]];
    for(int i = 1; i < l.length; i++){
      if(l[i] == result.last.first){
        result.last.add(l[i]);
      } else {
        result.add([l[i]]);
      }
    }
    return result;
  }
}

encode(List l) =>pack(l).map((_) => new T2(_.length, _.first));

encodeModified(List l) => pack(l).map((_) => _.length == 1 ? _.first : new T2(_.length, _.first));

decode(List<T2> l) =>l.expand((T2 _) => new List.filled(_.first, _.second));

encodeDirect(List l){}

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
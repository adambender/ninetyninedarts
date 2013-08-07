library ninetyninedarts;

void main() {}

last(List l) {}

penultimate(List l){}

nth(int n, List l){}

length(List l){}

reverse(List l){}

isPalindrome(List l){}

flatten(List l){}

compress(Iterable l){}

pack(List l){}

encode(List l){}

encodeModified(List l){}

decode(List l){}

encodeDirect(List l){}

duplicate(List l){}

duplicateN(int times, List l){}

drop(int n, List l){}

split(int n, List l){}

slice(int start, int end, List l){}

rotate(int n, List l){}

removeAt(int n, List l){}

insertAt(Object e, int n, List l){}

range(int start, int end){}

randomSelect(int count, List l){}

lotto(int count, int maxValue){}

randomPermute(List l){}

combinations(int n, List l){}

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
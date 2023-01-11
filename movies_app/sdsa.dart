import 'package:flutter/foundation.dart';

List<int> list=[1,2,3,2,1,4,5,0];  // sorting,delete repeated numbers
List<int> sort(){
  List<int> newList=[];
  for (int i=0;i<list.length;i++){
    if(!list.contains(list[i])){
      newList.add(list[i]);
    }
  }
  List<int> finalList=[];
  for(int i=0;i<newList.length;i++){
    int min=newList[0];
    for(int j=i+1;j<newList.length;j++){
      if(newList[j]<min){
        min=newList[j];
      }
    }
    finalList.add(min);
  }
return finalList;
}
class A{
  test(dynamic a){

  }
}
class B extends A{}
class C extends A{}
run(A a){
  debugPrint(a.toString());
}

test(){
  run(B());
  run(C());
}
main(){
  final a=A();
  a.test(1);
  a.test('a');
}
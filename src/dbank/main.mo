import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";
import Int "mo:base/Int";

actor DBank{

stable var currentValue : Float =300;
// currentValue:=300;

stable var startTime = Time.now();
// startTime := Time.now();
Debug.print(debug_show(startTime));

let id = 1234567890;
Debug.print(debug_show(id));

public func topUp(amount: Float){
  currentValue += amount;
  Debug.print(debug_show(currentValue));
};

public func withdraw(amount: Float){
  let tempValue: Float = currentValue - amount;
  if(tempValue >= 0 )
  {
    currentValue -= amount;
    Debug.print(debug_show(currentValue));
  }
  else{
    Debug.print("invalid");
  }
 }; 

 public query func checkBalance(): async Float{
   Debug.print(debug_show(currentValue));
   return currentValue;
 };

 public func compound(){
  let currentTime = Time.now();
  let timeElapsedNS = currentTime-startTime;
  let timeElapsedS = timeElapsedNS /1000000000;
  currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
  startTime := currentTime;
 }
}
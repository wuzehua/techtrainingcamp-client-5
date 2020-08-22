class RingState {
  int splitCount;
  int currPos;

  RingState({this.splitCount = 60, this.currPos = 0}):
      assert(splitCount >= 2),
      assert(currPos >= 0);
}
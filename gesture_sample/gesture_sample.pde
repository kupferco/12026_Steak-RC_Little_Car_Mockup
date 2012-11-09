// http://forum.processing.org/topic/gestures


import android.view.GestureDetector;
import android.view.GestureDetector.SimpleOnGestureListener;
import android.os.Bundle;
GestureDetector mGestureDetector;
ArrayList<Foo> foo;
//Foo foo;
void setup() {
  size(displayWidth, displayHeight, A2D);
  // Fix the orientation so the sketch won't reset when rotated.
  orientation(PORTRAIT);
  noStroke();
  smooth();
  foo = new ArrayList();
}
void draw() {
  background(255);
  for (int i=0; i<foo.size(); i++) {
    Foo f = (Foo) foo.get(i);
    f.moveOn();
    f.display();
  }
}
void birth(float _x, float _y) {
  foo.add(new Foo(_x, _y));
}
public void onCreate(Bundle savedInstanceState) {
  super.onCreate(savedInstanceState);
  mGestureDetector = new GestureDetector(this, new LearnGestureListener());
}
public boolean surfaceTouchEvent(MotionEvent me) {
  if (mGestureDetector.onTouchEvent(me))
  {
    //return true;
    return super.surfaceTouchEvent(me);
  }
  else
  {
    return false;
  }
}


class LearnGestureListener extends GestureDetector.SimpleOnGestureListener {
  @Override
    public boolean onSingleTapUp(MotionEvent ev) {
    println("onSingleTapUp");
    birth(ev.getX(), ev.getY());
    return true;
  }
  @Override
    public boolean onDoubleTap(MotionEvent ev) {
    println("onDoubleTap");
    for (int i=0; i<foo.size(); i++) {
      Foo f = (Foo) foo.get(i);
      f.changeColor();
    }
    return true;
  }
  @Override
    public void onShowPress(MotionEvent ev) {
    println("onShowPress");
  }
  @Override
    public void onLongPress(MotionEvent ev) {
    for (int i=0; i<foo.size(); i++) {
      Foo f = (Foo) foo.get(i);
      f.grow();
    }
    println("onLongPress");
  }
  @Override
    public boolean onScroll(MotionEvent e1, MotionEvent e2, float distanceX, float distanceY) {
    println("onScroll");
    for (int i=0; i<foo.size(); i++) {
      Foo f = (Foo) foo.get(i);
      f.update(distanceX, distanceY);
    }
    return true;
  }
  @Override
    public boolean onDown(MotionEvent ev) {
    println("onDown");
    return true;
  }
  @Override
    public boolean onFling(MotionEvent e1, MotionEvent e2, float velocityX, float velocityY) {
    println("onFling");
    final float distanceTimeFactor = 0.4f;
    final float totalDx = (distanceTimeFactor * velocityX / 2);
    final float totalDy = (distanceTimeFactor * velocityY / 2);
    for (int i=0; i<foo.size(); i++) {
      Foo f = (Foo) foo.get(i);
      f.quickly(totalDx, totalDy, (long) (1000 * distanceTimeFactor));
    }
    return true;
  }
}


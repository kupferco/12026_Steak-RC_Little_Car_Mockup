import android.view.animation.Interpolator;
import android.view.animation.OvershootInterpolator;
class Foo {
  float x, y, taille, easing = 0.05, targetX, targetY, X, Y;
  float totalAnimDx, totalAnimDy;
  long startTime, endTime;
  Interpolator animateInterpolator;
  color couleur;
   Foo(float _x, float _y) {
    x = _x;
    y = _y;
    taille = 70;
    animateInterpolator = new OvershootInterpolator();
    couleur = color(123, 123, 123, 50);
  }
  void update(float _x, float _y) {
    x += _x;
    y += _y;
  }
  void moveOn() {
    //    x += _x;
    //    y += _y;
    x = constrain(x, 0+taille/2, displayWidth-taille/2);
    y = constrain(y, 0+taille/2, displayHeight-taille/2);
    targetX = x;
    targetY = y;
    float dx = targetX - X;
    float dy = targetY - Y;
    if (abs(dx) > 1) X += dx * easing;
    if (abs(dy) > 1) Y += dy * easing;
  }
  void quickly(float dx, float dy, long duration) {
    startTime = System.currentTimeMillis();
    endTime = startTime + duration;
    totalAnimDx = dx;
    totalAnimDy = dy;
    long curTime =System.currentTimeMillis();
    float percentTime = (float) (curTime - startTime) / (float) (endTime - startTime);
    float percentDistance = animateInterpolator.getInterpolation(percentTime);
    float curDx = percentDistance * totalAnimDx;
    float curDy = percentDistance * totalAnimDy;
    update(curDx, curDy);
  }
  void changeColor() {
    couleur = color(random(255), random(255), random(255), 50);
  }
  void grow() {
    if (taille<300) {
      taille+=10;
      println(taille);
    }
    else {
      taille = 70;
    }
  }
  void display() {
    fill(couleur);
    ellipse(X, Y, taille, taille);
  }
}


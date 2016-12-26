import java.util.*;
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;

Gear gear;

ArrayList<PVector> points;

void setup()
{
  size(1280, 720);
  smooth();
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, 0);

  gear = new Gear(width / 2, height / 2);
}

void draw()
{
  background(0);
  box2d.step();
  
  gear.display();
}
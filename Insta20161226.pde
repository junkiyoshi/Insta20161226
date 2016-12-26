import java.util.*;
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;

Gear gear;
Floor floor;

ArrayList<Gear> gears;

void setup()
{
  size(1080, 1080);
  smooth();
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -20);

  gears = new ArrayList<Gear>();
  gears.add(new Gear(width / 2, height / 2, 30));
  floor = new Floor();
}

void draw()
{
  background(0);
  box2d.step();
   
  for(Gear gear : gears)
  {
    gear.display();
  }
  
  floor.display();
}

void mouseClicked()
{
  gears.add(new Gear(width / 2, height / 2, 20));
}
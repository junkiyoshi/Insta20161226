class Gear
{
  Body body;
  
  Gear(float x, float y)
  {
    makeBody(new Vec2(x, y));
  }
  
  void makeBody(Vec2 center)
  {
    int span = 8;
    
    Vec2[] vertices = new Vec2[span];
    float x, y;
    float angleSpan = 360 / span;
    for(int i = 0; i < span; i += 1)
    {
      float angle = i * angleSpan;
      
      x = 300 * cos(radians(angle));
      y = 300 * sin(radians(angle));
      
      vertices[i] = box2d.vectorPixelsToWorld(new Vec2(x, y));
    }
    
    PolygonShape ps = new PolygonShape();
    ps.set(vertices, vertices.length);
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(center));
    body = box2d.createBody(bd);

    body.createFixture(ps, 1.0);
  }
  
  void display()
  {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    
    Fixture f = body.getFixtureList();
    PolygonShape ps = (PolygonShape) f.getShape();

    pushMatrix();
    translate(pos.x, pos.y); //<>//
    rotate(-a);
    fill(0, 0, 255);
    stroke(0);
    strokeWeight(2);
    beginShape();
    for (int i = 0; i < ps.getVertexCount(); i++) {
      Vec2 v = box2d.vectorWorldToPixels(ps.getVertex(i));
      vertex(v.x, v.y);
    }
    endShape(CLOSE);
    popMatrix();
  }
}
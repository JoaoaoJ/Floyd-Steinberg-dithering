PImage kitten;

void setup(){
  size(1024, 512);
  kitten = loadImage("cat.jpg");
  //kitten.filter(GRAY);
  image(kitten, 0, 0);
  
}

int index(int x, int y) {
  return x + y * kitten.width;
}

void draw(){
  kitten.loadPixels();
  for (int y = 0; y < kitten.height - 1; y++){
   for (int x = 0; x < kitten.width - 1; x++){
     color pix = kitten.pixels[index(x, y)];
     float oldR = red(pix);
     float oldG = green(pix);
     float oldB = blue(pix);
     int newR = round(oldR/255) * 255;
     int newG = round(oldG/255) * 255;
     int newB = round(oldB/255) * 255;
     kitten.pixels[index(x, y)] = color(newR, newG, newB);
     
     float errR = oldR - newR;
     float errG = oldG - newG;
     float errB = oldB - newB;
     
     int index = index(x + 1, y);
     color c = kitten.pixels[index];
     float r = red(c);
     float g = green(c);
     float b = blue(c);
     r = r + errR * 7 / 16;
     g = g + errG * 7 / 16;
     b = b + errB * 7 / 16;
     kitten.pixels[index] = color(r, g, b);
     
     index = index(x - 1, y + 1);
     c = kitten.pixels[index];
     r = red(c);
     g = green(c);
     b = blue(c);
     r = r + errR * 3 / 16;
     g = g + errG * 3 / 16;
     b = b + errB * 3 / 16;
     kitten.pixels[index] = color(r, g, b);
     
     index = index(x , y + 1);
     c = kitten.pixels[index];
     r = red(c);
     g = green(c);
     b = blue(c);
     r = r + errR * 5 / 16;
     g = g + errG * 5 / 16;
     b = b + errB * 5 / 16;
     kitten.pixels[index] = color(r, g, b);
     
     index = index(x + 1, y + 1);
     c = kitten.pixels[index];
     r = red(c);
     g = green(c);
     b = blue(c);
     r = r + errR * 1 / 16;
     g = g + errG * 1 / 16;
     b = b + errB * 1 / 16;
     kitten.pixels[index] = color(r, g, b);
   }
  }
  kitten.updatePixels();
  image(kitten, 512, 0);

}

KeyboardBot bot;

int amount;
String com1;
String com12;
int del1min,del1max;
String com2;
String com22;
int del2min,del2max;

void setup() {
  String[] lines = loadStrings("conf.txt");
  amount = int(lines[0]);
  com1 = lines[1];
  com12 = lines[2];
  del1min = int(lines[3].split(",")[0]);
  del1max = int(lines[3].split(",")[1]);
  com2 = lines[4];
  com22 = lines[5];
  del2min = int(lines[6].split(",")[0]);
  del2max = int(lines[6].split(",")[1]);

  bot = new KeyboardBot();
  
  delay(3000);
}

void draw() {
  for(int i = 0; i<amount;i++) {
    bot.typeStringRand(com1,3,10,30,50);
    bot.type(com12,20);
    delay((int)random(del1min,del1max));
    bot.typeStringRand(com2,3,10,30,50);
    bot.type(com22,20);
    delay((int)random(del2min,del2max));
  }
  exit();
}

void keyPressed() {
  exit();
}

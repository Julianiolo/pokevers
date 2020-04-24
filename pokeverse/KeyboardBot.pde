/*
I think this will only work with European Keyboards
*/

import java.awt.Robot;
import java.awt.event.KeyEvent;
import java.io.IOException;

class KeyboardBot {
  Robot robot;
  
  int StringRandDelayMin = 20, StringRandDelayMax = 50;
  // chars that need to be replaces because they use shift:
  private char[] htbr = {'!','"','_','$','&','/','(',')','='};
  private char[] replw = {'1','2','-','4','6','7','8','9','0'};
  
  HashMap<String,Integer> codes = new HashMap<String,Integer>();
  KeyboardBot() {
    try{
      robot = new Robot();
    }catch(Exception e){
      e.printStackTrace();
      exit();
    }
    codes.put("0",KeyEvent.VK_0);codes.put("1",KeyEvent.VK_1);codes.put("2",KeyEvent.VK_2);codes.put("3",KeyEvent.VK_3);codes.put("4",KeyEvent.VK_4);codes.put("5",KeyEvent.VK_5);codes.put("6",KeyEvent.VK_6);codes.put("7",KeyEvent.VK_7);codes.put("8",KeyEvent.VK_8);codes.put("9",KeyEvent.VK_9);
    codes.put("A",KeyEvent.VK_A);codes.put("B",KeyEvent.VK_B);codes.put("C",KeyEvent.VK_C);codes.put("D",KeyEvent.VK_D);codes.put("E",KeyEvent.VK_E);codes.put("F",KeyEvent.VK_F);codes.put("G",KeyEvent.VK_G);codes.put("H",KeyEvent.VK_H);codes.put("I",KeyEvent.VK_I);codes.put("J",KeyEvent.VK_J);codes.put("K",KeyEvent.VK_K);codes.put("L",KeyEvent.VK_L);codes.put("M",KeyEvent.VK_M);codes.put("N",KeyEvent.VK_N);codes.put("O",KeyEvent.VK_O);codes.put("P",KeyEvent.VK_P);codes.put("Q",KeyEvent.VK_Q);codes.put("R",KeyEvent.VK_R);codes.put("S",KeyEvent.VK_S);codes.put("T",KeyEvent.VK_T);codes.put("U",KeyEvent.VK_U);codes.put("V",KeyEvent.VK_V);codes.put("W",KeyEvent.VK_W);codes.put("X",KeyEvent.VK_X);codes.put("Y",KeyEvent.VK_Y);codes.put("Z",KeyEvent.VK_Z);
    codes.put("ALT",KeyEvent.VK_ALT);codes.put("\\",KeyEvent.VK_BACK_SLASH);codes.put("BACK_SPACE",KeyEvent.VK_BACK_SPACE);codes.put("CAPSLOCK",KeyEvent.VK_CAPS_LOCK);codes.put("^",KeyEvent.VK_CIRCUMFLEX);codes.put("]",KeyEvent.VK_CLOSE_BRACKET);codes.put(":",KeyEvent.VK_COLON);codes.put(",",KeyEvent.VK_COMMA);codes.put("CONTROL",KeyEvent.VK_CONTROL);codes.put("COPY",KeyEvent.VK_COPY);codes.put("CUT",KeyEvent.VK_CUT);codes.put("DELETE",KeyEvent.VK_DELETE);codes.put("END",KeyEvent.VK_END);codes.put("ENTER",KeyEvent.VK_ENTER);codes.put("=",KeyEvent.VK_EQUALS);codes.put("ESCAPE",KeyEvent.VK_ESCAPE);codes.put("€",KeyEvent.VK_EURO_SIGN);codes.put("!",KeyEvent.VK_EXCLAMATION_MARK);codes.put("F1",KeyEvent.VK_F1);codes.put("F2",KeyEvent.VK_F2);codes.put("F3",KeyEvent.VK_F3);codes.put("F4",KeyEvent.VK_F4);codes.put("F5",KeyEvent.VK_F5);codes.put("F6",KeyEvent.VK_F6);codes.put("F7",KeyEvent.VK_F7);codes.put("F8",KeyEvent.VK_F8);codes.put("F9",KeyEvent.VK_F9);codes.put("F10",KeyEvent.VK_F10);codes.put("F11",KeyEvent.VK_F11);codes.put("F12",KeyEvent.VK_F12);codes.put("FIND",KeyEvent.VK_FIND);codes.put("KP_UP",KeyEvent.VK_KP_UP);codes.put("KP_DOWN",KeyEvent.VK_KP_DOWN);codes.put("KP_LEFT",KeyEvent.VK_KP_LEFT);codes.put("KP_RIGHT",KeyEvent.VK_KP_RIGHT);codes.put("UP",KeyEvent.VK_UP);codes.put("DOWN",KeyEvent.VK_DOWN);codes.put("LEFT",KeyEvent.VK_LEFT);codes.put("RIGHT",KeyEvent.VK_RIGHT);codes.put("<",KeyEvent.VK_LESS);codes.put(">",KeyEvent.VK_GREATER);codes.put("-",KeyEvent.VK_MINUS);codes.put("NUM_LOCK",KeyEvent.VK_NUM_LOCK);codes.put("#",KeyEvent.VK_NUMBER_SIGN);codes.put("NUMPAD0",KeyEvent.VK_NUMPAD0);codes.put("NUMPAD1",KeyEvent.VK_NUMPAD1);codes.put("NUMPAD2",KeyEvent.VK_NUMPAD2);codes.put("NUMPAD3",KeyEvent.VK_NUMPAD3);codes.put("NUMPAD4",KeyEvent.VK_NUMPAD4);codes.put("NUMPAD5",KeyEvent.VK_NUMPAD5);codes.put("NUMPAD6",KeyEvent.VK_NUMPAD6);codes.put("NUMPAD7",KeyEvent.VK_NUMPAD7);codes.put("NUMPAD8",KeyEvent.VK_NUMPAD8);codes.put("NUMPAD9",KeyEvent.VK_NUMPAD9);codes.put("[",KeyEvent.VK_OPEN_BRACKET);codes.put("PAGE_UP",KeyEvent.VK_PAGE_UP);codes.put("PAGE_DOWN",KeyEvent.VK_PAGE_DOWN);codes.put("PASTE",KeyEvent.VK_PASTE);codes.put("PAUSE",KeyEvent.VK_PAUSE);codes.put(".",KeyEvent.VK_PERIOD);codes.put("+",KeyEvent.VK_PLUS);codes.put("PRINTSCREEN",KeyEvent.VK_PRINTSCREEN);codes.put("\"",KeyEvent.VK_QUOTE);codes.put(")",KeyEvent.VK_RIGHT_PARENTHESIS);codes.put(";",KeyEvent.VK_SEMICOLON);codes.put("SHIFT",KeyEvent.VK_SHIFT);codes.put("/",KeyEvent.VK_SLASH);codes.put(" ",KeyEvent.VK_SPACE);codes.put("STOP",KeyEvent.VK_STOP);codes.put("TAB",KeyEvent.VK_TAB);codes.put("_",KeyEvent.VK_UNDERSCORE);codes.put("UNDO",KeyEvent.VK_UNDO);codes.put("WINDOWS",KeyEvent.VK_WINDOWS);
    codes.put("$",KeyEvent.VK_DOLLAR);codes.put("@",KeyEvent.VK_AT);codes.put("ALT_GRAPH",KeyEvent.VK_ALT_GRAPH);codes.put("&",KeyEvent.VK_AMPERSAND);codes.put("*",KeyEvent.VK_ASTERISK);codes.put("(",KeyEvent.VK_LEFT_PARENTHESIS);
}
  
  void type(String s,int delay) {
    if(s.length() == 0) {
      return;
    }
    try{
      this.robot.keyPress(this.codes.get(s));
      this.robot.delay(delay);
      this.robot.keyRelease(this.codes.get(s));
    }catch(Exception e) {
      //e.printStackTrace();
      //exit();
      println("I dont support the key: " + s);
    }
  }
  
  void typeString(String s,int keyPressDelay, int charDelay) {
    this.typeStringRand(s,keyPressDelay,keyPressDelay,charDelay,charDelay);
  }
  
  void typeStringRand(String s,int keyPressDelayMin,int keyPressDelayMax, int charDelayMin, int charDelayMax) {
    boolean shift = false;
    for(int i = 0; i<s.length();i++) {
      char c = s.charAt(i);
      
      boolean isSpecB = isSpec(c);
      if((Character.isUpperCase(c) ||isSpecB) != shift) {
        if(shift) {
          this.robot.keyRelease(this.codes.get("SHIFT"));
        }else {
          this.robot.keyPress(this.codes.get("SHIFT"));
        }
        this.robot.delay((int)random(7,13));
        shift = Character.isUpperCase(c) || isSpecB;
      }
      
      if(isSpecB) {
        c = convertChar(c);
      }
      
      if(!isSpecB && Character.isLetter(c) && Character.isLowerCase(c)) {
        c = Character.toUpperCase(c);
      }
      int keyPressDelay;
      if(keyPressDelayMin != keyPressDelayMax) {
        keyPressDelay = (int)random(keyPressDelayMin,keyPressDelayMax);
      }else {
        keyPressDelay = keyPressDelayMin;
      }
      this.type(str(c),keyPressDelay);
      
      int charDelay;
      if(charDelayMin != charDelayMax) {
        charDelay = (int)random(charDelayMin,charDelayMax);
      }else {
        charDelay = charDelayMin;
      }
      delay(charDelay);
    }
    if(shift) {
      this.robot.keyRelease(this.codes.get("SHIFT"));
    }
  }
  
  boolean isSpec(char c) {
    for(int i = 0; i< htbr.length;i++) {
      if(htbr[i] == c) {
        return true;
      }
    }
    return false;
  }
  
  char convertChar(char c) {
    int ind = -1;
    for(int i = 0; i< htbr.length;i++) {
      if(htbr[i] == c) {
        ind = i;
        break;
      }
    }
    return replw[ind];
  }
}

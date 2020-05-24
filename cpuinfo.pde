//
// Disp cpuinfo
//

String [] items = {
  "vendor_id",
  "model name",
  "cpu MHz",
  "cache size", 
  "cpu cores" 
};

StringList lines = new StringList();
StringList strout= new StringList();  // shell output
StringList strerr= new StringList();   // shell error


void search() {
//
// exsample
// vendor_id  : GenuineIntel
// model name  : Intel(R) Core(TM)2 Duo CPU     T8100  @ 2.10GHz
// cpu MHz    : 2108.309
// cache size  : 3072 KB
// cpu cores  : 2
//

  for(String el:strout) {
    for(String item:items) {
    
      if ( el.indexOf(item)  >= 0 ) {
        println( el);
        lines.append(el);
        if ( item == "cpu cores" ) {
          return;
        }
      }
    }
  }
}

void setup() {
   size(900, 426);
   background(0);
   
   shell(strout,strerr,"cat /proc/cpuinfo"); //shell execute
   search();
}

void draw() {
  textSize(40);
  text("cpu info", 50, 40);
  textSize(22);
   for (int i = 0 ; i < lines.size(); i++) {
     String line =  lines.get(i);
     String [] word = split(line,":");
     int y =  i*40+100;
     text(word[0],10,y);
     text(word[1],150,y);
   }
}

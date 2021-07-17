int A0Pin = 0;
unsigned long currentTime;
unsigned long elapsedTime = 0;
unsigned long previousTime = 0;
int sp = 4;



void setup() {
  pinMode(A0Pin, INPUT);
  Serial1.begin(115200);
  // Serial.begin(115200);
  while (!Serial);

  //Serial1.println("Hello World - bl");
  //Serial.println("Hello World - xiao");

}

void loop() {
  int AnalogInput0 = analogRead(A0Pin);
  unsigned long currentTime = millis();
  elapsedTime = currentTime - previousTime;
  if (elapsedTime >= sp) {
      Serial1.println(AnalogInput0);
      //Serial.println(AnalogInput0);
      previousTime = millis();
    }

}

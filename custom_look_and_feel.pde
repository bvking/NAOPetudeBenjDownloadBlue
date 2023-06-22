
/*
import interfascia.*;

GUIController c;
IFButton startButton, stopButton;
IFProgressBar progress;
IFCheckBox global, nothing;

IFLookAndFeel defaultLook, redLook, greenLook;
boolean running = false;
*/
void actionPerformed (GUIEvent e) {
      translate (0, 0, -10000);
  if (e.getSource() == startButton) {
    running = true;
  } else if (e.getSource() == stopButton) {
    running = false;
  } else if (e.getSource() == global && e.getMessage().equals("Checked")) {
      startButton.setLookAndFeel(defaultLook);
      stopButton.setLookAndFeel(defaultLook);
      global.setLookAndFeel(defaultLook);
      nothing.setLookAndFeel(defaultLook);
  } else if (e.getSource() == global && e.getMessage().equals("Unchecked")) {
      startButton.setLookAndFeel(greenLook);
      stopButton.setLookAndFeel(redLook);
      global.setLookAndFeel(greenLook);
      nothing.setLookAndFeel(greenLook);
  }
}

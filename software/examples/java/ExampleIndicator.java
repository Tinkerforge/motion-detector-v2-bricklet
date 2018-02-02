import com.tinkerforge.IPConnection;
import com.tinkerforge.BrickletMotionDetectorV2;

public class ExampleIndicator {
	private static final String HOST = "localhost";
	private static final int PORT = 4223;

	// Change XYZ to the UID of your Motion Detector Bricklet 2.0
	private static final String UID = "XYZ";

	// Note: To make the example code cleaner we do not handle exceptions. Exceptions
	//       you might normally want to catch are described in the documentation
	public static void main(String args[]) throws Exception {
		IPConnection ipcon = new IPConnection(); // Create IP connection
		BrickletMotionDetectorV2 md =
		  new BrickletMotionDetectorV2(UID, ipcon); // Create device object

		ipcon.connect(HOST, PORT); // Connect to brickd
		// Don't use device before ipcon is connected

		// Turn blue backlight LEDs on (maximum brightness)
		md.setIndicator(255, 255, 255);

		System.out.println("Press key to exit"); System.in.read();
		ipcon.disconnect();
	}
}

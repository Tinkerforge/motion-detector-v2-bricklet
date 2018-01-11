import com.tinkerforge.IPConnection;
import com.tinkerforge.BrickletMotionDetectorV2;

public class ExampleCallback {
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

		// Add motion detected listener
		md.addMotionDetectedListener(new BrickletMotionDetectorV2.MotionDetectedListener() {
			public void motionDetected() {
				System.out.println("Motion Detected");
			}
		});

		// Add detection cycle ended listener
		md.addDetectionCycleEndedListener(new BrickletMotionDetectorV2.DetectionCycleEndedListener() {
			public void detectionCycleEnded() {
				System.out.println("Detection Cycle Ended (next detection possible in ~2 seconds)");
			}
		});

		System.out.println("Press key to exit"); System.in.read();
		ipcon.disconnect();
	}
}

using System;
using Tinkerforge;

class Example
{
	private static string HOST = "localhost";
	private static int PORT = 4223;
	private static string UID = "XYZ"; // Change XYZ to the UID of your Motion Detector Bricklet 2.0

	// Callback function for motion detected callback
	static void MotionDetectedCB(BrickletMotionDetectorV2 sender)
	{
		Console.WriteLine("Motion Detected");
	}

	// Callback function for detection cycle ended callback
	static void DetectionCycleEndedCB(BrickletMotionDetectorV2 sender)
	{
		Console.WriteLine("Detection Cycle Ended (next detection possible in ~2 seconds)");
	}

	static void Main()
	{
		IPConnection ipcon = new IPConnection(); // Create IP connection
		BrickletMotionDetectorV2 md =
		  new BrickletMotionDetectorV2(UID, ipcon); // Create device object

		ipcon.Connect(HOST, PORT); // Connect to brickd
		// Don't use device before ipcon is connected

		// Register motion detected callback to function MotionDetectedCB
		md.MotionDetectedCallback += MotionDetectedCB;

		// Register detection cycle ended callback to function DetectionCycleEndedCB
		md.DetectionCycleEndedCallback += DetectionCycleEndedCB;

		Console.WriteLine("Press enter to exit");
		Console.ReadLine();
		ipcon.Disconnect();
	}
}

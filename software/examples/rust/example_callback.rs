use std::{error::Error, io, thread};
use tinkerforge::{ip_connection::IpConnection, motion_detector_v2_bricklet::*};

const HOST: &str = "localhost";
const PORT: u16 = 4223;
const UID: &str = "XYZ"; // Change XYZ to the UID of your Motion Detector Bricklet 2.0.

fn main() -> Result<(), Box<dyn Error>> {
    let ipcon = IpConnection::new(); // Create IP connection.
    let md = MotionDetectorV2Bricklet::new(UID, &ipcon); // Create device object.

    ipcon.connect((HOST, PORT)).recv()??; // Connect to brickd.
                                          // Don't use device before ipcon is connected.

    // Create receiver for motion detected events.
    let motion_detected_receiver = md.get_motion_detected_receiver();

    // Spawn thread to handle received events. This thread ends when the `md` object
    // is dropped, so there is no need for manual cleanup.
    thread::spawn(move || {
        for motion_detected in motion_detected_receiver {
            println!("Motion Detected");
        }
    });

    // Create receiver for detection cycle ended events.
    let detection_cycle_ended_receiver = md.get_detection_cycle_ended_receiver();

    // Spawn thread to handle received events. This thread ends when the `md` object
    // is dropped, so there is no need for manual cleanup.
    thread::spawn(move || {
        for detection_cycle_ended in detection_cycle_ended_receiver {
            println!("Detection Cycle Ended (next detection possible in ~2 seconds)");
        }
    });

    println!("Press enter to exit.");
    let mut _input = String::new();
    io::stdin().read_line(&mut _input)?;
    ipcon.disconnect();
    Ok(())
}

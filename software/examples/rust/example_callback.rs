use std::{error::Error, io, thread};
use tinkerforge::{ipconnection::IpConnection, motion_detector_v2_bricklet::*};

const HOST: &str = "127.0.0.1";
const PORT: u16 = 4223;
const UID: &str = "XYZ"; // Change XYZ to the UID of your Motion Detector Bricklet 2.0

fn main() -> Result<(), Box<dyn Error>> {
    let ipcon = IpConnection::new(); // Create IP connection
    let motion_detector_v2_bricklet = MotionDetectorV2Bricklet::new(UID, &ipcon); // Create device object

    ipcon.connect(HOST, PORT).recv()??; // Connect to brickd
                                        // Don't use device before ipcon is connected

    //Create listener for motion detected events.
    let motion_detected_listener = motion_detector_v2_bricklet.get_motion_detected_receiver();
    // Spawn thread to handle received events. This thread ends when the motion_detector_v2_bricklet
    // is dropped, so there is no need for manual cleanup.
    thread::spawn(move || {
        for event in motion_detected_listener {
            println!("Motion Detected");
        }
    });

    //Create listener for detection cycle ended events.
    let detection_cycle_ended_listener = motion_detector_v2_bricklet.get_detection_cycle_ended_receiver();
    // Spawn thread to handle received events. This thread ends when the motion_detector_v2_bricklet
    // is dropped, so there is no need for manual cleanup.
    thread::spawn(move || {
        for event in detection_cycle_ended_listener {
            println!("Detection Cycle Ended (next detection possible in ~2 seconds)");
        }
    });

    println!("Press enter to exit.");
    let mut _input = String::new();
    io::stdin().read_line(&mut _input)?;
    ipcon.disconnect();
    Ok(())
}

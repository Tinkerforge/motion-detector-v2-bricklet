function octave_example_callback()
    more off;

    HOST = "localhost";
    PORT = 4223;
    UID = "XYZ"; % Change XYZ to the UID of your Motion Detector Bricklet 2.0

    ipcon = javaObject("com.tinkerforge.IPConnection"); % Create IP connection
    md = javaObject("com.tinkerforge.BrickletMotionDetectorV2", UID, ipcon); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don't use device before ipcon is connected

    % Register motion detected callback to function cb_motion_detected
    md.addMotionDetectedCallback(@cb_motion_detected);

    % Register detection cycle ended callback to function cb_detection_cycle_ended
    md.addDetectionCycleEndedCallback(@cb_detection_cycle_ended);

    input("Press key to exit\n", "s");
    ipcon.disconnect();
end

% Callback function for motion detected callback
function cb_motion_detected(e)
    fprintf("Motion Detected\n");
end

% Callback function for detection cycle ended callback
function cb_detection_cycle_ended(e)
    fprintf("Detection Cycle Ended (next detection possible in ~2 seconds)\n");
end

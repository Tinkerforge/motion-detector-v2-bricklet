function octave_example_indicator()
    more off;

    HOST = "localhost";
    PORT = 4223;
    UID = "XYZ"; % Change XYZ to the UID of your Motion Detector Bricklet 2.0

    ipcon = javaObject("com.tinkerforge.IPConnection"); % Create IP connection
    md = javaObject("com.tinkerforge.BrickletMotionDetectorV2", UID, ipcon); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don't use device before ipcon is connected

    % Turn blue backlight LEDs on (maximum brightness)
    md.setIndicator(255, 255, 255);

    input("Press key to exit\n", "s");
    ipcon.disconnect();
end

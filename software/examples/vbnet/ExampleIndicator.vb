Imports System
Imports Tinkerforge

Module ExampleIndicator
    Const HOST As String = "localhost"
    Const PORT As Integer = 4223
    Const UID As String = "XYZ" ' Change XYZ to the UID of your Motion Detector Bricklet 2.0

    Sub Main()
        Dim ipcon As New IPConnection() ' Create IP connection
        Dim md As New BrickletMotionDetectorV2(UID, ipcon) ' Create device object

        ipcon.Connect(HOST, PORT) ' Connect to brickd
        ' Don't use device before ipcon is connected

        ' Turn blue backlight LEDs on (maximum brightness)
        md.SetIndicator(255, 255, 255)

        Console.WriteLine("Press key to exit")
        Console.ReadLine()
        ipcon.Disconnect()
    End Sub
End Module

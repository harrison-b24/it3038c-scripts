# Load synthesizer and create synthesizer object
[System.Reflection.Assembly]::LoadWithPartialName("System.Speech")
$synthesizer = New-Object System.Speech.Synthesis.SpeechSynthesizer

# Change this text to be whatever you want the synth to say
$textToSpeak = "REPLACE THIS TEXT"

# Speak the text
$synthesizer.Speak($textToSpeak)
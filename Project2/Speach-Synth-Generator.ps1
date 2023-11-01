# Load synthesizer and create synthesizer object
[System.Reflection.Assembly]::LoadWithPartialName("System.Speech")
$synthesizer = New-Object System.Speech.Synthesis.SpeechSynthesizer

try {
    # Change the rate of speach (optional)
    $synthesizer.Rate = 0  # Adjust the rate of speech (default is 0, higher numbers are faster)

    # Change this text to be whatever you want the synth to say
    $textToSpeak = "REPLACE THIS TEXT"

    # Speak the text
    $synthesizer.Speak($textToSpeak)

    # Ask the user if they want to save the audio file
    $saveAudio = Read-Host "Do you want to save the audio as a WAV file? (Y/N)"
    
    if ($saveAudio -eq "Y" -or $saveAudio -eq "y") {
    # Set the path to where you want the .wav file saved below this line
    #YOU MUST CHANGE THIS PATH FOR THE SCRIPT TO SAVE PROPERLY
        $outputFile = "C:\Users\USERNAME\Music\output.wav"
        $synthesizer.SetOutputToWaveFile($outputFile)
        $synthesizer.Speak($textToSpeak)
        $synthesizer.SetOutputToDefaultAudioDevice() # Reset output to default
        Write-Host "Speech synthesis and audio saving completed successfully."
    }
    else {
        Write-Host "Audio file not saved."
    }
}
catch {
    Write-Host "An error occurred: $($_.Exception.Message)"
}

# Voice Recorder and Player Documentation

This project is a simple Flutter application that allows users to record audio and play it back. The application uses the `record` package for recording audio and the `audioplayers` package for playing the recorded audio.

## Files

### `main.dart`

This is the main entry point of the application. It contains the UI and logic for recording audio and managing the audio player.

#### Key Components

- **MainApp**: The main widget of the application. It manages the state of the recording and playback.
- **_MainAppState**: The state class for `MainApp`. It handles the recording logic, playback logic, and UI updates.
- **AudioRecorder**: An instance of the `AudioRecorder` class from the `record` package, used to record audio.
- **AudioPlayer**: An instance of the `AudioPlayer` class from the `audioplayers` package, used to play recorded audio.
- **recordStarted**: A boolean flag to indicate if recording has started.
- **hasRecord**: A boolean flag to indicate if a recording exists.
- **path**: The directory path where the recorded audio files are stored.
- **fileName**: The name of the recorded audio file.

#### Methods

- **_getPath()**: Retrieves the application's documents directory path where the audio files will be stored.
- **_startRecording()**: Starts recording audio. It checks for recording permissions and starts recording to a file.
- **_stopRecording()**: Stops the recording and plays back the recorded audio.
- **_cancelRecording()**: Cancels the recording and removes the recorded file.
- **_playRecord(String path)**: Plays the recorded audio from the specified file path.
- **dispose()**: Disposes of the `AudioRecorder` and `AudioPlayer` instances to free up resources.

#### UI Components

- **Scaffold**: The main UI structure of the application.
- **AppBar**: Displays the title of the application.
- **Column**: Arranges the UI elements vertically.
- **ElevatedButton**: Buttons for starting, stopping, and canceling recordings.
- **PlayerWidget**: A custom widget that displays the audio player controls.

### `player.dart`

This file contains the `PlayerWidget` class, which is responsible for displaying the audio player controls and managing the playback state.

## Dependencies

- `path_provider`: Provides access to the device's file system.
- `audioplayers`: Used for playing audio files.
- `record`: Used for recording audio.

## Output

https://github.com/user-attachments/assets/347edd08-24c7-418e-a25b-60f18c84c3c1
# OBS Studio Configuration Guide

## Scene Setup for YouTube AI Education

### Recommended Scenes

1. **Main Teaching Scene**
   - Sources:
     - Display Capture (primary monitor)
     - Video Capture Device (webcam) - positioned bottom-right, 20-25% size
     - Audio Input Capture (microphone)
     - Audio Output Capture (desktop audio via BlackHole)

2. **Full Screen Demo**
   - Sources:
     - Display Capture (full screen)
     - Audio Input Capture (microphone)
     - Audio Output Capture (desktop audio)

3. **Code Editor Focus**
   - Sources:
     - Window Capture (VS Code)
     - Video Capture Device (webcam) - smaller, 15% size
     - Audio Input Capture (microphone)

4. **Terminal/Command Line**
   - Sources:
     - Window Capture (Ghostty/Terminal)
     - Audio Input Capture (microphone)
     - Text overlay with current directory/command

### Audio Configuration

1. **Microphone Setup**
   - Add Audio Input Capture
   - Select your USB microphone
   - Set gain to -10dB to start
   - Enable noise suppression filter

2. **Desktop Audio**
   - Add Audio Output Capture
   - Select BlackHole 2ch
   - This captures system sounds and AI tool outputs

3. **Audio Filters** (Right-click audio source > Filters)
   - Noise Suppression (RNNoise)
   - Compressor (3:1 ratio, -18dB threshold)
   - Limiter (-6dB threshold)

### Video Settings

**Output Settings:**
- Recording Format: MP4
- Encoder: Hardware (Apple VT H264)
- Recording Quality: High Quality, Medium File Size
- Recording Path: ~/Documents/YouTube/Recordings

**Video Settings:**
- Base Resolution: 1920x1080
- Output Resolution: 1920x1080
- FPS: 30

### Hotkeys

Configure these for efficient recording:
- Start Recording: Cmd+Shift+R
- Stop Recording: Cmd+Shift+S
- Push to Talk: Hold Spacebar (if needed)

### Tips for YouTube Content

1. **Before Recording:**
   - Close unnecessary applications
   - Set display to 1920x1080 for consistency
   - Check audio levels (aim for -12dB to -6dB)

2. **During Recording:**
   - Use KeyCastr to show keyboard shortcuts
   - Keep mouse movements deliberate and smooth
   - Pause between major sections for easier editing

3. **Scene Transitions:**
   - Use simple cuts (no fancy transitions)
   - Add 1-2 second delays when switching scenes

## Exporting Scene Collection

1. Go to Scene Collection menu
2. Select "Export"
3. Save as `yt-education-scenes.json`
4. This file can be imported on any new setup

## Troubleshooting

- **No desktop audio?** Check BlackHole is selected in Audio MIDI Setup
- **Webcam not showing?** Quit other apps using camera (Zoom, etc.)
- **Performance issues?** Lower output resolution to 720p temporarily

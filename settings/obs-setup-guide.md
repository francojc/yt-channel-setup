# OBS Studio Configuration Guide

## Quick Start with Pre-Configured Templates

**🚀 New Setup (Recommended):** Use the pre-configured YouTube Beginner templates for instant setup:

```bash
./scripts/setup-obs-templates.sh
```

This installs 4 ready-to-use scenes optimized for YouTube content creation. See `settings/obs/README.md` for detailed setup instructions.

---

## Pre-Configured Scenes (YouTube Beginner Template)

### Essential Scenes (Ready to Use)

1. **Screen + Webcam** ⭐ *Most Popular*
   - Full screen capture with webcam overlay (bottom-right corner)
   - Perfect for tutorials, coding, presentations with personal touch
   - Professional picture-in-picture layout

2. **Screen Recording**
   - Full screen capture without webcam
   - Ideal for technical demonstrations, coding tutorials
   - Clean, distraction-free content

3. **Webcam Only**
   - Full-screen webcam view
   - Perfect for vlogs, commentary, talking head videos
   - Professional presentation style

4. **Starting Soon**
   - Simple text overlay for stream preparation
   - Introduces streaming concepts gently
   - Customizable for future growth

### Manual Scene Setup (Advanced)

If you prefer custom configuration:

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

**Video Settings (Pre-configured in template):**

- Base Resolution: 1920x1080
- Output Resolution: 1920x1080
- FPS: 30
- Encoder: Hardware-accelerated (NVENC/QuickSync when available)
- Bitrate: 6000 kbps (high quality for local recording)

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
   - Add 1-2 second delays when switching scenes

## Template Management

### Using Pre-Configured Templates

The YouTube Beginner templates are automatically installed during setup. To manually install:

1. **Scene Collection Import:**
   - Scene Collection → Import
   - Select `settings/obs/YouTube-Beginner-Scenes.json`

2. **Profile Import:**
   - Profile → Import  
   - Select `settings/obs/YouTube-Beginner-Profile.ini`

### Creating Custom Templates

To export your own customized scenes:

1. Go to Scene Collection menu
2. Select "Export"
3. Save as `custom-scenes.json`
4. This file can be imported on any new setup

### Backing Up Settings

Your OBS settings are stored in:

- **macOS:** `~/Library/Application Support/obs-studio/`
- **Scenes:** `basic/scenes/`
- **Profiles:** `basic/profiles/`

## Troubleshooting

### Template Issues

- **Templates not loading?** Restart OBS after installation
- **Scenes appear empty?** Configure your webcam and microphone devices
- **Missing sources?** Grant screen recording permissions in System Preferences

### Common Problems

- **No desktop audio?** Check BlackHole is selected in Audio MIDI Setup
- **Webcam not showing?** Quit other apps using camera (Zoom, etc.)
- **Performance issues?** Lower output resolution to 720p temporarily
- **Black screen capture?** Grant OBS screen recording permissions
- **Large file sizes?** Normal for high quality - YouTube compresses uploads

### Quick Fixes

1. **Reset to defaults:** Re-run `./scripts/setup-obs-templates.sh`
2. **Device configuration:** Check Properties for each source
3. **Permissions:** System Preferences → Security & Privacy → Screen Recording
4. **Performance:** Close unnecessary apps, check Activity Monitor

### Getting Help

- **Template guide:** `settings/obs/README.md`
- **Advanced setup:** Continue reading this guide
- **OBS documentation:** https://obsproject.com/wiki/
- **YouTube Creator Academy:** https://creatoracademy.youtube.com/

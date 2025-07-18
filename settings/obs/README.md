# OBS Studio Setup for YouTube Beginners

This directory contains pre-configured OBS templates designed for YouTube content creators who want to start recording immediately without complex setup.

## Quick Start

### Automatic Setup (Recommended)
Run the setup script to automatically install templates:
```bash
./scripts/setup-obs-templates.sh
```

### Manual Setup
1. Open OBS Studio
2. Go to **Scene Collection** → **Import**
3. Select `YouTube-Beginner-Scenes.json`
4. Go to **Profile** → **Import**
5. Select `YouTube-Beginner-Profile.ini`
6. Restart OBS Studio

## What's Included

### 🎬 4 Pre-Configured Scenes

1. **Screen Recording**
   - Full screen capture
   - Perfect for tutorials, coding, presentations
   - No webcam overlay

2. **Webcam Only**
   - Full-screen webcam
   - Ideal for vlogs, commentary, talking head videos
   - Clean, professional look

3. **Screen + Webcam** ⭐ *Most Popular*
   - Screen capture with webcam overlay (bottom-right corner)
   - Perfect for educational content, coding tutorials
   - Professional picture-in-picture layout

4. **Starting Soon**
   - Simple text overlay for stream introductions
   - Introduces streaming concepts gently
   - Customizable text and styling

### ⚙️ Optimized Settings Profile

- **Resolution:** 1080p (1920x1080)
- **Frame Rate:** 30 FPS (smooth, widely compatible)
- **Encoder:** Hardware-accelerated (NVENC for NVIDIA, fallback to x264)
- **Bitrate:** 6000 kbps (high quality for local recording)
- **Audio:** 128 kbps AAC (crystal clear audio)
- **Format:** MP4 (universal compatibility)

## First Time Setup

### 1. Device Configuration
After importing templates, you'll need to link your devices:

**Webcam:**
1. Select "Webcam" source
2. Properties → Device → Choose your camera
3. Set resolution to 1920x1080 if available

**Microphone:**
1. Select "Microphone" source  
2. Properties → Device → Choose your microphone
3. Test audio levels (green = good, yellow = loud, red = too loud)

### 2. Screen Capture Setup (macOS)
1. Grant OBS screen recording permissions:
   - System Preferences → Security & Privacy → Privacy → Screen Recording
   - Check the box next to OBS Studio
2. Test screen capture in "Screen Recording" scene

## Recording Tips

### Quick Recording Workflow
1. Choose appropriate scene for your content
2. Check audio levels (speak normally, aim for green bars)
3. Click **Start Recording**
4. Create your content
5. Click **Stop Recording**
6. Files saved to: `~/Movies/OBS Recordings/`

### Quality vs File Size
Current settings prioritize quality for YouTube uploads. Files will be larger but look professional. For shorter recordings or limited storage:
- Lower bitrate to 3000-4000 kbps in Settings → Output → Recording

## Troubleshooting

### Common Issues

**Black Screen Capture (macOS):**
- Grant screen recording permissions (see setup above)
- Try switching to "Window Capture" for specific apps

**No Audio:**
- Check microphone device selection
- Verify microphone permissions in System Preferences
- Test with different audio input in OBS Settings

**Large File Sizes:**
- Normal for high quality settings
- Consider external storage for recordings
- YouTube compresses uploads anyway

**Performance Issues:**
- Close unnecessary applications
- Lower bitrate or resolution if needed
- Use hardware encoding when available

### Getting Help
- Check the main setup guide: `settings/obs-setup-guide.md`
- OBS Studio documentation: https://obsproject.com/wiki/
- YouTube Creator Academy: https://creatoracademy.youtube.com/

## Customization

### Expanding Your Setup
Once comfortable with basics:
- Add custom transitions between scenes
- Explore filters (noise suppression, color correction)
- Create additional scenes for specific content types
- Add overlays, alerts, and branding elements

### Scene Duplication
To create variations:
1. Right-click any scene → Duplicate
2. Rename to describe your variation
3. Modify sources and layout as needed

This template provides a solid foundation that grows with your content creation skills!

## Technical Specifications

- **Compatibility:** OBS Studio 28.0+, macOS 10.15+
- **Hardware Requirements:** 
  - 8GB RAM minimum (16GB recommended)
  - Modern GPU with hardware encoding support
  - 1GB free storage for recordings (varies by length)
- **Tested Configurations:**
  - Intel Macs with QuickSync
  - Apple Silicon Macs (M1/M2)
  - NVIDIA GPUs with NVENC
  - AMD GPUs (software encoding fallback)
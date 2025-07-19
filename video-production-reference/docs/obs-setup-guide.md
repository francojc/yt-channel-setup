# OBS Studio Setup Guide for YouTube Content

## Overview

This guide provides comprehensive setup instructions for OBS Studio optimized for YouTube content creation. These configurations were part of the original setup but are now provided as reference for host machine setup.

## Installation

```bash
# Install OBS Studio via Homebrew
brew install --cask obs

# Or download directly from: https://obsproject.com/
```

## Profile Configuration

### Video Settings
- **Base Resolution**: 1920x1080 (1080p)
- **Output Resolution**: 1920x1080 (1080p)
- **Frame Rate**: 30 FPS (smooth for most content)

### Output Settings
- **Recording Format**: MP4
- **Encoder**: x264 (software encoding, compatible with most systems)
- **Bitrate**: 6000 kbps (high quality for local recording)
- **Rate Control**: CBR (Constant Bitrate)

### Audio Settings
- **Sample Rate**: 44.1 kHz
- **Channels**: Stereo
- **Audio Bitrate**: 160 kbps

## Scene Templates

### 1. Screen Recording
Perfect for software tutorials and demonstrations:
- Full screen capture
- Cursor capture enabled
- Clean, distraction-free recording

### 2. Webcam Only
Ideal for talking head videos and introductions:
- High-quality webcam feed (1080p30)
- Centered composition
- Clean background recommended

### 3. Screen + Webcam
Best for educational content with personal touch:
- Full screen capture as main source
- Webcam overlay in corner (typically bottom-right)
- 640x480 webcam resolution to maintain screen readability

### 4. Starting Soon
Pre-stream waiting screen:
- Simple text overlay
- Professional appearance
- Can be customized with branding

## Hardware Recommendations

### Webcam
- **Built-in MacBook camera**: Adequate for basic use
- **iPhone with Camo Studio**: Excellent quality upgrade
- **Dedicated webcam**: Logitech C920 or newer

### Audio
- **Built-in microphone**: Usable but not ideal
- **External USB microphone**: Audio-Technica ATR2100x-USB
- **Wireless lavalier**: For mobile recording scenarios

### Audio Routing (Advanced)
- **BlackHole**: Virtual audio driver for system audio capture
- **Loopback**: Professional audio routing for complex setups

## Quick Setup Steps

1. **Install OBS Studio** using the Brewfile reference
2. **Import profile** from `config/obs-profile.ini`
3. **Import scenes** from `config/obs-scenes.json`
4. **Configure audio devices** in OBS settings
5. **Test recording** with each scene template
6. **Adjust settings** based on your hardware capabilities

## Optimization Tips

### Performance
- Use hardware encoding if available (macOS: VideoToolbox)
- Lower output resolution if experiencing lag
- Close unnecessary applications during recording

### Quality
- Ensure adequate lighting for webcam
- Use headphones to prevent audio feedback
- Test audio levels before recording

### Workflow
- Create custom scenes for specific content types
- Use hotkeys for quick scene switching
- Set up automatic recording file naming

## Troubleshooting

### Common Issues
- **Black screen**: Check display capture permissions in macOS Security settings
- **No audio**: Verify audio input/output device selection
- **Lag during recording**: Reduce output resolution or use hardware encoding
- **Large file sizes**: Adjust bitrate or change encoder settings

### macOS Specific
- Grant screen recording permissions in System Preferences > Security & Privacy
- Enable camera access for OBS in Privacy settings
- Disable automatic graphics switching for consistent performance

## Integration with Other Tools

### Audio Enhancement
- **Audacity**: Post-processing audio cleanup
- **BlackHole + Loopback**: Real-time audio routing and mixing

### Video Editing
- **DaVinci Resolve**: Professional color correction and editing
- **HandBrake**: Video compression and format conversion
- **Final Cut Pro**: macOS native professional editing

## Best Practices

1. **Always test before important recordings**
2. **Monitor audio levels throughout recording**
3. **Keep OBS updated for bug fixes and features**
4. **Backup your scene configurations**
5. **Use consistent naming for recordings**
6. **Consider dual-monitor setup for easier monitoring**

## File Organization

Recommended directory structure for recordings:
```
~/Videos/
├── OBS Recordings/
│   ├── Raw/
│   ├── Edited/
│   └── Published/
└── Assets/
    ├── Overlays/
    ├── Audio/
    └── Graphics/
```

## Additional Resources

- [OBS Studio Documentation](https://obsproject.com/help)
- [YouTube Creator Academy](https://creatoracademy.youtube.com/)
- [OBS Forums](https://obsproject.com/forum/)
- [r/obs subreddit](https://reddit.com/r/obs)

---

*Note: This guide assumes OBS Studio version 28.0 or newer. Some features may vary between versions.*
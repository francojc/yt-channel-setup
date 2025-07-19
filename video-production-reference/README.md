# Video Production Reference

This directory contains reference materials, configurations, and documentation for setting up video production tools on the **host machine**. These components were removed from the main development environment setup to keep VMs lightweight and focused on development work.

## ⚠️ Important Notice

**DO NOT use these materials in virtual machines.** This reference is intended for:
- Setting up video production on the host macOS machine
- Understanding what was removed from the main setup
- Reference for content creators who want full production capabilities

## Directory Structure

```
video-production-reference/
├── README.md                          # This file
├── Brewfile-video-production          # Homebrew bundle for video tools
├── config/                            # Configuration files
│   ├── obs-scenes.json                # OBS scene templates
│   └── obs-profile.ini                # OBS profile settings
├── docs/                              # Documentation
│   ├── obs-setup-guide.md             # Complete OBS configuration guide
│   └── audio-routing-guide.md         # Audio routing with BlackHole/Loopback
└── scripts/                           # Setup scripts
    └── setup-video-production.sh      # Host machine video production setup
```

## What's Included

### Video Production Tools

- **OBS Studio**: Screen recording and live streaming
- **Audacity**: Audio editing and recording
- **HandBrake**: Video compression and conversion
- **DaVinci Resolve**: Professional video editing (optional)

### Audio Tools

- **BlackHole**: Virtual audio driver for audio routing
- **Loopback**: Advanced audio routing and mixing
- **KeyCastr**: Display keyboard shortcuts on screen
- **Camo Studio**: Use iPhone as high-quality webcam

### Configuration Templates

- **OBS Scenes**: Pre-configured scene templates for YouTube
  - Screen Recording
  - Webcam Only
  - Screen + Webcam
  - Starting Soon
- **OBS Profile**: Optimized settings for 1080p30 recording
- **Audio Routing**: Professional audio mixing setups

## Quick Start (Host Machine Only)

1. **Review the documentation** in `docs/` to understand the tools
2. **Install video production tools**:
   ```bash
   cd video-production-reference
   brew bundle --file=Brewfile-video-production
   ```
3. **Run the setup script** (optional):
   ```bash
   ./scripts/setup-video-production.sh
   ```
4. **Import OBS configurations** from `config/`
5. **Follow guides** in `docs/` for detailed setup

## Documentation

### Essential Reading
- **[OBS Setup Guide](docs/obs-setup-guide.md)**: Complete OBS Studio configuration
- **[Audio Routing Guide](docs/audio-routing-guide.md)**: Professional audio setup

### Configuration Files

- **obs-scenes.json**: Ready-to-import scene collection
- **obs-profile.ini**: Optimized recording profile
- **Brewfile-video-production**: All required applications

## Why These Were Removed

The main development environment setup was refocused to provide a clean, lightweight environment for:
- Development work in VMs
- Basic content creation without production overhead
- Faster setup and reduced resource usage

Video production tools require:

- Significant disk space and system resources
- Host-level hardware access (cameras, audio interfaces)
- Professional-grade processing power
- Complex audio routing capabilities

## Recommended Workflow

### For Content Creation

1. **Development work**: Use the main setup in VMs for clean environments
2. **Video production**: Use these tools on the host machine for recording
3. **Content planning**: Develop and test in VMs, record on host

### Host vs VM Usage

- **Host Machine**: Video recording, audio production, final editing
- **Virtual Machine**: Development demos, testing, clean environments

## Alternative Approaches

### Minimal Video Setup

If you need basic recording in VMs, consider:
- Built-in macOS screen recording (Cmd+Shift+5)
- QuickTime Player for simple recordings
- Basic audio recording with built-in microphone

### Cloud-Based Solutions

- **Loom**: Browser-based screen recording
- **Riverside.fm**: Remote interview recording
- **ScreenFlow**: Lighter alternative to OBS for simple recordings

## Technical Considerations

### System Requirements

- **macOS 10.15+** for full compatibility
- **16GB+ RAM** recommended for video production
- **Dedicated graphics** preferred for hardware encoding
- **Fast storage** (SSD) for 4K recording workflows

### Performance Tips

- Use hardware encoding when available
- Record to fast local storage, backup to cloud
- Monitor system resources during recording
- Consider external audio interfaces for professional setups

## Support and Resources

### Official Documentation

- [OBS Studio Documentation](https://obsproject.com/help)
- [Audacity Manual](https://manual.audacityteam.org/)
- [HandBrake Documentation](https://handbrake.fr/docs/)

### Community Resources

- [OBS Forums](https://obsproject.com/forum/)
- [r/obs Subreddit](https://reddit.com/r/obs)
- [YouTube Creator Academy](https://creatoracademy.youtube.com/)

### Getting Help

For issues with this reference setup:

1. Check the documentation in `docs/`
2. Review official tool documentation
3. Search community forums
4. Consider the simplified alternatives above

---

**Remember**: This is reference material for host machine setup. Use the main repository setup for development environments in VMs.

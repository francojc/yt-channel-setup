# Audio Routing Guide for Video Production

## Overview

This guide covers advanced audio routing setup using BlackHole and Loopback for professional video production on macOS. These tools enable complex audio workflows including system audio capture, multi-source mixing, and real-time monitoring.

## Required Tools

- **BlackHole 2ch**: Virtual audio driver (free)
- **Loopback**: Professional audio routing (paid, ~$99)
- **OBS Studio**: For recording/streaming with audio

## BlackHole Setup (Basic Audio Routing)

### Installation
```bash
brew install --cask blackhole-2ch
```

### Basic Configuration
1. **Install BlackHole** and restart your Mac
2. **Open Audio MIDI Setup** (Applications > Utilities)
3. **Create Multi-Output Device**:
   - Click the "+" button and select "Create Multi-Output Device"
   - Check both "Built-in Output" and "BlackHole 2ch"
   - Name it "BlackHole + Speakers"

### OBS Integration
1. **In OBS Studio**:
   - Go to Settings > Audio
   - Set Desktop Audio Device to "BlackHole 2ch"
   - Set Mic/Auxiliary Audio Device to your microphone

2. **System Audio Capture**:
   - Set Mac system output to "BlackHole + Speakers"
   - You'll hear audio through speakers AND OBS will capture it

## Loopback Setup (Advanced Audio Routing)

### Use Cases
- **Multi-source mixing**: Combine microphone, system audio, and app-specific audio
- **Real-time monitoring**: Monitor mixed audio while recording
- **Selective audio capture**: Choose specific applications to include/exclude
- **Audio processing**: Apply real-time effects and filters

### Basic Loopback Configuration

#### 1. Simple Screen Recording Setup
```
Sources:
├── Microphone (Built-in or External)
├── System Audio (excluding OBS)
└── Browser Audio (Chrome/Safari)

Output to: OBS Virtual Audio
```

#### 2. Interview/Podcast Setup
```
Sources:
├── Local Microphone
├── Remote Audio (Zoom/Skype)
├── Background Music (optional)
└── Sound Effects (optional)

Outputs:
├── To OBS (for recording)
└── To Headphones (for monitoring)
```

#### 3. Live Streaming Setup
```
Sources:
├── Microphone
├── Game/App Audio
├── Alert Sounds
└── Background Music

Processing:
├── Noise Gate (microphone)
├── Compressor (overall mix)
└── EQ (frequency adjustment)

Outputs:
├── To OBS (for streaming)
└── To Monitors (for self-monitoring)
```

### Configuration Steps

1. **Create New Virtual Device**:
   - Open Loopback
   - Click "New Virtual Device"
   - Name it descriptively (e.g., "OBS Input Mix")

2. **Add Audio Sources**:
   - Drag applications from the Sources list
   - Add "Microphone" for voice input
   - Add specific apps or "System Audio" for computer sounds

3. **Configure Monitoring**:
   - Set "Pass-Thru" to your headphones/speakers
   - Adjust individual source volumes
   - Enable/disable sources as needed

4. **Connect to OBS**:
   - In OBS Settings > Audio
   - Set Desktop Audio to your Loopback virtual device
   - Set Mic/Auxiliary to "Disabled" (since mic is in Loopback)

## Common Routing Scenarios

### Scenario 1: Tutorial Recording
**Goal**: Record screen with system audio + clear narration

**Setup**:
- BlackHole captures system audio
- Dedicated mic input to OBS
- Monitor mix through headphones

**Configuration**:
```
OBS Audio Sources:
├── Desktop Audio: BlackHole 2ch
└── Mic/Aux: Your Microphone

System Output: BlackHole + Speakers
```

### Scenario 2: Live Streaming with Chat
**Goal**: Stream game audio + mic + read chat donations aloud

**Loopback Setup**:
```
Virtual Device: "Stream Mix"
Sources:
├── Game Audio (specific game app)
├── Microphone
├── Browser Audio (for donations/TTS)
└── Background Music (low volume)

Pass-Thru: Headphones (for monitoring)
```

**OBS Setup**:
```
Desktop Audio: Stream Mix (Loopback)
Mic/Aux: Disabled
```

### Scenario 3: Podcast Recording
**Goal**: Record local mic + remote guest audio separately

**Loopback Setup 1** - "Guest Audio":
```
Sources:
└── Zoom/Skype Audio

Output: OBS Track 2
```

**Loopback Setup 2** - "Host Audio":
```
Sources:
└── Local Microphone

Output: OBS Track 1
```

**OBS Setup**:
```
Audio Track 1: Host Audio (Loopback)
Audio Track 2: Guest Audio (Loopback)
Record to separate tracks for post-production
```

## Troubleshooting

### Common Issues

1. **No Audio in Recording**:
   - Check OBS audio source settings
   - Verify Loopback virtual device is created
   - Ensure macOS audio permissions are granted

2. **Audio Feedback/Echo**:
   - Use headphones instead of speakers
   - Check for duplicate audio routing
   - Disable system output monitoring in OBS

3. **Delayed Audio**:
   - Reduce buffer sizes in Audio MIDI Setup
   - Close unnecessary applications
   - Check sample rate matching (44.1kHz recommended)

4. **Missing Application Audio**:
   - Restart the application after creating Loopback device
   - Check application audio settings
   - Some apps may need specific audio device selection

### macOS Permissions

Ensure these permissions are granted:
- **Microphone access**: System Preferences > Security & Privacy > Microphone
- **Screen recording**: System Preferences > Security & Privacy > Screen Recording
- **Audio input**: Required for both OBS and Loopback

## Performance Tips

1. **Sample Rate Consistency**:
   - Use 44.1kHz across all devices
   - Avoid sample rate conversion when possible

2. **Buffer Size Optimization**:
   - Smaller buffers = lower latency, higher CPU usage
   - Start with 256 samples, adjust based on performance

3. **CPU Usage**:
   - Monitor CPU usage during recording/streaming
   - Close unnecessary audio applications
   - Consider hardware audio interfaces for complex setups

## Advanced Techniques

### Multi-Track Recording
Record different audio sources to separate tracks for post-production:
- Track 1: Microphone
- Track 2: System/Game audio  
- Track 3: Music/SFX
- Track 4: Guest/Remote audio

### Real-Time Audio Processing
Apply effects in Loopback before recording:
- **Noise Gate**: Reduce background noise
- **Compressor**: Even out volume levels
- **EQ**: Enhance voice frequencies
- **Limiter**: Prevent audio clipping

### Backup Recording
Always have a backup recording method:
- Record raw microphone to separate application
- Use QuickTime for backup screen recording
- Consider hardware recording solutions for critical content

## Recommended Workflows

### For Beginners
1. Start with BlackHole for basic system audio capture
2. Use simple OBS audio setup
3. Gradually add complexity as needed

### For Advanced Users
1. Design Loopback routing before recording
2. Test audio levels and monitoring
3. Create presets for different content types
4. Document your setups for consistency

---

*Note: Audio routing can be complex. Always test your setup before important recordings and maintain backup recording methods.*
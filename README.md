# SysMon

Real-time system monitoring with live graphs for CPU, Disk I/O, and Network activity.

## Features

### Live Monitoring Graphs

SysMon displays three dynamic, real-time graphs that update continuously:

- **CPU Usage** - Shows CPU utilization as a percentage (0-100%)
- **Disk I/O** - Displays read and write rates in bytes per second with automatic scaling (B/s, KB/s, MB/s, GB/s)
- **Network Activity** - Shows upload and download rates in bits per second with automatic scaling (bps, Kbps, Mbps, Gbps)

### Visual Scale Change Indicators

When Disk I/O or Network activity crosses magnitude boundaries, the graph background flashes to alert you:
- **Disk I/O**: Light red flash when scaling between KB/s ↔ MB/s ↔ GB/s
- **Network**: Light blue flash when scaling between Kbps ↔ Mbps ↔ Gbps

This provides an immediate visual cue when system activity spikes or drops significantly.

### Data Smoothing

Configurable moving average smoothing eliminates noise and makes trends easier to read:
- Default 5-point smoothing window
- Adjustable via command-line option (1-20)
- Balances responsiveness with readability

### Smooth Scrolling

Graphs scroll continuously and smoothly (no jerky updates):
- Display updates 20 times per second
- Data sampled once per second
- Shows last 60 seconds of activity by default

### Process Drill-Down

**Double-click** on any graph to see the top 10 processes for that metric:

- **CPU Graph** → Top 10 processes by CPU percentage
- **Disk I/O Graph** → Top 10 processes by disk read/write rates (KB/s)
- **Network Graph** → Top 10 processes by active connection count

Process details appear in a compact popup window positioned in the upper-left corner.

### Persistent Window Geometry

SysMon remembers your window size and position between sessions, automatically restoring your preferred layout.

### Human-Readable Labels

All measurements use intuitive, compact formatting:
- Y-axis labels show integers with appropriate units (e.g., "5MB/s", "15Mbps")
- Automatic unit scaling keeps labels readable
- Smaller fonts maximize data density

## Usage

### Basic

```bash
python sysmon.py
```

### With Options

```bash
# Light smoothing (more responsive)
python sysmon.py -s 3

# Heavy smoothing (smoother curves)
python sysmon.py -s 10

# Show more data points
python sysmon.py -p 120

# Combine options
python sysmon.py -s 8 -p 90
```

### Help

```bash
python sysmon.py -h
```

## Command-Line Options

- `-s, --smooth-window N` - Smoothing window size (default: 5, range: 1-20)
  - Lower values = more responsive, more detail
  - Higher values = smoother curves, less noise

- `-p, --max-points N` - Maximum data points to display (default: 60)
  - Controls how much history is shown (seconds of data)

## Requirements

- Python 3.7+
- psutil
- matplotlib
- numpy

Install dependencies:
```bash
pip install psutil matplotlib numpy
```

## Controls

- **Double-click** on any graph to view top processes for that metric
- **Close window** to exit
- **Resize window** - Position and size are saved automatically

## Platform Support

SysMon works on Windows, Linux, and macOS, with platform-specific process monitoring capabilities.

## Performance

- Lightweight: Updates display at 20 FPS but samples data at 1 Hz
- Non-blocking: Process drill-down popups don't interrupt monitoring
- Efficient: Moving average smoothing uses optimized numpy operations

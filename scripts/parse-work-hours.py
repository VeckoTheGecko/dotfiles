#!/usr/bin/env python3

"""
Parse screen lock events to calculate work hours.
Reads from ~/.local/share/screen-lock-events.log
"""

import os
import sys
from datetime import datetime, timedelta
from pathlib import Path
from collections import defaultdict

LOG_FILE = Path.home() / ".local" / "share" / "screen-lock-events.log"

def parse_log_file(log_path):
    """Parse the log file and return a list of events."""
    events = []

    if not log_path.exists():
        print(f"Log file not found: {log_path}")
        return events

    with open(log_path, 'r') as f:
        for line in f:
            line = line.strip()
            if not line:
                continue

            try:
                # Expected format: "YYYY-MM-DD HH:MM:SS EVENT_TYPE"
                parts = line.split()
                if len(parts) >= 3:
                    date_str = parts[0]
                    time_str = parts[1]
                    event_type = parts[2]

                    timestamp = datetime.strptime(f"{date_str} {time_str}", "%Y-%m-%d %H:%M:%S")
                    events.append((timestamp, event_type))
            except ValueError as e:
                print(f"Warning: Could not parse line: {line}", file=sys.stderr)
                continue

    return sorted(events)

def calculate_work_hours(events):
    """Calculate work hours from events."""
    daily_hours = defaultdict(timedelta)

    unlock_time = None
    current_day = None

    for timestamp, event_type in events:
        day = timestamp.date()

        if event_type == "UNLOCKED":
            unlock_time = timestamp
            current_day = day
        elif event_type == "LOCKED" and unlock_time is not None:
            if current_day == day:
                duration = timestamp - unlock_time
                daily_hours[day] += duration
            unlock_time = None

    # If still unlocked at the end, count until now
    if unlock_time is not None:
        now = datetime.now()
        if current_day == now.date():
            duration = now - unlock_time
            daily_hours[current_day] += duration

    return daily_hours

def format_duration(td):
    """Format a timedelta as hours and minutes."""
    total_seconds = int(td.total_seconds())
    hours = total_seconds // 3600
    minutes = (total_seconds % 3600) // 60
    return f"{hours}h {minutes}m"

def main():
    events = parse_log_file(LOG_FILE)

    if not events:
        print("No events found in log file.")
        return

    daily_hours = calculate_work_hours(events)

    if not daily_hours:
        print("No work hours calculated.")
        return

    print("Work Hours Summary")
    print("=" * 50)

    total_duration = timedelta()
    for day in sorted(daily_hours.keys()):
        duration = daily_hours[day]
        total_duration += duration
        print(f"{day.strftime('%Y-%m-%d (%A)')}: {format_duration(duration)}")

    print("=" * 50)
    print(f"Total: {format_duration(total_duration)}")

    if len(daily_hours) > 1:
        avg_duration = total_duration / len(daily_hours)
        print(f"Average: {format_duration(avg_duration)}")

if __name__ == "__main__":
    main()

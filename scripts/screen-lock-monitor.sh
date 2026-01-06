#!/bin/bash

# Screen lock monitor for macOS
# Logs screen lock and unlock events to track work hours

LOG_FILE="$HOME/.local/share/screen-lock-events.log"

# Ensure log directory exists
mkdir -p "$(dirname "$LOG_FILE")"

# Log startup
echo "$(date '+%Y-%m-%d %H:%M:%S') MONITOR_STARTED" >> "$LOG_FILE"

# Monitor system log for screen lock/unlock events
log show --style syslog --predicate 'eventMessage contains "screensaver" or eventMessage contains "ScreenLock"' --info --last 1m 2>/dev/null | while read -r line; do
    :
done

# Use a Swift script to monitor for screen lock events
/usr/bin/swift - "$LOG_FILE" <<'EOF'
import Foundation
import Cocoa

let logFile = CommandLine.arguments[1]

class ScreenLockObserver {
    let logFile: String

    init(logFile: String) {
        self.logFile = logFile
        registerForNotifications()
    }

    func logEvent(_ event: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let timestamp = formatter.string(from: Date())
        let logEntry = "\(timestamp) \(event)\n"

        if let data = logEntry.data(using: .utf8) {
            if let fileHandle = FileHandle(forWritingAtPath: logFile) {
                fileHandle.seekToEndOfFile()
                fileHandle.write(data)
                fileHandle.closeFile()
            } else {
                try? data.write(to: URL(fileURLWithPath: logFile), options: .atomic)
            }
        }
    }

    func registerForNotifications() {
        let dnc = DistributedNotificationCenter.default()

        dnc.addObserver(forName: NSNotification.Name("com.apple.screenIsLocked"),
                       object: nil,
                       queue: .main) { [weak self] _ in
            self?.logEvent("LOCKED")
        }

        dnc.addObserver(forName: NSNotification.Name("com.apple.screenIsUnlocked"),
                       object: nil,
                       queue: .main) { [weak self] _ in
            self?.logEvent("UNLOCKED")
        }
    }
}

let observer = ScreenLockObserver(logFile: logFile)
RunLoop.main.run()
EOF

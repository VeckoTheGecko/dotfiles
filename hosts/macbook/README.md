# macOS Configuration

## Launch Agents

### Screen Lock Monitor

**File**: `com.hodgs004.screenlockmonitor.plist`

This Launch Agent automatically tracks work hours by logging screen lock/unlock events.

#### Manual Setup

Copy the plist to your LaunchAgents directory:

```bash
cp ~/dotfiles/hosts/macbook/com.hodgs004.screenlockmonitor.plist ~/Library/LaunchAgents/
launchctl load ~/Library/LaunchAgents/com.hodgs004.screenlockmonitor.plist
```

The monitoring script must also be in place at `~/dotfiles/scripts/screen-lock-monitor.sh`.

#### Viewing Work Hours

Run the parser script to see your work hours:

```bash
~/dotfiles/scripts/parse-work-hours.py
```

#### Future Automation

This could be automated using [nix-darwin](https://github.com/LnL7/nix-darwin) with `launchd.user.agents` configuration. See [this guide](https://www.danielcorin.com/til/nix-darwin/launch-agents/) for reference.

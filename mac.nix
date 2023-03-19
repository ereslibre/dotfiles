{ username, pkgs }:
if pkgs.stdenv.isDarwin then {
  "Library/LaunchAgents/es.ereslibre.emacs.plist".text = ''
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
      <key>Label</key>
      <string>es.ereslibre.es.emacs</string>
      <key>ProgramArguments</key>
      <array>
        <string>${pkgs.emacs-nox}/bin/emacs</string>
        <string>--fg-daemon=/Users/${username}/.emacs.d/emacs.sock</string>
      </array>
      <key>RunAtLoad</key>
      <true/>
      <key>KeepAlive</key>
      <true/>
      <key>LSUIElement</key>
      <true/>
    </dict>
    </plist>
  '';
  ".bin/rosetta" = {
    source = ./assets/mac/rosetta;
    executable = true;
  };
} else
  { }

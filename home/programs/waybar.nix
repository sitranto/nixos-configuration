{ ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = false;
    style = ''
      * {
          border: none;
          border-radius: 0;
          font-family: "JetBrains Mono Nerd Font";
          font-weight: bold;
          font-size: 14px;
          min-height: 0;
      }

      window#waybar {
          background: rgba(21, 18, 27, 0.8);
          color: #cdd6f4;
      }

      #workspaces button {
          padding: 0 8px;
          background: transparent;
          color: #cdd6f4;
          border: 2px solid transparent;
          border-radius: 8px;
      }

      #workspaces button.active {
          background: #cba6f7;
          color: #1e1e2e;
          border: 2px solid #cba6f7;
      }

      #workspaces button.urgent {
          background: #f38ba8;
          color: #1e1e2e;
      }

      #clock, #pulseaudio, #cpu, #memory, #tray {
          padding: 0 10px;
          margin: 3px 0;
          color: #1e1e2e;
          background: #cba6f7;
          border-radius: 8px;
      }

      #clock {
          background: #cba6f7;
          color: #1e1e2e;
          border-radius: 8px;
          margin-right: 5px;
      }

      #pulseaudio {
          background: #89b4fa;
          color: #1e1e2e;
      }

      #cpu {
          background: #94e2d5;
          color: #1e1e2e;
      }

      #memory {
          background: #74c7ec;
          color: #1e1e2e;
      }

      #tray {
          background: #585b70;
          color: #cdd6f4;
      }
    '';

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 35;
        spacing = 4;

        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "pulseaudio" "cpu" "memory" "tray" ];

        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          format = "{icon}";
          format-icons = {
            "1" = "1";
            "2" = "2";
            "3" = "3";
            "4" = "4";
            "5" = "5";
            "6" = "6";
            "7" = "7";
            "8" = "8";
            "9" = "9";
            "10" = "10";
            "urgent" = "!";
            "default" = "○";
          };
        };

        "clock" = {
          format = "{:%H:%M}";
          format-alt = "{:%Y-%m-%d}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "month";
            mode-mon-col = 3;
            weeks-pos = "right";
            on-scroll = 1;
            on-click-right = "mode";
            format = {
              months = "<span color='#ffead3'><b>{}</b></span>";
              days = "<span color='#ecc6d9'><b>{}</b></span>";
              weeks = "<span color='#99ffdd'><b>W{}</b></span>";
              weekdays = "<span color='#ffcc66'><b>{}</b></span>";
              today = "<span color='#ff6699'><b><u>{}</u></b></span>";
            };
          };
          actions = {
            on-click-right = "mode";
            on-click-forward = "tz_up";
            on-click-backward = "tz_down";
            on-scroll-up = "shift_up";
            on-scroll-down = "shift_down";
          };
        };

        "pulseaudio" = {
          format = "VOL {volume}%";
          on-click = "pavucontrol";
          scroll-step = 5;
        };

        "cpu" = {
          format = "CPU {usage}%";
          tooltip = false;
        };

        "memory" = {
          format = "RAM {}%";
        };

        "tray" = {
          icon-size = 21;
          spacing = 10;
        };
      };
    };
  };
}

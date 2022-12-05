{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    prefix = "C-a";
    keyMode = "vi";

    extraConfig = ''
      # navigation
      bind -r h select-pane -L  # move left
      bind -r j select-pane -D  # move down
      bind -r k select-pane -U  # move up
      bind -r l select-pane -R  # move right

      # window
      bind c new-window -c "#{pane_current_path}"

      # pane
      bind-key "|" split-window -h -c "#{pane_current_path}"
      bind-key "-" split-window -v -c "#{pane_current_path}"
      bind-key "_" split-window -fv -c "#{pane_current_path}"

      # Begin selection in copy mode.
      bind-key -T copy-mode-vi 'v' send -X begin-selection
      # Begin selection in copy mode.
      bind-key -T copy-mode-vi 'C-v' send -X rectangle-toggle
      # Yank selection in copy mode.
      bind-key -T copy-mode-vi 'y' send -X copy-pipe-and-cancel 'reattach-to-user-namespace pbcopy'
      bind-key -T copy-mode-vi Enter send -X copy-pipe-and-cancel 'reattach-to-user-namespace pbcopy'
    '';
  };
}

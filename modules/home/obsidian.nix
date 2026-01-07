{
  programs.obsidian = {
    enable = true;
    vaults = {
      brain= {
        enable = true;
        target = "obsidian/brain";
      };
    };

    defaultSettings = {
      app = {
        alwaysUpdateLinks = true;
        livePreview = true;
        pdfExportSettings = {
          pageSize = "A4";
          landscape = false;
          margin = "0";
          downscalePercent = 100;
        };
      };

      appearance = {
        theme = "obsidian";
        cssTheme = "AnuPpuccin";
        enabledCssSnippets = [
          "extended-colorschemes"
          "floating-search-bar"
          "floating-status-bar"
          "minimal-cards"
          "notion-cards"
          "custom-background"
        ];
        textFontFamily = "Inter";
      };

      corePlugins = [
        "file-explorer"
        "global-search"
        "switcher"
        "graph"
        "backlink"
        "canvas"
        "outgoing-link"
        "tag-pane"
        "page-preview"
        "daily-notes"
        "templates"
        "note-composer"
        "command-palette"
        "editor-status"
        "bookmarks"
        "outline"
        "word-count"
        "file-recovery"
      ];

      # communityPlugins = [
      #   #"obsidian-excalidraw-plugin"
      #   "dataview"
      #   "templater-obsidian"
      #   "url-into-selection"
      #   "obsidian-git"
      #   "obsidian-plugin-update-tracker"
      #   "tag-wrangler"
      #   "obsidian-icon-folder"
      #   "obsidian-advanced-slides"
      #   "obsidian-style-settings"
      #   "terminal"
      #   "card-board"
      # ];
    };
  };
}

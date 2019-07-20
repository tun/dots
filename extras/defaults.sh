defaults write -g CGFontRenderingFontSmoothingDisabled -bool FALSE
defaults write com.apple.Dock autohide-delay -float 0
defaults write com.apple.Dock expose-animation-duration -float 0.12
defaults write com.apple.Dock persistent-apps -array
defaults write com.apple.Dock tilesize -int 48
defaults write com.apple.Finder DisableAllAnimations -bool true
defaults write com.apple.Finder QLEnableTextSelection -bool TRUE
defaults write com.apple.ScreenCapture location ~/Pictures/Screenshots
killall Dock
killall Finder

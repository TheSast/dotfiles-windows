#SingleInstance Force

; Load library
#Include "komorebic.lib.ahk"
; Load configuration
#Include "komorebi.generated.ahk"

; Send the ALT key whenever changing focus to force focus changes
AltFocusHack("enable")
; Default to cloaking windows when switching workspaces
WindowHidingBehaviour("cloak")
; Set cross-monitor move behaviour to insert instead of swap
CrossMonitorMoveBehaviour("Insert")
; Enable hot reloading of changes to this file
WatchConfiguration("enable")

; Create named workspaces I-V on monitor 0
EnsureNamedWorkspaces(0, "I II III IV V")
; You can do the same thing for secondary monitors too
EnsureNamedWorkspaces(1, "A B C D E F")

; Assign layouts to workspaces, possible values: bsp, columns, rows, vertical-stack, horizontal-stack, ultrawide-vertical-stack
NamedWorkspaceLayout("I", "bsp")

; Set the gaps around the edge of the screen for a workspace
; NamedWorkspacePadding("I", 20)
; Set the gaps between the containers for a workspace
; NamedWorkspaceContainerPadding("I", 20)

; You can assign specific apps to named workspaces
NamedWorkspaceRule("exe", "vivaldi.exe", "B")
NamedWorkspaceRule("exe", "brave.exe", "B")
NamedWorkspaceRule("exe", "Discord.exe", "II")
; NamedWorkspaceRule("exe", "wezterm-gui.exe", "III")

; Configure the invisible border dimensions
InvisibleBorders(7, 0, 14, 7)

; Uncomment the next lines if you want a visual border around the active window
ActiveWindowBorder("disable")
ActiveWindowBorderWidth(5)
ActiveWindowBorderOffset(0)
ActiveWindowBorderColour(66, 165, 245, "single")
ActiveWindowBorderColour(256, 165, 66, "stack")
ActiveWindowBorderColour(255, 51, 153, "monocle")

CompleteConfiguration()
; test
#Space::
{
  static toggleBorder := false
  if (toggleBorder) {
    ActiveWindowBorder("disable")
  }
  else {
    ActiveWindowBorder("enable")
  }
  toggleBorder := !toggleBorder
}

; Focus windows
#h::Focus("left")
#j::Focus("down")
#k::Focus("up")
#l::Focus("right")
; #+[::CycleFocus("previous")
; #+]::CycleFocus("next")

; Move windows
#+h::Move("left")
#+j::Move("down")
#+k::Move("up")
#+l::Move("right")
; #+Enter::Promote()

; Stack windows
; #Left::Stack("left")
; #Right::Stack("right")
; #Up::Stack("up")
; #Down::Stack("down")
; #;::Unstack()
; #[::CycleStack("previous")
; #]::CycleStack("next")

; Resize
#Right::Resize("right", "increase")
#Left::Resize("left", "increase")
#Up::Resize("up", "increase")
#Down::Resize("down", "increase")

; Manipulate windows
#b::ToggleFloat()
; #+f::ToggleMonocle()
#z::ToggleMaximize()
#q::Close()

; Window manager options
; #+r::Retile()
; #p::TogglePause()
#+::AdjustContainerPadding("increase", 15)
#-::AdjustContainerPadding("decrease", 15)
#=::AdjustWorkspacePadding("increase", 15)
#_::AdjustWorkspacePadding("decrease", 15)

; Layouts
; #x::FlipLayout("horizontal")
; #y::FlipLayout("vertical")

; Workspaces
#n::NewWorkspace()
#1::FocusWorkspace(0)
#2::FocusWorkspace(1)
#3::FocusWorkspace(2)
#4::FocusWorkspace(3)
#5::FocusWorkspace(4)
#6::FocusWorkspace(5)
#7::FocusWorkspace(6)
#8::FocusWorkspace(7)
#9::FocusWorkspace(8)

; Move windows across workspaces
#+1::MoveToWorkspace(0)
#+2::MoveToWorkspace(1)
#+3::MoveToWorkspace(2)
#+4::MoveToWorkspace(3)
#+5::MoveToWorkspace(4)
#+6::MoveToWorkspace(5)
#+7::MoveToWorkspace(6)
#+8::MoveToWorkspace(7)
#+9::MoveToWorkspace(8)

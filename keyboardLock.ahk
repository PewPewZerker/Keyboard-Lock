#Requires AutoHotkey v2.0
#SingleInstance Force
Persistent

; Automatically relaunch as Administrator if not already running as one
if not A_IsAdmin {
    try {
        Run('*RunAs "' A_ScriptFullPath '"')
    } catch {
        MsgBox("This script requires Administrator privileges to run.", "Error", 0x10)
    }
    ExitApp()
}

; --- Boot the script on windows launch --- (Optional)
; Automatically adds/updates this script in the Windows Registry startup key
RegWrite('"' A_ScriptFullPath '"', "REG_SZ", "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run", "KeyboardTouchpadBlocker")

*F11::ToggleKeyboardBlock()  ; ----IMPORTANT---- CHANGE THE "F11" TO WHATEVER KEY YOU WANT TO USE AS A TOGGLE (EX: *F10) ----IMPORTANT----

ToggleKeyboardBlock() {
    static Blocker := ""
   
    ; Initialize the hook if it doesn't exist
if (Blocker == "") {
        Blocker := InputHook("L0 I") ; "L0" - Tells script never to stop collecting input based on character count | "I" - Ignore artificial keystrokes
        

        Blocker.KeyOpt("{All}", "S") ; Blocks every key on the keyboard
        

        Blocker.KeyOpt("F11", "-S") ; Adds an exception for the toggle key | ----IMPORTANT---- CHANGE THE "F11" TO WHATEVER KEY YOU WANT TO USE AS A TOGGLE (EX: F10) ----IMPORTANT----
        
        
        Blocker.OnKeyDown := (ih, vk, sc) => "" ; Prevent the hook from stopping automatically when a key is suppressed
    }
    
    ; Toggle logic
    if (Blocker.InProgress) {
        Blocker.Stop()
        ; Enable Touchpad (1)
        Run("C:\Windows\System32\SystemSettingsAdminFlows.exe EnableTouchpad 1",, "Hide") ; Launches a specific native Windows utility - only way to disable/enable touchpad on AHK
        ToolTip("Keyboard & Touchpad Unlocked")
    } else {
        Blocker.Start()
        ; Disable Touchpad (0)
        Run("C:\Windows\System32\SystemSettingsAdminFlows.exe EnableTouchpad 0",, "Hide")
        ToolTip("Keyboard & Touchpad Locked")
    }
    
    SetTimer () => ToolTip(), -2000 ; Tooltip duration (-2000 = 2 seconds)
}

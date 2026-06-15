# 🐾 Cat-Proof Keyboard Lock

This script locks down your keyboard and touchpad with a single keypress. If you’re tired of your cat typing gibberish, opening random windows, or ruining your gaming sessions, this **will** save your sanity!

Every similar software I tried had some pretty major (and minor) gaps — like failing to work during fullscreen gaming, lacking dual-action keybinds, or suffering from heavy code bloat and overdesigned UIs. So I decided to take a crack at building my own.

<p align="center">
  <img src="https://github.com/user-attachments/assets/93d5d145-352b-46de-a10d-70e0a50e6c4e" alt="cat-keyboard" style="max-width: 100%; height: auto;" width="220" />
</p>

> **Note:** Admin mode is required for hardware access (the script triggers this automatically).

## 🌟 Key Features

* Instant Toggleable Lock: Tap F11 (by default) to freeze your keyboard and touchpad instantly.
* Mouse Control: Keeps your mouse fully active while the keyboard is locked.
* Ultra-Lightweight: Written in just 52 lines of code.
* Gaming Friendly: Works perfectly over full-screen games without minimizing.
* Visual Alerts: Shows a tooltip that fades after 2 seconds to display lock status.
* Windows Boot: Launches automatically when your PC turns on.

------------------------------

## 🛠️ Prerequisites & Setup

- [ ] **Step 1:** Install the latest version of AutoHotkey from [Autohotkey.com](https://www.autohotkey.com/download/ahk-v2.exe).
- [ ] **Step 2:** Download and run the script file: [keyboardLock.ahk](https://github.com/PewPewZerker/Keyboard-Lock/releases/download/Main/keyboardLock.ahk).
- [ ] **Step 3:** You are all set! The script automatically configures itself to boot up with Windows, **the default keybind is "F11"**, to change it, move onto the next section.

***

## ⚙️ Customization (Optional)

Follow these steps to rebind the toggle key to any key combination you prefer:

### 1. Edit the Script
Right-click the script's green **H** icon in your system tray and select **Edit Script**.

<p align="left">
  <img src="https://github.com/user-attachments/assets/46e4e42e-ab16-431c-82fd-49ead8a52463" alt="Edit Script Menu" style="max-width: 100%; height: auto;" width="250" />
</p>

### 2. Change the Key Values
Your text editor will open. Replace both instances of `F11` with your preferred hotkey, then save the file (`Ctrl + S`).

```autohotkey
*F11:: ToggleKeyboardBlock() ; <--- 1. CHANGE THIS TO YOUR TOGGLE KEY (e.g., *F10::)

ToggleKeyboardBlock() {
    Static Blocker := ""
    
    If (Blocker == "") {
        Blocker := InputHook("L0 I1") 
        Blocker.KeyOpt("{All}", "S")   
        
        Blocker.KeyOpt("F11", "-S") ; <--- 2. CHANGE THIS MATCHING KEY TOO (e.g., "F10")
        
        Blocker.OnKeyDown := (ih, vk, sc) => "" 
    }
}
```

### 3. Reload and Apply
Right-click the system tray icon again and choose **Reload Script** to activate your changes.

<p align="left">
  <img src="https://github.com/user-attachments/assets/bead17d7-b9f4-402b-944e-b6e11a2876f3" alt="Reload Script Menu" style="max-width: 100%; height: auto;" width="250" />
</p>

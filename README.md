<img width="1080" height="636" alt="i-catproofed-our-keyboards-to-the-joy-of-our-cats-v0-af9w3uc1rd7h1" src="https://github.com/user-attachments/assets/9c5d130d-e03d-4056-8482-38375fc17f67" />

## 🛠️ Requisites & Setup

Follow these quick steps to get cat-proofing active:

- [ ] **Step 1:** Install the latest version of AutoHotkey from [Autohotkey.com](https://www.autohotkey.com/download/ahk-v2.exe).
- [ ] **Step 2:** Download and run the script file: [keyboardLock.ahk](https://github.com/PewPewZerker/Keyboard-Lock/releases/download/Main/keyboardLock.ahk).
- [ ] **Step 3:** You are all set! The script automatically configures itself to boot up with Windows.

<hr style="border: none; height: 1px; background-image: linear-gradient(to right, rgba(0,0,0,0), rgba(255,255,255,0.2), rgba(0,0,0,0)); width: 100%; margin: 30px 0;">

## ⚙️ Customization (Optional)

The default toggle key is **F11**. Follow these steps to rebind it to any key combination you prefer:

### 1. Edit the Script
Right-click the script's green **H** icon in your system tray and select **Edit Script**.

<img width="250" alt="Edit Script Menu" src="https://github.com/user-attachments/assets/46e4e42e-ab16-431c-82fd-49ead8a52463" />

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
```

### 3. Reload and Apply
Right-click the system tray icon again and choose **Reload Script** to activate your changes.

<img width="250" alt="Reload Script Menu" src="https://github.com/user-attachments/assets/bead17d7-b9f4-402b-944e-b6e11a2876f3" />

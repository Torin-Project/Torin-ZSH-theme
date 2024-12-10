# **Torin Zsh Theme**  
[![Zsh](https://img.shields.io/badge/Zsh-Compatible-brightgreen)](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes)  
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)  
[![Platform](https://img.shields.io/badge/Platform-Linux%20%7C%20macOS-orange)](https://www.zsh.org/)  
[![Version](https://img.shields.io/badge/Version-1.0.0-yellowgreen)](#)  

**Torin Zsh Theme** is a highly customizable and feature-rich theme designed for Zsh. It offers a modern, UX-focused terminal experience with dynamic package manager detection, Git integration, useful aliases, and system setup functions.

---

## **Features**  
- 🎨 **Modern and Minimalistic Design**: Clean prompt layout with Git branch integration and user role indicators.  
- 🔍 **Dynamic Package Manager Detection**: Automatically detects and adapts to `pacman`, `apt`, `dnf`, `zypper`, or `brew`.  
- ⚡ **Powerful Aliases**: Commonly used commands like `ll`, `gs`, `mkcd`, and more for efficiency.  
- 🚀 **Setup Functions**: Includes quick setup scripts for development environments and project initialization.  
- 🖥️ **Cross-Platform Support**: Compatible with Linux and macOS.  
- 🛠️ **Docker Integration**: Handy Docker commands for container and system management.  

---

## **Installation**  

### **Prerequisites**  
1. **Zsh**: Ensure you have Zsh installed on your system.  
2. **Oh My Zsh**: Recommended for managing Zsh themes and plugins.  

### **Steps**  
1. Clone this repository:  
   ```bash
   git clone https://github.com/torin-project/torin-zsh-theme.git ~/.oh-my-zsh/themes/torin
   ```
2. Copy the theme file to the themes directory:  
   ```bash
   cp ~/.oh-my-zsh/themes/torin/torin.zsh-theme ~/.oh-my-zsh/themes/
   ```
3. Update your `.zshrc` to use the `torin` theme:  
   ```bash
   ZSH_THEME="torin"
   ```
4. Reload your Zsh configuration:  
   ```bash
   source ~/.zshrc
   ```

---

## **Usage**  

### **Prompt Overview**  
- **User Role**: Displays whether you're logged in as a regular user (`➤`) or root (`⚡`).  
- **Current Directory**: Shows the last directory in your path.  
- **Git Integration**: Displays the current branch if inside a Git repository.  

Example:  
```bash
➤ codespace ~/projects/torin-theme  main
❯ 
```

### **Dynamic Package Manager Commands**  
Depending on your system, the following aliases will map to the correct package manager (`pacman`, `apt`, `dnf`, etc.):  
- `update`: Update system packages.  
- `install <pkg>`: Install a package.  
- `remove <pkg>`: Remove a package.  
- `search <pkg>`: Search for a package.  
- `clean`: Clean up system cache.  

### **Common Aliases**  
| Alias   | Command                                | Description                     |
|---------|----------------------------------------|---------------------------------|
| `ll`    | `ls -alF`                              | Detailed file listing.          |
| `la`    | `ls -A`                                | Show hidden files.              |
| `cls`   | `clear`                                | Clear the terminal screen.      |
| `gs`    | `git status`                           | Show Git status.                |
| `mkcd`  | `mkdir -p <dir> && cd <dir>`           | Create and navigate to a folder.|

### **Functions**  
#### `setup_dev_env`  
Quickly sets up a development environment with essential tools like Git, Curl, Zsh, Docker, and Python.  
```bash
setup_dev_env
```

#### `init_project`  
Initialize a new project directory with Git and a basic `README.md`.  
```bash
init_project <project_name>
```

#### `setup_zsh`  
Install and configure Zsh and Oh My Zsh.  
```bash
setup_zsh
```

---

## **Contributing**  
We welcome contributions! If you have ideas for improvements or new features, feel free to:  
1. Fork the repository.  
2. Make your changes.  
3. Submit a pull request.  

---

## **License**  
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## **Screenshots**  

### **Prompt Layout**  
![Torin Zsh Theme Prompt](https://github.com/Torin-Project/Torin-ZSH-theme/img.jpg)  

---

## **Acknowledgments**  
Inspired by modern Zsh themes and tools for enhancing terminal productivity.

# Drive Photo & Video Gallery

<p align="center">
  <img src="DRIVE_ROOT/.gallery-app/assets/icon.png" width="160" height="160" alt="Drive Photo & Video Gallery Icon" />
</p>

A standalone, portable photo and home video gallery designed for thumbdrives and external media drives. Works instantly on Windows, macOS, and Linux with **zero installation** and **100% offline privacy**.

![Version](https://img.shields.io/badge/version-1.6-blue.svg)
![Python](https://img.shields.io/badge/Python-3.8%2B-blue)
![Pillow](https://img.shields.io/badge/Imaging-Pillow-green)
![pyexiv2](https://img.shields.io/badge/Metadata-pyexiv2-orange)
![FFmpeg](https://img.shields.io/badge/Video-FFmpeg-red)
![HTML5](https://img.shields.io/badge/Frontend-HTML5%20%2F%20JS-yellow)
![Platform](https://img.shields.io/badge/platform-Windows%20%7C%20macOS%20%7C%20Linux-lightgrey)

---

## 🚀 Quick Start (2 Steps — Zero Setup)

1. **Build your gallery:** Download **`Create.Gallery.exe`** (or **`Create.Gallery.py`**) from **[GitHub Releases](../../releases)**, drop it in the root of your thumbdrive/folder, and run it.
2. **Open anytime:** Double-click **`Open Gallery (Windows).bat`** or **`Open Gallery (Mac).command`** in the drive root (or open `.gallery-app/Open Gallery.html` in any browser).

*Added or moved photos later? Just run **`.gallery-app/Update Gallery.bat`** to refresh the gallery — no internet connection, web server, or installation required!*

---

## ✨ Features & Navigation

### 1. 📅 Interactive Timeline View
* **Dynamic Decade Rail:** Collapses media into decades (e.g., `1980s`, `2000s`, `2010s`). As you scroll, the rail smoothly expands the active decade into individual years, and the active year into months.
* **Granular Jumping:** Click any decade, year, or month on the left rail to jump directly to those memories.
* **Sort Controls:** Easily switch between **⬇ Newest First** and **⬆ Oldest First**.

### 2. 📁 Folder Tree Browser
* **Hierarchical Navigation:** Visual folder tree showing the organization of the drive.
* **Quick Expansion:** Use the **⊞ Expand All** and **⊟ Contract All** buttons to inspect or collapse nested folder trees.
* **Recursive Folder Filtering:** Selecting a folder displays all media inside it and its subfolders.

### 3. 🎬 Dedicated Videos View
* **Camcorder & Home Video Titles:** Displays clean embedded video titles (from MP4 metadata/Mp3tag) or sanitized filenames with title overlays on cards.
* **Duration Badges:** Shows formatted playback length (e.g., `⏱️ 14:22`) directly on video thumbnails.
* **Distraction-Free Photo Grid:** Keeps photo cards clean and uncluttered while surfacing video metadata clearly.

### 4. 👤 People & Portraits
* **Lean Single-Avatar Architecture:** During indexing, only **one single default portrait** is generated per person (saving disk space and avoiding tens of thousands of duplicate files).
* **Sorting Options:** Sort people **📊 By Amount** of appearances or **🔤 By Name** alphabetically.
* **Custom Avatars & On-Demand Square Cropper:**
  * **In-App Photo Browser & Cropper:** Click **📷 Change Photo** on any person to scroll through all the photos they appear in. Selecting any photo immediately opens the interactive **Square Selection Box Cropper** (`✂️ Crop Face`), pre-focused and zoomed over their face if metadata coordinates exist. You can drag, pan, and zoom to frame the portrait perfectly.
  * **Instant Download / Permanent Storage:** Click **💾 Download** in the cropper to save `{PersonName}.jpg` and drop it directly into `.gallery-app/Custom Avatars/` to bake it permanently into the thumbdrive across all devices. You can also upload any external photo via **📁 Upload Custom**.
  * **Permanent Drive Overrides:** Any image placed in `.gallery-app/Custom Avatars/{PersonName}.jpg` (or `.png`) takes immediate priority during indexing.

### 5. 🏷️ Keyword Tags
* **Interactive Tag Cloud:** Visual keyword cloud weighted by frequency.
* **Sort Options:** Sort keywords **📊 By Amount** or **🔤 By Name**.
* Click any tag to instantly filter the timeline or folder view.

---

## 🔍 Search & Filters

* **Instant Search:** Type any name, tag, filename, title, or folder into the search bar at the top right.
* **Active Filter Chips:** Shows active filters at the top of the stream. Click the `×` on any chip to remove it, or click **Clear All**.
* **Collapsible Side Panel:** Click **👥 Filters** to toggle the slide-out people and tags panel on Timeline and Folder views.

---

## 🖼️ Fullscreen Shadowbox (Lightbox)

Click on any thumbnail to open the high-resolution viewer:

* **Mouse Wheel Zoom:** Scroll up to zoom in (up to 600%), scroll down to zoom out.
* **Click & Drag Pan:** Click and drag to inspect fine details across zoomed photos.
* **Double-Click:** Quick toggle between 100% fit and 250% zoom.
* **Collapsible Details:** Click **Hide Details ▼** to maximize the screen for photos or home videos.
* **Keyboard Shortcuts:**
  * `←` / `→` : Previous / Next photo or video
  * `Esc` : Close shadowbox or avatar picker
  * `F` : Toggle Fullscreen mode
  * `I` : Toggle image info & metadata footer

---

## 🛠️ Adding New Photos & Re-indexing

If you add new photos or videos, rename folders, or drop custom portraits into `.gallery-app/Custom Avatars/`:

1. Open the `.gallery-app` folder.
2. Double-click **`build_gallery.bat`** (Windows) or run `python .gallery-app/build_gallery.py`.
3. The script displays a colorized, reassuring update confirmation dialog:
   * Displays the current application folder and lists all detected media folders.
   * Explicitly reassures you that the indexer is **safe and non-destructive** and will **never touch or alter your original photos or videos**.
   * Press **Enter** or type `y` to proceed.
   * Type `n` to cancel without modifying anything.
   *(You can also pass `-y` or `--yes` to skip the prompt for automated runs).*
4. The indexer will automatically:
   * Scan all media folders on the drive.
   * Auto-rotate thumbnails according to EXIF orientation.
   * Extract dates, titles, tags, and people face regions.
   * Purge orphaned cache files to keep thumbdrive storage clean.
   * Update `.gallery-app/gallery_data.js`.

---

## ⚡ Creating a Drive Gallery on a New USB Drive (1-File Setup)

It takes **one file and one click** to turn any thumbdrive or media folder into a complete Drive Gallery:
- **First-time setup:** Drop **`Create.Gallery.exe`** (or **`Create.Gallery.py`**) from **[GitHub Releases](../../releases)** into the drive root and run it.
- **Future updates:** Whenever you add, remove, or reorganize photos/videos, just run **`Update Gallery.bat`** inside `.gallery-app/` — everything else stays tucked away cleanly.

### Option A: `Create.Gallery.exe` (Windows — No Python Needed)
1. Download **`Create.Gallery.exe`** from **[GitHub Releases](../../releases)** and copy it to the root of your drive.
2. Double-click **`Create.Gallery.exe`**.
3. A confirmation screen will appear:
   * Explains that it will create a safe photo gallery in `.gallery-app` to easily view your media.
   * Confirms that it will **not touch or modify your media files**.
   * Shows the detected media folders on the drive.
4. Hit **Enter** (or type `y`). It automatically:
   * Creates the `.gallery-app/` structure.
   * Extracts `Open Gallery.html`, launchers (`Open Gallery (Windows).bat` / `Open Gallery (Mac).command`), and `autorun.inf`.
   * Unpacks `.gallery-app/assets/icon.png` and generates `.gallery-app/assets/drive_icon.ico`.
   * **Installs BOTH** `.gallery-app/build_gallery.exe` and `.gallery-app/build_gallery.py` inside `.gallery-app/`.
   * Indexes all photos and videos on the drive and launches the gallery in your browser!
   * *Once setup completes, it will let you know it is safe to delete `Create.Gallery.exe` from the drive root.*

### Option B: `Create.Gallery.py` (Cross-Platform Python — Windows / macOS / Linux)
1. Download **`Create.Gallery.py`** from **[GitHub Releases](../../releases)** (or copy `DRIVE_ROOT/.gallery-app/build_gallery.py`) to the root of your drive.
2. Run `python Create.Gallery.py`.
3. Press **Enter** on the confirmation screen.
   * `Create.Gallery.py` is **100% self-contained**: it carries embedded base64 payloads of `Open Gallery.html` and `assets/icon.png`.
   * It sets up `.gallery-app/`, indexes your media, copies itself to `.gallery-app/build_gallery.py`, and automatically removes itself from the drive root once the gallery is built!

---

## 📂 Drive Structure

```
<Drive Root>/
├── Start Gallery (Windows).bat    # Windows 1-click launcher
├── Start Gallery (Mac).command    # Mac 1-click launcher
├── autorun.inf                    # Windows USB drive icon & label configuration
├── drive_icon.ico                 # Multi-resolution thumbdrive icon
├── .gallery-app/                  # Self-contained application folder
│   ├── Open Gallery.html          # Standalone gallery web app
│   ├── gallery_data.js            # Zero-CORS offline data index
│   ├── Create Gallery.exe         # Portable 1-file standalone generator (for new drives)
│   ├── build_gallery.exe          # Standalone updater (runs without Python)
│   ├── build_gallery.py           # Portable Python source updater
│   ├── build_gallery.bat          # 1-click index updater (auto-detects .exe or python)
│   ├── thumbs/                    # Generated photo & video thumbnails
│   ├── avatars/                   # Generated facial portrait crops
│   ├── Custom Avatars/            # Drop {PersonName}.jpg here for custom portraits
│   ├── app_icon.png               # High-res app icon (1024x1024)
│   ├── favicon.png                # Browser tab icon
│   ├── app_icon.ico               # Windows shortcut icon
│   ├── README.md                  # Detailed user guide
│   └── CHANGELOG.md               # Version history & release notes
└── <Your Media Folders>/          # Folders containing photos and videos (e.g., DVD, Years, etc.)
```

---

## ⚙️ Standalone Executable (.exe) & Runtime Architecture

To allow non-technical Windows users without Python to initialize and maintain galleries, `build_gallery.py` can be compiled into a standalone Windows executable (`Create Gallery.exe` / `build_gallery.exe`) via **PyInstaller**. 

Because PyInstaller `--onefile` packages unpack into a temporary cache directory at runtime, specific architectural handling was implemented:

### 1. Drive Path Resolution (`sys.frozen` vs `%TEMP%`)
* In PyInstaller `--onefile` mode, `__file__` does **not** point to the thumbdrive; it points to `C:\Users\<User>\AppData\Local\Temp\_MEIxxxx\`.
* To prevent the script from looking for photos in Windows Temp, `get_env_paths()` checks `getattr(sys, 'frozen', False)`.
* When frozen, it resolves `sys.executable`, which accurately anchors the script to the root of the physical thumbdrive (e.g., `E:\Create Gallery.exe`), ensuring all media folders, relative links, and `.gallery-app` assets are created in the correct location regardless of the assigned drive letter.

### 2. Dual-Engine Extraction (`sys._MEIPASS`)
* When `Create Gallery.exe` runs for the first time, it provisions **both** maintenance engines into `.gallery-app/`:
  * Copies `sys.executable` to `.gallery-app/build_gallery.exe` (enabling future re-indexing without Python).
  * Extracts the raw `build_gallery.py` script bundled inside `sys._MEIPASS` into `.gallery-app/build_gallery.py` (preserving open-source access for Mac/Linux users or Python developers).
* The batch launcher (`build_gallery.bat`) prioritizes `build_gallery.exe` if present, falling back gracefully to `python build_gallery.py`.

### 3. Windows Console & Pipeline Encoding Safeguards
* Standard Windows consoles (PowerShell and `cmd.exe`) often default to legacy OEM or ANSI codepages (such as `cp1252` or `cp437`), particularly in non-interactive or redirected input streams (e.g. `echo y | app.exe`).
* To prevent crashes from `UnicodeEncodeError`:
  * `build_gallery.py` forces UTF-8 stream reconfiguration on startup: `sys.stdout.reconfigure(encoding='utf-8', errors='replace')`.
  * Console tree diagrams and status badges utilize cross-compatible ASCII fallbacks (`|--`, `\--`, `[+]`, `[OK]`) rather than multi-byte Unicode box-drawing characters.

### 4. Embedded Self-Sufficient Icons & Branding
* To ensure fresh drives never suffer from missing logo images or blank browser tabs, `build_gallery.py` embeds the raw application favicon as an internal base64 constant (`EMBEDDED_FAVICON_B64`).
* On first run, it extracts `favicon.png` and `app_icon.png`, and automatically synthesizes multi-resolution Windows icon files (`drive_icon.ico` and `app_icon.ico` with 16x16, 32x32, 48x48, and 64x64 sub-bitmaps) using Pillow.
* It also ensures `drive_icon.ico` is copied to the drive root for `autorun.inf`, giving the USB drive its custom branded appearance in Windows Explorer.

### 5. Development Workflow
* **Active Development:** Future features, optimizations, and bugfixes are made directly in `.gallery-app/build_gallery.py`.
* **Compilation on Release:** Once a feature set in `build_gallery.py` is tested and verified, recompile the standalone binary using:
  ```powershell
  pyinstaller --onefile --name "Create Gallery" --icon ".gallery-app\drive_icon.ico" --add-data ".gallery-app\build_gallery.py;." --distpath ".gallery-app\dist" --workpath "scratch\build" ".gallery-app\build_gallery.py"
  ```
  Then place the resulting `.exe` into `.gallery-app/Create Gallery.exe` and `.gallery-app/build_gallery.exe`.

---

## 🔒 Privacy & Architecture

* **Zero Cloud / Zero Tracking:** 100% of thumbnails and data are generated and stored locally on the drive.
* **Zero CORS Issues:** Uses pre-compiled JavaScript data payloads (`gallery_data.js`), allowing browsers to load full metadata seamlessly under the `file://` protocol without security warnings or blocked requests.


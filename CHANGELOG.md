# 📜 Changelog

All notable changes to the **Drive Photo & Video Gallery** project are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [1.6] - 2026-11-19

### Added
* **People First/Last Name Sorting & Family Grouping:**
  * Replaced generic name sorting on the People screen with **First Name** and **Last Name** options.
  * When sorted by **Last Name**, people are automatically grouped into sections by family last name (with single-word names grouped under **Other (Single Name)**).
* **Filter Sidebar Sorting:**
  * Added compact sort controls to the right filter sidebar for both **People** (`Count | First | Last`) and **Tags** (`Count | Name`), synced with the full People/Tags pages.
* **"Tagged Only" People Filter:**
  * Added a **👤 Tagged Only** toggle button in the header to filter the gallery down to only photos/videos with people tagged.
* **`AIEdit` Thumbnail Badge & Lightbox Notice:**
  * Photos tagged `AIEdit` now display a compact circular `✨` badge on the thumbnail and an **AI Edit** notice in the lightbox details panel.
* **Pre-Scan Count & Live Progress Bar:**
  * `build_gallery.py` now counts total photos and videos to scan before confirmation and displays a 44-character progress bar (`[...] XX% (n/total)`) while indexing.

### Changed & Improved
* **Evenly Distributed Header & Larger Search Box:** Enlarged the search bar (up to `380px`) and centered it between the middle controls and the right-hand Filters/Fullscreen buttons.
* **Friendlier Indexer UX & Large-Image Support:**
  * Softened the missing library prompt into a friendly **HELPER LIBRARIES SETUP** dialog.
  * Updated update mode prompt to `"Are you ready to update the gallery [Y/n]:"`, added a color-coded summary box (photos, videos, people, tags, folders), and kept the window open on completion.
  * Simplified setup output to `[*] Initializing Drive Gallery structure...` and disabled Pillow's `MAX_IMAGE_PIXELS` limit so high-resolution panoramas and flatbed scans process without `DecompressionBombWarning`.

---

## [1.5] - 2026-11-18

### Added
* **Mosaic View (Justified Rows):**
  * Added Google Photos-style justified rows layout (`Mosaic`) as the default gallery view, storing `w` and `h` dimensions in `gallery_data.js` for zero-jump rendering.
  * Simplified the aspect toggle to **Square | Mosaic** (removed **Full** view) and increased the thumbnail size slider max to `600px`.
* **Lightbox Two-Way Face Highlighting:**
  * Hovering a person's face in the lightbox draws a box and name pill over their face while highlighting their chip at the bottom; hovering a person's chip at the bottom highlights their face in the photo.
* **EXIF Library Check & Install Prompt:**
  * Added startup check in `build_gallery.py` for `Pillow` and `pyexiv2`, prompting to install missing libraries via `pip` when running as Python source, plus a notice if `ffmpeg`/`ffprobe` is missing.

### Changed & Fixed
* **Full-Height Lightbox Side Navigation:** Replaced the small circular prev/next arrows with full-height edge click zones while keeping click-off-to-close on the backdrop.
* **EXIF & Oldest Filesystem Date Fixes:** Fixed Pillow EXIF Sub-IFD (`0x8769`) lookup for `DateTimeOriginal` and updated the filesystem date fallback to use the oldest of modified (`st_mtime`) and created (`st_ctime`) timestamps.
* **Header, People & Assets Cleanup:** Removed the redundant `Drive Gallery` header title text, removed the duplicate hover edit button on People cards, added `onerror` fallback to scanned avatars when `localStorage` overrides are stale, consolidated icons into `.gallery-app/assets/`, and made `build_gallery.py` remove itself from the drive root after first-run setup.

---

## [2.3.0] - 2026-11-13

### Added
* **Single-Avatar-Per-Person Indexing & On-Demand Square Cropper:**
  * Replaced bulk pre-cropping of every detected face in every photo with a lean, single-avatar-per-person indexing model.
  * `build_gallery.py` now crops **at most ONE default avatar per person** (or respects custom overrides in `Custom Avatars/`), reducing `.gallery-app/avatars/` from hundreds or thousands of files down to 1 image per person.
  * Metadata face regions are stored as lightweight normalized coordinates `[cx, cy, rw, rh]` in `gallery_data.js` without generating extra files on disk.
  * Clicking **Change Photo** on any person opens a scrollable photo browser of all images they appear in; selecting any photo opens the interactive **Square Selection Box Cropper** (`✂️ Crop Face`), automatically pre-centered and zoomed onto their face when metadata coordinates exist.
  * Added **💾 Download** in the cropper to export a 400×400 JPG (`{PersonName}.jpg`) for easy placement into `.gallery-app/Custom Avatars/`.
* **Standalone EXE Builder Script (`.gallery-app/build_exe.bat`):**
  * Added a 1-click Windows batch script to recompile `build_gallery.py` into both `.gallery-app/Create Gallery.exe` and `.gallery-app/build_gallery.exe` via PyInstaller whenever needed, automatically cleaning up temporary build artifacts.

### Changed & Improved
* **Larger, Easier-to-Use Thumbnail Size Slider:**
  * Doubled the thumbnail size slider width (`60px` → `120px`), added a `6px` track and `16px` thumb handle, and wrapped it in a bordered pill container.
* **More Obvious Active Filters & Clear Button:**
  * Moved **`✕ Clear Filters`** directly alongside the active filter chips instead of the far-right edge, styled as a clear red pill button.
  * Highlighted the active filter bar with a subtle blue tint (`🔍 Active Filters:`) so it is immediately noticeable.
  * Enhanced the empty-state screen to explicitly list which active filters are hiding photos alongside a prominent **`✕ Clear All Filters`** button.

---

## [2.2.0] - 2026-11-13

### Added
* **Self-Contained Embedded Icons & Multi-Resolution ICO Synthesis:**
  * Embedded base64 payload of the official application favicon (`EMBEDDED_FAVICON_B64`) directly inside `build_gallery.py`.
  * On clean or empty drives where only `build_gallery.py` (or `Create Gallery.exe`) is present, setup automatically provisions `favicon.png` and `app_icon.png` into `.gallery-app/`.
  * Utilizes Pillow to synthesize multi-resolution icon files (`drive_icon.ico` and `app_icon.ico` at 16x16, 32x32, 48x48, and 64x64) and copies `drive_icon.ico` to the drive root for `autorun.inf`.
* **Friendly, Colorized Confirmation Dialogs:**
  * Redesigned console prompts for both **First Time Setup** and **Update** modes with clean ANSI color styling (Cyan, Green, Yellow, Blue) and clear non-destructive reassurance.
* **Standalone Windows Executable (`Create Gallery.exe`) & Dual-Engine Auto-Extraction:**
  * Compiled standalone executable bundled with `drive_icon.ico`, Pillow, pyexiv2, and the embedded gallery web app, installing both `build_gallery.exe` and `build_gallery.py` into `.gallery-app/`.
  * Implemented `sys.frozen` drive path resolution and UTF-8 Windows console safeguards.

---

## [2.1.0] - 2026-11-12

### Added
* **Custom People Avatars & Face Cropping:**
  * Interactive manual avatar cropper (`✂️ Adjust`) with drag-to-pan and zoom slider.
  * Permanent thumbdrive avatar overrides via `.gallery-app/Custom Avatars/{PersonName}.jpg`.
* **Timeline Decade Hierarchy & EXIF Orientation Normalization:**
  * Dynamic decade/year/month rail and automatic `ImageOps.exif_transpose` thumbnail rotation.
* **Automated Cache Purging:**
  * `purge_unused_assets()` automatically cleans orphaned thumbnails and avatars.

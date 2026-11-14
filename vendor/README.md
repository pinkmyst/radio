# vendor: files the radio page loads locally

Downloaded 2026-11-14 so the radio page needs nothing from the internet to start.
Versions are fixed. `SHA256SUMS.txt` lists a checksum for every file here.

| Folder | What | Version | Source | Licence |
|---|---|---|---|---|
| `three-0.147.0/` | three.js 3D engine and its glow passes | 0.147.0 | npm package `three` (registry.npmjs.org), tarball checksum verified against the registry | MIT (`LICENSE` in the folder) |
| `mediapipe-tasks-vision-0.10.14/` | Face tracker code | 0.10.14 | npm package `@mediapipe/tasks-vision`, tarball checksum verified against the registry | Apache-2.0 |
| `models/blaze_face_short_range.tflite` | Face-finding model | float16, version 1 | storage.googleapis.com/mediapipe-models (Google's official model store; no published checksum) | Apache-2.0 |
| `fonts/` | Chakra Petch, Rajdhani, Saira Semi Condensed, Barlow Semi Condensed, IBM Plex Mono, IBM Plex Sans | as served on the download date | Google Fonts (fonts.googleapis.com / fonts.gstatic.com) | SIL Open Font License (`OFL-*.txt` in the folder) |

To update one, download the new version from the same source, replace the folder, change the
version in the page, and rebuild `SHA256SUMS.txt`.

Still fetched from the internet while the radio runs, by design: the Radio Browser station list,
the station streams themselves, and station logos through images.weserv.nl.

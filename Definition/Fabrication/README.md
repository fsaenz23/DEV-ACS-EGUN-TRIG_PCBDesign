# Fabrication

Everything needed to reorder the bare boards.

- Base_Board/ and Logic_Board/: Gerber zip, ORDER_SPEC.md (options to select at the fab), and the original JLCPCB order package (proof of what was built; its internal "ok" folder is the fab's own CAM output and is not needed for reordering).
- CHECKSUMS.sha256: SHA-256 of every file here. Verify with `sha256sum -c CHECKSUMS.sha256` (Linux/Mac) or Get-FileHash (Windows).
- Verified 2026-10-07: the Gerbers inside both JLCPCB packages match these Gerber zips (base byte-identical; logic identical except creation timestamps), and copper, zones, drills, outline and mask openings match the KiCad project files. Silkscreen, paste layers and pad shapes were not checked.
- Parts and assembly are separate: see Documentation for the BOM. The fiber evaluation boards are not in the Gerbers and must be sourced separately.

install:
	ditto "Library" "$(HOME)/Library"

integrate:
	ditto "$(HOME)/Library/Services" "Library/Services"
	ditto "$(HOME)/Library/Workflows/Applications/Folder Actions" "Library/Workflows/Applications/Folder Actions"
	find Library -name "QuickLook" -type d -exec rm -rv {} +

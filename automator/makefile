install:
	ditto "Library" "$(HOME)/Library"

uninstall:
	rm -rv "$(HOME)/Library/Services"/*.workflow
	rm -rv "$(HOME)/Library/Workflows/Applications/Folder Actions"/*.workflow

commit:
	ditto "$(HOME)/Library/Services" "Library/Services"
	ditto "$(HOME)/Library/Workflows/Applications/Folder Actions" "Library/Workflows/Applications/Folder Actions"
	find Library -name "QuickLook" -type d -exec rm -rv {} +

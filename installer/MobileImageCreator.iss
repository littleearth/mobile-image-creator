; ----------------------------------------------------------------------------
; Mobile Image Creator - Installation Script
; Author: Tristan Marlow
;
;-----------------------------------------------------------------------------
; Application Variables
;-----------------------------------------------------------------------------
#define ConstAppVersion GetFileVersion("..\build\bin\Win64\Release\MobileImageCreator.exe") ; define variable
#define ConstAppProduct "Mobile Image Creator"
#define ConstAppName "Mobile Image Creator"
#define ConstAppDescription "Mobile Image Creator"
#define ConstAppPublisher "Little Earth Solutions"
#define ConstAppCopyright "Copyright (C) 2018 Thomas Grubb"
#define ConstAppURL "https://github.com/littleearth/mobile-image-creator"
#define ConstAppExeName "MobileImageCreator.exe"
;-----------------------------------------------------------------------------

[Setup]
AppName={#ConstAppName}
AppVersion={#ConstAppVersion}
AppPublisher={#ConstAppPublisher}
AppPublisherURL={#ConstAppURL}
AppSupportURL={#ConstAppURL}
AppUpdatesURL={#ConstAppURL}
AppCopyright={#ConstAppCopyright}
VersionInfoCompany={#ConstAppPublisher}
VersionInfoDescription={#ConstAppName}
VersionInfoCopyright={#ConstAppCopyright}
VersionInfoVersion={#ConstAppVersion}
VersionInfoTextVersion={#ConstAppVersion}
OutputDir=output
OutputBaseFilename=MobileImageCreator-Setup-{#ConstAppVersion}
UninstallDisplayName={#ConstAppName}
DefaultDirName={pf}\{#ConstAppProduct}
DefaultGroupName={#ConstAppProduct}
AllowNoIcons=true
MinVersion=0,6.1.7600
UninstallDisplayIcon={app}\{#ConstAppExeName}
InternalCompressLevel=ultra
Compression=lzma/ultra
RestartApplications=False
; "ArchitecturesInstallIn64BitMode=x64" requests that the install be
; done in "64-bit mode" on x64, meaning it should use the native
; 64-bit Program Files directory and the 64-bit view of the registry.
; On all other architectures it will install in "32-bit mode".
ArchitecturesInstallIn64BitMode=x64
; Note: We don't set ProcessorsAllowed because we want this
; installation to run on all architectures (including Itanium,
; since it's capable of running 32-bit code too).

[Tasks]
Name: desktopicon; Description: Create a &Desktop icon; GroupDescription: Options:
Name: delphitools; Description: Add to Delphi &Tools menu; GroupDescription: Options:

[Files]
Source: "..\build\bin\Win64\Release\*"; DestDir: "{app}"; Flags: recursesubdirs restartreplace replacesameversion; Check: Is64BitInstallMode
Source: "..\build\bin\Win32\Release\*"; DestDir: "{app}"; Flags: recursesubdirs restartreplace replacesameversion; Check: not Is64BitInstallMode

[Icons]
Name: "{commondesktop}\{#ConstAppName}"; Filename: "{app}\{#ConstAppExeName}"; WorkingDir: "{app}"; Tasks: desktopicon
Name: "{group}\{#ConstAppName}"; Filename: "{app}\{#ConstAppExeName}"; WorkingDir: "{app}"

[Registry]
; 19.0
Root: HKCU; Subkey: Software\Embarcadero\BDS\19.0\Transfer\{#ConstAppName}; ValueType: string; ValueName: "Params"; ValueData: ""; Tasks: delphitools 
Root: HKCU; Subkey: Software\Embarcadero\BDS\19.0\Transfer\{#ConstAppName}; ValueType: string; ValueName: "Path"; ValueData: "{app}\{#ConstAppExeName}"; Tasks: delphitools 
Root: HKCU; Subkey: Software\Embarcadero\BDS\19.0\Transfer\{#ConstAppName}; ValueType: string; ValueName: "Title"; ValueData: "{#ConstAppName}"; Tasks: delphitools
Root: HKCU; Subkey: Software\Embarcadero\BDS\19.0\Transfer\{#ConstAppName}; ValueType: string; ValueName: "WorkingDir"; ValueData: "{app}"; Tasks: delphitools
; 20.0
Root: HKCU; Subkey: Software\Embarcadero\BDS\20.0\Transfer\{#ConstAppName}; ValueType: string; ValueName: "Params"; ValueData: ""; Tasks: delphitools 
Root: HKCU; Subkey: Software\Embarcadero\BDS\20.0\Transfer\{#ConstAppName}; ValueType: string; ValueName: "Path"; ValueData: "{app}\{#ConstAppExeName}"; Tasks: delphitools 
Root: HKCU; Subkey: Software\Embarcadero\BDS\20.0\Transfer\{#ConstAppName}; ValueType: string; ValueName: "Title"; ValueData: "{#ConstAppName}"; Tasks: delphitools
Root: HKCU; Subkey: Software\Embarcadero\BDS\20.0\Transfer\{#ConstAppName}; ValueType: string; ValueName: "WorkingDir"; ValueData: "{app}"; Tasks: delphitools

[Run]
Filename: "{app}\{#ConstAppExeName}"; WorkingDir: "{app}"; Flags: postinstall shellexec nowait runasoriginaluser skipifsilent; Description: "Launch {#ConstAppName}"


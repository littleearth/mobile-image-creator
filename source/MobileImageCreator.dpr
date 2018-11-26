// JCL_DEBUG_EXPERT_GENERATEJDBG OFF
// JCL_DEBUG_EXPERT_INSERTJDBG OFF
// JCL_DEBUG_EXPERT_DELETEMAPFILE OFF
program MobileImageCreator;

uses
  FMX.Forms,
  frmMobileImageCreatorU in 'frmMobileImageCreatorU.pas' {frmMobileImageCreator},
  FrameRatio in 'FrameRatio.pas' {RatioFrame: TFrame},
  iOSOptset in 'iOSOptset.pas',
  AndroidOptset in 'AndroidOptset.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMobileImageCreator, frmMobileImageCreator);
  Application.Run;
end.

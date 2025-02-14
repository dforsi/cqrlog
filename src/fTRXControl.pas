(*
 ***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License.        *
 *                                                                         *
 ***************************************************************************
*)


unit fTRXControl;

{$mode objfpc}{$H+}


interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, inifiles, process, lcltype, Buttons, Menus, ActnList, dynlibs,
  uRigControl, Types;

type

  { TfrmTRXControl }

  TfrmTRXControl = class(TForm)
    acMem : TActionList;
    acAddModMem : TAction;
    btn10m : TButton;
    btn12m : TButton;
    btn15m : TButton;
    btn160m : TButton;
    btn17m : TButton;
    btn20m : TButton;
    btn2m : TButton;
    btn30m : TButton;
    btn40m : TButton;
    btn6m : TButton;
    btn70cm : TButton;
    btn80m : TButton;
    btnCW : TButton;
    btnMemDwn : TButton;
    btnMemWri : TButton;
    btnMemUp : TButton;
    btnSSB : TButton;
    btnRTTY : TButton;
    btnAM : TButton;
    btnFM : TButton;
    btnVFOA : TButton;
    btnVFOB : TButton;
    btPoff : TButton;
    btnUsr2 : TButton;
    btPon : TButton;
    btnUsr1 : TButton;
    btPstby : TButton;
    btnUsr3 : TButton;
    edtFreqInput : TEdit;
    edtMemNr : TEdit;
    gbBand : TGroupBox;
    gbFreq : TGroupBox;
    gbMode : TGroupBox;
    gbInfo : TGroupBox;
    gbVfo : TGroupBox;
    GroupBox4 : TGroupBox;
    lblFreq : TLabel;
    mnuShowUsr : TMenuItem;
    mnuShowInfo : TMenuItem;
    mnuShowVfo : TMenuItem;
    mnuOpenMem : TMenuItem;
    mnuPref : TMenuItem;
    mnuAddMod : TMenuItem;
    mnuShowPwr : TMenuItem;
    mnuProgPref : TMenuItem;
    mnuMem : TMainMenu;
    pnlUsr : TPanel;
    pnlRig : TPanel;
    pnlMain : TPanel;
    pnlPower : TPanel;
    rbRadio1 : TRadioButton;
    rbRadio2 : TRadioButton;
    tmrRadio : TTimer;
    procedure acAddModMemExecute(Sender : TObject);
    procedure btnMemWriClick(Sender : TObject);
    procedure btnMemDwnClick(Sender : TObject);
    procedure btnMemUpClick(Sender : TObject);
    procedure btnVFOAClick(Sender : TObject);
    procedure btnVFOBClick(Sender : TObject);
    procedure btPoffClick(Sender : TObject);
    procedure btPonClick(Sender : TObject);
    procedure btPstbyClick(Sender : TObject);
    procedure btnUsr1Click(Sender : TObject);
    procedure btnUsr2Click(Sender : TObject);
    procedure btnUsr3Click(Sender : TObject);
    procedure edtFreqInputKeyPress(Sender : TObject; var Key : Char);
    procedure edtFreqInputKeyUp(Sender : TObject; var Key : Word; Shift : TShiftState);
    procedure edtFreqInputMouseLeave(Sender : TObject);
    procedure edtFreqInputMouseUp(Sender : TObject; Button : TMouseButton;
      Shift : TShiftState; X, Y : Integer);
    procedure edtFreqInputMouseWheel(Sender : TObject; Shift : TShiftState;
      WheelDelta : Integer; MousePos : TPoint; var Handled : Boolean);
    procedure FormClose(Sender : TObject; var CloseAction : TCloseAction);
    procedure FormCreate(Sender : TObject);
    procedure FormDestroy(Sender : TObject);
    procedure FormKeyDown(Sender : TObject; var Key : Word; Shift : TShiftState);
    procedure FormKeyUp(Sender : TObject; var Key : Word; Shift : TShiftState);
    procedure FormShow(Sender : TObject);
    procedure btn10mClick(Sender : TObject);
    procedure btn12mClick(Sender : TObject);
    procedure btn15mClick(Sender : TObject);
    procedure btn160mClick(Sender : TObject);
    procedure btn17mClick(Sender : TObject);
    procedure btn20mClick(Sender : TObject);
    procedure btn2mClick(Sender : TObject);
    procedure btn30mClick(Sender : TObject);
    procedure btn40mClick(Sender : TObject);
    procedure btn6mClick(Sender : TObject);
    procedure btn70cmClick(Sender : TObject);
    procedure btn80mClick(Sender : TObject);
    procedure btnAMClick(Sender : TObject);
    procedure btnCWClick(Sender : TObject);
    procedure btnFMClick(Sender : TObject);
    procedure btnRTTYClick(Sender : TObject);
    procedure btnSSBClick(Sender : TObject);
    procedure gbFreqClick(Sender : TObject);
    procedure lblFreqClick(Sender : TObject);
    procedure mnuShowInfoClick(Sender : TObject);
    procedure mnuShowPwrClick(Sender : TObject);
    procedure mnuProgPrefClick(Sender : TObject);
    procedure mnuShowUsrClick(Sender : TObject);
    procedure mnuShowVfoClick(Sender : TObject);
    procedure rbRadio1Click(Sender : TObject);
    procedure rbRadio2Click(Sender : TObject);
    procedure tmrRadioTimer(Sender : TObject);
  private
    MouseWheelUsed : Boolean;
    radio : TRigControl;
    old_mode : String;

    btn160MBand : String;
    btn80MBand : String;
    btn40MBand : String;
    btn30MBand : String;
    btn20MBand : String;
    btn17MBand : String;
    btn15MBand : String;
    btn12MBand : String;
    btn10MBand : String;
    btn6MBand : String;
    btn2MBand : String;
    btn70CMBand : String;

    function GetActualMode : String;
    function GetModeNumber(mode : String) : Cardinal;
    procedure SetMode(mode : String; bandwidth : Integer);
    procedure ClearButtonsColor;
    procedure UpdateModeButtons(mode : String);
    procedure UserButton(r, b : Char);
  public
    AutoMode : Boolean;
    infosetstage : Integer;
    infosetfreq : String;
    procedure SynTRX;

    function GetFreqFromModeBand(band : Integer; smode : String) : String;
    function GetModeFreqNewQSO(var mode, freq : String) : Boolean;
    function GetBandWidth(mode : String) : Integer;
    function GetModeBand(var mode, band : String) : Boolean;
    function InicializeRig : Boolean;
    function GetFreqHz : Double;
    function GetFreqkHz : Double;
    function GetFreqMHz : Double;
    function GetDislayFreq : String;
    function GetRawMode : String;

    procedure SetModeFreq(mode, freq : String);
    procedure SetFreqModeBandWidth(freq : Double; mode : String; BandWidth : Integer);
    procedure SavePosition;
    procedure CloseRigs;
    procedure Split(up : Integer);
    procedure DisableSplit;
    procedure ClearRIT;
    procedure DisableRitXit;
    procedure LoadUsrButtonCaptions;
    procedure LoadButtonCaptions;
    procedure SetDebugMode(DebugMode : Boolean);
    procedure LoadBandButtons;
    function ListModeClose : Boolean;
    procedure HLTune(start : Boolean);
  end;

var
  frmTRXControl : TfrmTRXControl;
  ModeWas : String;  //store mode while tuning with AM
  BwWas : Integer;
  Tuning : Boolean = False;
  MemRelated : Boolean;

implementation

{$R *.lfm}

{ TfrmTRXControl }
uses dUtils, dData, fNewQSO, fBandMap, uMyIni, fGrayline, fRadioMemories;

procedure TfrmTRXControl.HLTune(start : Boolean);
begin
  if Assigned(radio) then
  begin
    if start then
    begin
      if not Tuning then
      begin
        ModeWas := GetActualMode;
        BwWas := GetBandWidth(ModeWas);
        SetMode('AM', 0);
        radio.PttOn;
        Tuning := True;
      end;
    end
    else begin
      radio.PttOff;
      if Tuning then SetMode(ModeWas, BwWas);
      Tuning := False;
    end;
  end;
end;

procedure TfrmTRXControl.SynTRX;
var
  b : String = '';
  f : Double;
  m : String;
  oldG : Integer;
  mG : Integer;
  txlo : Double = 0.0;
  rxlo : Double = 0.0;
begin
  if Assigned(radio) then
  begin
    f := radio.GetFreqMHz;
    m := radio.GetModeOnly;
    if cqrini.ReadBool('NewQSO', 'UseTXLO', False) then
    begin
      if not TryStrToFloat(cqrini.ReadString('NewQSO', 'TXLO', ''), txlo) then
        txlo := 0;
    end;
    if cqrini.ReadBool('NewQSO', 'UseRXLO', False) then
    begin
      if not TryStrToFloat(cqrini.ReadString('NewQSO', 'RXLO', ''), rxlo) then
        rxlo := 0;
      if (f + rxlo <> 0) then
        if not frmNewQSO.cbOffline.Checked then
          frmNewQSO.edtRXFreq.Text := FloatToStr((f + rxlo));
    end;
  end
  else
    f := 0;

  f := f + txlo;
  lblFreq.Caption := FormatFloat(empty_freq, f);

  UpdateModeButtons(m);
  ClearButtonsColor;
  // this waits5 rig polls before lock freq set by memory. After that if freq chanfǵes (by vfo knob) clean info text
  // stupid but works quite well
  case infosetstage of
    4: begin
      infosetfreq := lblFreq.Caption;
      Inc(infosetstage);
    end;
    5: begin
      if (infosetfreq <> lblFreq.Caption) then
      begin
        edtMemNr.Text := '';
        infosetstage := 0;
      end;
    end;
    else
      if ((infosetstage > 0) and (infosetstage < 4)) then Inc(infosetstage);
  end;
  if (f = 0) then
  begin
    if cqrini.ReadBool('BandMap', 'UseNewQSOFreqMode', False) then
    begin
      if TryStrToFloat(frmNewQSO.cmbFreq.Text, f) then
      begin
        b := dmUtils.GetBandFromFreq(frmNewQSO.cmbFreq.Text);
        m := frmNewQSO.cmbMode.Text;
        frmGrayline.band := b;
        frmBandMap.CurrentBand := b;
        frmBandMap.CurrentFreq := f * 1000;
        frmBandMap.CurrentMode := m;
      end;
    end
    else begin
      frmGrayline.band := '';
      frmBandMap.CurrentBand := '';
      frmBandMap.CurrentFreq := 0;
      frmBandMap.CurrentMode := '';
    end;
    exit;
  end;

  m := radio.GetRawMode;

  //user changed settings
  if MemRelated <> cqrini.ReadBool('TRX', 'MemModeRelated', False) then
  begin
    MemRelated := cqrini.ReadBool('TRX', 'MemModeRelated', False);
    dmData.OpenFreqMemories(m);
  end
  else begin
    if MemRelated then   //use related settings;
    begin
      //Group1 'LSB','USB','FM','AM'
      //Group2 'RTTY','PKTLSB','PKTUSB','PKTFM','DATA'
      case old_mode of
        'LSB', 'USB', 'FM', 'AM': oldG := 1;
        'RTTY', 'PKTLSB', 'PKTUSB', 'PKTFM', 'DATA': oldG := 2;
        else
          oldG := 0; //CW  or unlisted
      end;
      case m of
        'LSB', 'USB', 'FM', 'AM': mG := 1;
        'RTTY', 'PKTLSB', 'PKTUSB', 'PKTFM', 'DATA': mG := 2;
        else
          mG := 0; //CW  or unlisted
      end;
      if (oldG <> mG) then
      begin
        old_mode := m;
        dmData.OpenFreqMemories(old_mode);
      end;
    end;
  end;

  if (b = '') then
    b := dmUtils.GetBandFromFreq(lblFreq.Caption);
  if b = btn160MBand then
    btn160m.Font.Color := clRed
  else if b = btn80MBand then
    btn80m.Font.Color := clRed
  else if b = btn40MBand then
    btn40m.Font.Color := clRed
  else if b = btn30MBand then
    btn30m.Font.Color := clRed
  else if b = btn20MBand then
    btn20m.Font.Color := clRed
  else if b = btn17MBand then
    btn17m.Font.Color := clRed
  else if b = btn15MBand then
    btn15m.Font.Color := clRed
  else if b = btn12MBand then
    btn12m.Font.Color := clRed
  else if b = btn10MBand then
    btn10m.Font.Color := clRed
  else if b = btn6MBand then
    btn6m.Font.Color := clRed
  else if b = btn2MBand then
    btn2m.Font.Color := clRed
  else if b = btn70CMBand then
    btn70cm.Font.Color := clRed;
  frmGrayline.band := b;
  frmBandMap.CurrentBand := b;
  frmBandMap.CurrentFreq := f * 1000;
  frmBandMap.CurrentMode := m;
  if Assigned(radio) then
            pnlPower.Enabled:=radio.Power;
end;

function TfrmTRXControl.GetModeNumber(mode : String) : Cardinal;
begin
  Result := 0;
  if mode = 'AM' then
    Result := 3;
  if mode = 'CW' then
    Result := 0;
  if mode = 'LSB' then
    Result := 1;
  if mode = 'USB' then
    Result := 1;
  if mode = 'RTTY' then
    Result := 2;
  if mode = 'FM' then
    Result := 4;
  if mode = 'WFM' then
    Result := 4;
end;

function TfrmTRXControl.GetBandWidth(mode : String) : Integer;
var
  section : String;
begin
  if rbRadio1.Checked then
    section := 'Band1'
  else
    section := 'Band2';
  Result := 500;
  if (mode = 'LSB') or (mode = 'USB') then
    mode := 'SSB';
  if mode = 'CW' then
    Result := (cqrini.ReadInteger(section, 'CW', 500));
  if mode = 'SSB' then
    Result := (cqrini.ReadInteger(section, 'SSB', 1800));
  if mode = 'RTTY' then
    Result := (cqrini.ReadInteger(section, 'RTTY', 500));
  if mode = 'AM' then
    Result := (cqrini.ReadInteger(section, 'AM', 3000));
  if mode = 'FM' then
    Result := (cqrini.ReadInteger(section, 'FM', 2500));
end;

procedure TfrmTRXControl.FormShow(Sender : TObject);
begin
  LoadUsrButtonCaptions;
  LoadButtonCaptions;
  LoadBandButtons;
  dmUtils.LoadWindowPos(frmTRXControl);
  rbRadio1.Caption := cqrini.ReadString('TRX1', 'Desc', 'Radio 1');
  rbRadio2.Caption := cqrini.ReadString('TRX2', 'Desc', 'Radio 2');
  old_mode := '';
  MemRelated := cqrini.ReadBool('TRX', 'MemModeRelated', False);
  gbInfo.Visible := cqrini.ReadBool('TRX', 'MemShowInfo', gbInfo.Visible);
  mnuShowInfo.Checked := gbInfo.Visible;
  gbVfo.Visible := cqrini.ReadBool('TRX', 'ShowVfo', gbVfo.Visible);
  pnlUsr.Visible := cqrini.ReadBool('TRX', 'ShowUsr', pnlUsr.Visible);
  mnuShowVfo.Checked := gbVfo.Visible;
  mnuShowUsr.Checked := pnlUsr.Visible;
  MouseWheelUsed := False;
end;

procedure TfrmTRXControl.btn10mClick(Sender : TObject);
var
  freq : String = '';
  mode : String = '';
begin
  ClearButtonsColor;
  mode := GetActualMode;
  freq := GetFreqFromModeBand(8, mode);
  SetModeFreq(mode, freq);
  btn10m.Font.Color := clRed;
  frmTRXControl.edtMemNr.Text := ''; //clear memo nr display if any text from last M push
end;

procedure TfrmTRXControl.btn12mClick(Sender : TObject);
var
  freq : String = '';
  mode : String = '';
begin
  ClearButtonsColor;
  mode := GetActualMode;
  freq := GetFreqFromModeBand(7, mode);
  SetModeFreq(mode, freq);
  btn12m.Font.Color := clRed;
  frmTRXControl.edtMemNr.Text := ''; //clear memo nr display if any text from last M push
end;

procedure TfrmTRXControl.btn15mClick(Sender : TObject);
var
  freq : String = '';
  mode : String = '';
begin
  ClearButtonsColor;
  mode := GetActualMode;
  freq := GetFreqFromModeBand(6, mode);
  SetModeFreq(mode, freq);
  btn15m.Font.Color := clRed;
  frmTRXControl.edtMemNr.Text := ''; //clear memo nr display if any text from last M push
end;

procedure TfrmTRXControl.btn160mClick(Sender : TObject);
var
  freq : String = '';
  mode : String = '';
begin
  ClearButtonsColor;
  mode := GetActualMode;
  freq := GetFreqFromModeBand(0, mode);
  SetModeFreq(mode, freq);
  btn160m.Font.Color := clRed;
  frmTRXControl.edtMemNr.Text := ''; //clear memo nr display if any text from last M push
end;

procedure TfrmTRXControl.btn17mClick(Sender : TObject);
var
  freq : String = '';
  mode : String = '';
begin
  ClearButtonsColor;
  mode := GetActualMode;
  freq := GetFreqFromModeBand(5, mode);
  SetModeFreq(mode, freq);
  btn17m.Font.Color := clRed;
  frmTRXControl.edtMemNr.Text := ''; //clear memo nr display if any text from last M push
end;

procedure TfrmTRXControl.btn20mClick(Sender : TObject);
var
  freq : String = '';
  mode : String = '';
begin
  ClearButtonsColor;
  mode := GetActualMode;
  freq := GetFreqFromModeBand(4, mode);
  SetModeFreq(mode, freq);
  btn20m.Font.Color := clRed;
  frmTRXControl.edtMemNr.Text := ''; //clear memo nr display if any text from last M push
end;

procedure TfrmTRXControl.btn2mClick(Sender : TObject);
var
  freq : String = '';
  mode : String = '';
begin
  ClearButtonsColor;
  mode := GetActualMode;
  freq := GetFreqFromModeBand(10, mode);
  SetModeFreq(mode, freq);
  btn2m.Font.Color := clRed;
  frmTRXControl.edtMemNr.Text := ''; //clear memo nr display if any text from last M push
end;

procedure TfrmTRXControl.btn30mClick(Sender : TObject);
var
  freq : String = '';
  mode : String = '';
begin
  ClearButtonsColor;
  mode := GetActualMode;
  freq := GetFreqFromModeBand(3, mode);
  SetModeFreq(mode, freq);
  btn30m.Font.Color := clRed;
  frmTRXControl.edtMemNr.Text := ''; //clear memo nr display if any text from last M push
end;

procedure TfrmTRXControl.btn40mClick(Sender : TObject);
var
  freq : String = '';
  mode : String = '';
begin
  ClearButtonsColor;
  mode := GetActualMode;
  freq := GetFreqFromModeBand(2, mode);
  SetModeFreq(mode, freq);
  btn40m.Font.Color := clRed;
  frmTRXControl.edtMemNr.Text := ''; //clear memo nr display if any text from last M push
end;

procedure TfrmTRXControl.btn6mClick(Sender : TObject);
var
  freq : String = '';
  mode : String = '';
begin
  ClearButtonsColor;
  mode := GetActualMode;
  freq := GetFreqFromModeBand(9, mode);
  SetModeFreq(mode, freq);
  btn6m.Font.Color := clRed;
  frmTRXControl.edtMemNr.Text := ''; //clear memo nr display if any text from last M push
end;

procedure TfrmTRXControl.btn70cmClick(Sender : TObject);
var
  freq : String = '';
  mode : String = '';
begin
  ClearButtonsColor;
  mode := GetActualMode;
  freq := GetFreqFromModeBand(11, mode);
  SetModeFreq(mode, freq);
  btn70cm.Font.Color := clRed;
  frmTRXControl.edtMemNr.Text := ''; //clear memo nr display if any text from last M push
end;

procedure TfrmTRXControl.btn80mClick(Sender : TObject);
var
  freq : String = '';
  mode : String = '';
begin
  ClearButtonsColor;
  mode := GetActualMode;
  freq := GetFreqFromModeBand(1, mode);
  SetModeFreq(mode, freq);
  btn80m.Font.Color := clRed;
  frmTRXControl.edtMemNr.Text := ''; //clear memo nr display if any text from last M push
end;

procedure TfrmTRXControl.btnVFOAClick(Sender : TObject);
begin
  if Assigned(radio) then radio.SetCurrVfo(VFOA);
end;

procedure TfrmTRXControl.btnVFOBClick(Sender : TObject);
begin
  if Assigned(radio) then radio.SetCurrVfo(VFOB);
end;

procedure TfrmTRXControl.btnCWClick(Sender : TObject);
begin
  frmTRXControl.edtMemNr.Text := ''; //clear memo nr display if any text from last M push
  SetMode('CW', GetBandWidth('CW'));
end;

procedure TfrmTRXControl.btnSSBClick(Sender : TObject);
var
  tmp : Currency;
begin
  frmTRXControl.edtMemNr.Text := ''; //clear memo nr display if any text from last M push
  if not TryStrToCurr(lblFreq.Caption, tmp) then
    SetMode('LSB', GetBandWidth('SSB'))
  else begin
    if (tmp > 5) and (tmp < 6) then
      SetMode('USB', GetBandWidth('SSB'))
    else begin
      if tmp > 10 then
        SetMode('USB', GetBandWidth('SSB'))
      else
        SetMode('LSB', GetBandWidth('SSB'));
    end;
  end;
end;

procedure TfrmTRXControl.gbFreqClick(Sender : TObject);
begin
  edtFreqInput.Text := lblFreq.Caption;
  edtFreqInput.Font := lblFreq.Font;
  edtFreqInput.Color := clYellow;
  edtFreqInput.Visible := True;
  edtFreqInput.SetFocus;
  edtFreqInput.SelStart := Length(edtFreqInput.Text);
end;

procedure TfrmTRXControl.lblFreqClick(Sender : TObject);
begin
  gbFreqClick(Sender);
end;

procedure TfrmTRXControl.mnuShowInfoClick(Sender : TObject);
begin
  gbInfo.Visible := not gbInfo.Visible;
  mnuShowInfo.Checked := gbInfo.Visible;
  cqrini.WriteBool('TRX', 'MemShowInfo', gbInfo.Visible);
end;

procedure TfrmTRXControl.btnRTTYClick(Sender : TObject);
begin
  frmTRXControl.edtMemNr.Text := ''; //clear memo nr display if any text from last M push
  SetMode('RTTY', GetBandWidth('RTTY'));
end;

procedure TfrmTRXControl.btnAMClick(Sender : TObject);
begin
  frmTRXControl.edtMemNr.Text := ''; //clear memo nr display if any text from last M push
  SetMode('AM', GetBandWidth('AM'));
end;

procedure TfrmTRXControl.btnFMClick(Sender : TObject);
begin
  frmTRXControl.edtMemNr.Text := ''; //clear memo nr display if any text from last M push
  SetMode('FM', GetBandWidth('FM'));
end;

procedure TfrmTRXControl.mnuShowPwrClick(Sender : TObject);
begin
  if pnlPower.Visible then
  begin
    pnlPower.Visible := False;
    mnuShowPwr.Checked := False;
  end
  else begin
    pnlPower.Visible := True;
    mnuShowPwr.Checked := True;
  end;
  cqrini.WriteBool('TRX', 'PowerButtons', pnlPower.Visible);
end;

procedure TfrmTRXControl.mnuProgPrefClick(Sender : TObject);
begin
  cqrini.WriteInteger('Pref', 'ActPageIdx', 5);
  //set TRXControl tab active. Number may change if preferences page change
  frmNewQSO.acPreferences.Execute;
end;

procedure TfrmTRXControl.mnuShowUsrClick(Sender : TObject);
begin
  pnlUsr.Visible := not pnlUsr.Visible;
  mnuShowUsr.Checked := pnlUsr.Visible;
  cqrini.WriteBool('TRX', 'ShowUsr', pnlUsr.Visible);
end;

procedure TfrmTRXControl.mnuShowVfoClick(Sender : TObject);
begin
  gbVfo.Visible := not gbVfo.Visible;
  mnuShowVfo.Checked := gbVfo.Visible;
  cqrini.WriteBool('TRX', 'ShowVfo', gbVfo.Visible);
end;

procedure TfrmTRXControl.rbRadio1Click(Sender : TObject);
begin
  LoadUsrButtonCaptions;
  InicializeRig;
end;

procedure TfrmTRXControl.rbRadio2Click(Sender : TObject);
begin
  LoadUsrButtonCaptions;
  InicializeRig;
end;

procedure TfrmTRXControl.tmrRadioTimer(Sender : TObject);
begin
  SynTRX;
end;

procedure TfrmTRXControl.FormClose(Sender : TObject; var CloseAction : TCloseAction);
begin
  dmUtils.SaveWindowPos(frmTRXControl);
end;

function TfrmTRXControl.ListModeClose : Boolean;

begin
  Result := False;
  if (frmRadioMemories <> nil) then
    if (frmRadioMemories.ShowMode) then   //is open in show list mode
    begin
      FreeAndNil(frmRadioMemories);
      Result := True;
    end;
end;

procedure TfrmTRXControl.acAddModMemExecute(Sender : TObject);

begin
  ListModeClose;
  frmRadioMemories := TfrmRadioMemories.Create(frmTRXControl);
  if Sender = mnuOpenMem then    //show only
  begin
    frmRadioMemories.Show;
    frmRadioMemories.Panel1.Visible := False;
    frmRadioMemories.ShowMode := True;
    try
      dmData.LoadFreqMemories(frmRadioMemories.sgrdMem);
    except
      on E : Exception do
        ShowMessage('Could not load memories: ' + E.ClassName + #13#10 + E.Message);
    end;
  end
  else begin
    try
      dmData.LoadFreqMemories(frmRadioMemories.sgrdMem);
      frmRadioMemories.ShowModal;
      if frmRadioMemories.ModalResult = mrOk then
      begin
        dmData.StoreFreqMemories(frmRadioMemories.sgrdMem);
      end
    finally
      FreeAndNil(frmRadioMemories);
    end;
  end;

end;

procedure TfrmTRXControl.btnMemWriClick(Sender : TObject);
var
  bandwidth : Word = 0;
  mode : String = '';
  freq : String = '';
  Dfreq : Double;

begin
  Dfreq := 0;
  Dfreq := radio.GetFreqkHz;
  if Dfreq > 0 then
  begin
    ListModeClose;
    frmRadioMemories := TfrmRadioMemories.Create(frmTRXControl);
    try
      dmData.LoadFreqMemories(frmRadioMemories.sgrdMem);
      bandwidth := radio.GetPassOnly;
      mode := radio.GetRawMode;
      freq := FloatToStrF(Dfreq, ffGeneral, 15, 0);
      if (mode <> '') then
      begin
        frmRadioMemories.sgrdMem.RowCount := frmRadioMemories.sgrdMem.RowCount + 1;
        frmRadioMemories.sgrdMem.Cells[0, frmRadioMemories.sgrdMem.RowCount - 1] := freq;
        frmRadioMemories.sgrdMem.Cells[1, frmRadioMemories.sgrdMem.RowCount - 1] := mode;
        frmRadioMemories.sgrdMem.Cells[2, frmRadioMemories.sgrdMem.RowCount - 1] :=
          IntToStr(bandwidth);
        dmData.StoreFreqMemories(frmRadioMemories.sgrdMem);
        edtMemNr.Font.Color := clRed;
        edtMemNr.Text := 'MW ok';
        infosetstage := 1;
      end
    finally
      FreeAndNil(frmRadioMemories);
    end;
  end;
end;

procedure TfrmTRXControl.btnMemDwnClick(Sender : TObject);
var
  freq : Double;
  mode : String;
  bandwidth : Integer;
  info : String;
begin
  dmData.GetNextFreqFromMem(freq, mode, bandwidth, info);
  if dmData.DebugLevel >= 1 then
    writeln('--------------FMWI', freq, ' ', mode, ' ', bandwidth, ' ', info);
  if freq > 0 then
    SetFreqModeBandWidth(freq, mode, bandwidth);
end;

procedure TfrmTRXControl.btnMemUpClick(Sender : TObject);
var
  freq : Double;
  mode : String;
  bandwidth : Integer;
  info : String;
begin
  dmData.GetPreviousFreqFromMem(freq, mode, bandwidth, info);
  if freq > 0 then
    SetFreqModeBandWidth(freq, mode, bandwidth);
end;

procedure TfrmTRXControl.btPoffClick(Sender : TObject);
begin
  if Assigned(radio) then
  begin
    radio.PwrOff;
    btPon.Font.Color := clDefault;
    btPstby.Font.Color := clDefault;
    btPoff.Font.Color := clRed;
  end;
end;

procedure TfrmTRXControl.btPonClick(Sender : TObject);
begin
  if Assigned(radio) then
  begin
    radio.PwrOn;
    btPon.Font.Color := clRed;
    btPstby.Font.Color := clDefault;
    btPoff.Font.Color := clDefault;
  end;
end;

procedure TfrmTRXControl.btPstbyClick(Sender : TObject);
begin
  if Assigned(radio) then
  begin
    radio.PwrStBy;
    btPon.Font.Color := clDefault;
    btPstby.Font.Color := clRed;
    btPoff.Font.Color := clDefault;
  end;
end;

procedure TfrmTRXControl.UserButton(r, b : Char);
var
  c : String;
begin
  c := trim(cqrini.ReadString('TRX' + r, 'usr' + b, ''));
  if pos('RUN', uppercase(c)) = 1 then
  begin
    c := trim(copy(c, 4, length(c)));
    dmutils.RunOnBackground(c);
  end
  else
    radio.UsrCmd(c);
end;

procedure TfrmTRXControl.btnUsr1Click(Sender : TObject);
var
  r : Char;
begin
  if Assigned(radio) then
  begin
    if rbRadio1.Checked then  r := '1'
    else
      r := '2';
    UserButton(r, '1');
  end;
end;

procedure TfrmTRXControl.btnUsr2Click(Sender : TObject);
var
  r : Char;
begin
  if Assigned(radio) then
  begin
    if rbRadio1.Checked then  r := '1'
    else
      r := '2';
    UserButton(r, '2');
  end;
end;

procedure TfrmTRXControl.btnUsr3Click(Sender : TObject);
var
  r : Char;
begin
  if Assigned(radio) then
  begin
    if rbRadio1.Checked then  r := '1'
    else
      r := '2';
    UserButton(r, '3');
  end;
end;


procedure TfrmTRXControl.edtFreqInputKeyPress(Sender : TObject; var Key : Char);
begin
  if key = '.' then
  begin
    if pos('.', edtFreqInput.Text) > 0 then         //only one dot
      Key := #0;
  end
  else
  if (Key <> #127)      //delete and numbers ok
    and ((Key > '9') or ((Key >= #20) and (Key < '0'))) then
    Key := #0;
end;


procedure TfrmTRXControl.edtFreqInputKeyUp(Sender : TObject; var Key : Word;
  Shift : TShiftState);
var
  freq : String = '';
  mode : String = '';
  s : String;
  f : Currency;
begin
  if Key = VK_Return then
  begin
    MouseWheelUsed := False;
    s := edtFreqInput.Text;
    mode := GetActualMode;
    try
      f := StrToFloat(s);
      f := f * 1000;
      freq := FloatToStr(f);
      SetModeFreq(mode, freq);
    except
      On E : Exception do
        edtFreqInput.Text := s;
    end;
    edtFreqInput.Visible := False;
  end;
end;

procedure TfrmTRXControl.edtFreqInputMouseLeave(Sender : TObject);
begin
  if MouseWheelUsed then
    edtFreqInputMouseUp(nil, mbMiddle, [ssCtrl], 0, 0);
end;

procedure TfrmTRXControl.edtFreqInputMouseUp(Sender : TObject;
  Button : TMouseButton; Shift : TShiftState; X, Y : Integer);
var
  Key : Word = VK_Return;
begin
  edtFreqInputKeyUp(nil, Key, Shift);
end;

procedure TfrmTRXControl.edtFreqInputMouseWheel(Sender : TObject;
  Shift : TShiftState; WheelDelta : Integer; MousePos : TPoint; var Handled : Boolean);
var
  s : String;
  f : Currency;
  m : Currency;
begin
  MouseWheelUsed := True;
  m := 0.0001;   //base 10Hz step
  if Shift = [ssShift] then
    m := 0.001;
  if Shift = [ssCtrl] then
    m := 0.01;
  if Shift = [ssShift] + [ssCtrl] then
    m := 1;
  if WheelDelta < 0 then
    m := m * -1;

  s := edtFreqInput.Text;
  try
    f := StrToFloat(s);
    f := f + m;
    if f < 0 then f := 0;
    edtFreqInput.Text := FormatFloat(empty_freq + ';;', f);
    if Assigned(radio) then
      radio.SetFreqKHz(f * 1000);
  except
    On E : Exception do
      edtFreqInput.Text := s;
  end;
end;

procedure TfrmTRXControl.FormCreate(Sender : TObject);
begin
  Radio := nil;
  AutoMode := True;
end;

procedure TfrmTRXControl.FormDestroy(Sender : TObject);
begin
  if dmData.DebugLevel >= 1 then Writeln('Closing TRXControl window');
end;

procedure TfrmTRXControl.FormKeyDown(Sender : TObject; var Key : Word;
  Shift : TShiftState);
begin
  if (Shift = [ssAlt]) and (key = VK_F) then
  begin
    dmUtils.EnterFreq;
    key := 0;
  end;
  if (Shift = [ssCTRL]) then
    if key in [VK_1..VK_9] then frmNewQSO.SetSplit(chr(key));
  if ((Shift = [ssCTRL]) and (key = VK_0)) then
    DisableSplit;
end;

procedure TfrmTRXControl.FormKeyUp(Sender : TObject; var Key : Word;
  Shift : TShiftState);
begin
  if (key = VK_ESCAPE) then
  begin
    frmNewQSO.ReturnToNewQSO;
    key := 0;
  end;
end;

function TfrmTRXControl.InicializeRig : Boolean;
var
  n : String = '';
  id : Integer = 0;
  port : Integer;
  poll : Integer;
  KeyerType : Integer;
begin
  tmrRadio.Enabled := False;

  if Assigned(radio) then FreeAndNil(radio);

  Application.ProcessMessages;
  Sleep(500);
  Application.ProcessMessages;

  if rbRadio1.Checked then  n := '1'
  else
    n := '2';

  radio := TRigControl.Create;

  if (dmData.DebugLevel > 0) or cqrini.ReadBool('TRX', 'Debug', False) then
    radio.DebugMode := True;

  if not TryStrToInt(cqrini.ReadString('TRX' + n, 'model', ''), id) then
    radio.RigId := 1
  else
    radio.RigId := id;

  //broken configuration caused crash because RigCtldPort was empty
  //probably late to change it to Integer, I have no idea if the current
  //setting would be converted automatically or user has to do it again :(
  if not TryStrToInt(cqrini.ReadString('TRX' + n, 'RigCtldPort', '4532'), port) then
    port := 4532;

  if not TryStrToInt(cqrini.ReadString('TRX' + n, 'poll', '500'), poll) then
    poll := 500;

  radio.RigCtldPath := cqrini.ReadString('TRX', 'RigCtldPath', '/usr/bin/rigctld');
  radio.RigCtldArgs := dmUtils.GetRadioRigCtldCommandLine(StrToInt(n));
  radio.RunRigCtld := cqrini.ReadBool('TRX' + n, 'RunRigCtld', False);
  radio.RigDevice := cqrini.ReadString('TRX' + n, 'device', '');
  radio.RigCtldPort := port;
  radio.RigCtldHost := cqrini.ReadString('TRX' + n, 'host', 'localhost');
  radio.RigPoll := poll;
  radio.RigSendCWR := cqrini.ReadBool('TRX' + n, 'CWR', False);
  radio.RigChkVfo := cqrini.ReadBool('TRX' + n, 'ChkVfo', True);
  tmrRadio.Interval := radio.RigPoll;
  tmrRadio.Enabled := True;
  Result := True;

  pnlPower.Visible := cqrini.ReadBool('TRX', 'PowerButtons', False);
  mnuShowPwr.Checked := pnlPower.Visible;



  if not radio.Connected then
      begin
        FreeAndNil(radio);
      end
  else  //radio changed, restart CW interface
    begin
      //we check this again although preferences prevent false setting
      if (cqrini.ReadBool('CW', 'NoReset', False) //is set: user does not want reset
        and (cqrini.ReadInteger('CW', 'Type1', 0) =
        cqrini.ReadInteger('CW', 'Type2', 0)) //both keyers are same
        and (cqrini.ReadInteger('CW', 'Type1', 0) <> 4)  //type is not HamLib
        ) then //no restart keyer it is same device for both radios.
            begin
              if ((dmData.DebugLevel >= 1) or ((abs(dmData.DebugLevel) and 8) = 8)) then
                Writeln('User ask: No reset and keyer not Hamlib: No restart by TRControl radio'
                  + n + ' change');
            end
      else
        Begin
          frmNewQSO.InitializeCW;
          if ((dmData.DebugLevel >= 1) or ((abs(dmData.DebugLevel) and 8) = 8)) then
            Writeln('CW keyer reloaded by TRControl radio' + n + ' change');
        end;

    end;
end;

procedure TfrmTRXControl.SetMode(mode : String; bandwidth : Integer);
var
  rmode : TRigMode;
begin
  if Assigned(radio) then
  begin
    rmode.mode := mode;
    rmode.pass := bandwidth;
    radio.SetModePass(rmode);
  end;
end;

function TfrmTRXControl.GetFreqFromModeBand(band : Integer; smode : String) : String;
var
  freq : Currency = 0;
  mode : Integer = 0;
begin
  if smode = 'CW' then
    mode := 0
  else if smode = 'SSB' then
    mode := 1
  else if smode = 'RTTY' then
    mode := 2
  else if smode = 'AM' then
    mode := 3
  else if smode = 'FM' then
    mode := 4;

  case band of
    0: begin
      case mode of
        0: freq := cqrini.ReadFloat('DefFreq', '160cw', 1830);
        1: freq := cqrini.ReadFloat('DefFreq', '160ssb', 1830);
        2: freq := cqrini.ReadFloat('DefFreq', '160rtty', 1845);
        3: freq := cqrini.ReadFloat('DefFreq', '160am', 1845);
        4: freq := cqrini.ReadFloat('DefFreq', '160fm', 1845);
      end; //case
    end;

    1: begin
      case mode of
        0: freq := cqrini.ReadFloat('DefFreq', '80cw', 3525);
        1: freq := cqrini.ReadFloat('DefFreq', '80ssb', 3750);
        2: freq := cqrini.ReadFloat('DefFreq', '80rtty', 3590);
        3: freq := cqrini.ReadFloat('DefFreq', '80am', 3750);
        4: freq := cqrini.ReadFloat('DefFreq', '80fm', 3750);
      end; //case
    end;

    2: begin
      case mode of
        0: freq := cqrini.ReadFloat('DefFreq', '40cw', 7015);
        1: freq := cqrini.ReadFloat('DefFreq', '40ssb', 7080);
        2: freq := cqrini.ReadFloat('DefFreq', '40rtty', 7040);
        3: freq := cqrini.ReadFloat('DefFreq', '40am', 7080);
        4: freq := cqrini.ReadFloat('DefFreq', '40fm', 7080);
      end; //case
    end;

    3: begin
      case mode of
        0: freq := cqrini.ReadFloat('DefFreq', '30cw', 10110);
        1: freq := cqrini.ReadFloat('DefFreq', '30ssb', 10130);
        2: freq := cqrini.ReadFloat('DefFreq', '30rtty', 10130);
        3: freq := cqrini.ReadFloat('DefFreq', '30am', 10130);
        4: freq := cqrini.ReadFloat('DefFreq', '30fm', 10130);
      end; //case
    end;

    4: begin
      case mode of
        0: freq := cqrini.ReadFloat('DefFreq', '20cw', 14025);
        1: freq := cqrini.ReadFloat('DefFreq', '20ssb', 14195);
        2: freq := cqrini.ReadFloat('DefFreq', '20rtty', 14090);
        3: freq := cqrini.ReadFloat('DefFreq', '20am', 14195);
        4: freq := cqrini.ReadFloat('DefFreq', '20fm', 14195);
      end; //case
    end;

    5: begin
      case mode of
        0: freq := cqrini.ReadFloat('DefFreq', '17cw', 18080);
        1: freq := cqrini.ReadFloat('DefFreq', '17ssb', 18140);
        2: freq := cqrini.ReadFloat('DefFreq', '17rtty', 18110);
        3: freq := cqrini.ReadFloat('DefFreq', '17am', 18140);
        4: freq := cqrini.ReadFloat('DefFreq', '17fm', 18140);
      end; //case
    end;

    6: begin
      case mode of
        0: freq := cqrini.ReadFloat('DefFreq', '15cw', 21025);
        1: freq := cqrini.ReadFloat('DefFreq', '15ssb', 21255);
        2: freq := cqrini.ReadFloat('DefFreq', '15rtty', 21090);
        3: freq := cqrini.ReadFloat('DefFreq', '15am', 21255);
        4: freq := cqrini.ReadFloat('DefFreq', '15fm', 21255);
      end; //case
    end;

    7: begin
      case mode of
        0: freq := cqrini.ReadFloat('DefFreq', '12cw', 24895);
        1: freq := cqrini.ReadFloat('DefFreq', '12ssb', 24925);
        2: freq := cqrini.ReadFloat('DefFreq', '12rtty', 24910);
        3: freq := cqrini.ReadFloat('DefFreq', '12am', 24925);
        4: freq := cqrini.ReadFloat('DefFreq', '12fm', 24925);
      end; //case
    end;

    8: begin
      case mode of
        0: freq := cqrini.ReadFloat('DefFreq', '10cw', 28025);
        1: freq := cqrini.ReadFloat('DefFreq', '10ssb', 28550);
        2: freq := cqrini.ReadFloat('DefFreq', '10rtty', 28090);
        3: freq := cqrini.ReadFloat('DefFreq', '10am', 28550);
        4: freq := cqrini.ReadFloat('DefFreq', '10fm', 28550);
      end; //case
    end;

    9: begin
      case mode of
        0: freq := cqrini.ReadFloat('DefFreq', '6cw', 50090);
        1: freq := cqrini.ReadFloat('DefFreq', '6ssb', 51300);
        2: freq := cqrini.ReadFloat('DefFreq', '6rtty', 51300);
        3: freq := cqrini.ReadFloat('DefFreq', '6am', 51300);
        4: freq := cqrini.ReadFloat('DefFreq', '6fm', 51300);
      end; //case
    end;

    10: begin
      case mode of
        0: freq := cqrini.ReadFloat('DefFreq', '2cw', 144050);
        1: freq := cqrini.ReadFloat('DefFreq', '2ssb', 144300);
        2: freq := cqrini.ReadFloat('DefFreq', '2rtty', 144300);
        3: freq := cqrini.ReadFloat('DefFreq', '2am', 144300);
        4: freq := cqrini.ReadFloat('DefFreq', '2fm', 145300);
      end; //case
    end;

    11: begin
      case mode of
        0: freq := cqrini.ReadFloat('DefFreq', '70cw', 3525);
        1: freq := cqrini.ReadFloat('DefFreq', '70ssb', 3750);
        2: freq := cqrini.ReadFloat('DefFreq', '70rtty', 3590);
        3: freq := cqrini.ReadFloat('DefFreq', '70am', 3750);
        4: freq := cqrini.ReadFloat('DefFreq', '70fm', 3750);
      end; //case
    end;

  end; //case
  if dmData.DebugLevel >= 3 then
    Writeln(freq);
  Result := FloatToStr(freq);
  if dmData.DebugLevel >= 3 then
    Writeln(Result);
end;

function TfrmTRXControl.GetActualMode : String;
begin
  if Assigned(radio) then
  begin
    Result := radio.GetModeOnly;
  end;
end;

procedure TfrmTRXControl.SetFreqModeBandWidth(freq : Double; mode : String;
  BandWidth : Integer);
var
  rmode : TRigMode;
  RXOffset : Currency;
  TXOffset : Currency;
begin
  if mode = 'SSB' then
  begin
    if (freq > 5000) and (freq < 6000) then
      mode := 'USB'
    else begin
      if freq > 10000 then
        mode := 'USB'
      else
        mode := 'LSB';
    end;
  end;

  if Assigned(radio) then
  begin
    dmData.GetRXTXOffset(freq / 1000, RXOffset, TXOffset);
    radio.RXOffset := RXOffset;
    radio.TXOffset := TXOffset;

    radio.SetFreqKHz(freq);
    if AutoMode then
    begin
      rmode.mode := mode;
      rmode.pass := BandWidth;
      radio.SetModePass(rmode);
    end;
  end;
end;

procedure TfrmTRXControl.SetModeFreq(mode, freq : String); //freq in kHz
var
  bandwidth : Integer = 0;
  f : Double = 0;
begin
  if (lblFreq.Caption = empty_freq) then
    exit;
  bandwidth := GetBandWidth(mode);
  f := StrToFloat(freq);
  if mode = 'SSB' then
  begin
    if (f > 5000) and (f < 6000) then
      mode := 'USB'
    else begin
      if f > 10000 then
        mode := 'USB'
      else
        mode := 'LSB';
    end;
  end;

  SetFreqModeBandWidth(f, mode, bandwidth);
end;

function TfrmTRXControl.GetModeFreqNewQSO(var mode, freq : String) : Boolean;
begin
  Result := False;
  if not Assigned(radio) then exit;
  //without this sets old freq as mode (!) if switched from radio to non existing radio
  if not ((lblFreq.Caption = empty_freq) or (lblFreq.Caption = '')) then
    Result := True
  else
    exit;
  freq := lblFreq.Caption;
  mode := GetActualMode;
end;

procedure TfrmTRXControl.SavePosition;
begin
  dmUtils.SaveWindowPos(frmTRXControl);
end;

procedure TfrmTRXControl.ClearButtonsColor;
begin
  btn160m.Font.Color := COLOR_WINDOWTEXT;
  btn80m.Font.Color := COLOR_WINDOWTEXT;
  btn40m.Font.Color := COLOR_WINDOWTEXT;
  btn30m.Font.Color := COLOR_WINDOWTEXT;
  btn20m.Font.Color := COLOR_WINDOWTEXT;
  btn17m.Font.Color := COLOR_WINDOWTEXT;
  btn15m.Font.Color := COLOR_WINDOWTEXT;
  btn12m.Font.Color := COLOR_WINDOWTEXT;
  btn10m.Font.Color := COLOR_WINDOWTEXT;
  btn6m.Font.Color := COLOR_WINDOWTEXT;
  btn2m.Font.Color := COLOR_WINDOWTEXT;
  btn70cm.Font.Color := COLOR_WINDOWTEXT;
end;

function TfrmTRXControl.GetModeBand(var mode, band : String) : Boolean;
var
  freq : String;
begin
  mode := '';
  band := '';
  Result := True;
  freq := lblFreq.Caption;
  mode := GetActualMode;
  if (freq = empty_freq) or (freq = '') then
    Result := False
  else
    band := dmUtils.GetBandFromFreq(freq);
end;

procedure TfrmTRXControl.CloseRigs;
begin
  if dmData.DebugLevel > 0 then
    WriteLn('Closing rigs... ');

  if Assigned(radio) then
    FreeAndNil(radio);
end;

procedure TfrmTRXControl.UpdateModeButtons(mode : String);
begin
  btnCW.Font.Color := COLOR_WINDOWTEXT;
  btnSSB.Font.Color := COLOR_WINDOWTEXT;
  btnRTTY.Font.Color := COLOR_WINDOWTEXT;
  btnAM.Font.Color := COLOR_WINDOWTEXT;
  btnFM.Font.Color := COLOR_WINDOWTEXT;
  if mode = 'CW' then
    btnCW.Font.Color := clRed
  else
  if mode = 'SSB' then
    btnSSB.Font.Color := clRed
  else
  if mode = 'RTTY' then
    btnRTTY.Font.Color := clRed
  else
  if mode = 'AM' then
    btnAM.Font.Color := clRed
  else
  if mode = 'FM' then
    btnFM.Font.Color := clRed;

  if Assigned(radio) then
  begin
     if radio.CanGetVfo then
     begin
      case radio.GetCurrVFO of
      VFOA: begin
              btnVFOA.Font.Color := clRed;
              btnVFOB.Font.Color := clDefault;
            end;
      VFOB: begin
              btnVFOB.Font.Color := clRed;
              btnVFOA.Font.Color := clDefault;
            end;
      end;
     end
    else
     begin
      btnVFOB.Font.Color := clDefault;
      btnVFOA.Font.Color := clDefault;
     end;
  end;
end;

procedure TfrmTRXControl.Split(Up : Integer);

begin
  //we do split with XIT, no need to play with 2 VFOs
  if Assigned(radio) then
  begin
    radio.SetSplit(up);
  end;
end;

procedure TfrmTRXControl.DisableSplit;
begin
  if Assigned(radio) then  radio.DisableSplit;
end;

function TfrmTRXControl.GetFreqHz : Double;
begin
  if Assigned(radio) then
    Result := radio.GetFreqHz
  else
    Result := 0;
end;

function TfrmTRXControl.GetFreqkHz : Double;
begin
  if Assigned(radio) then
    Result := radio.GetFreqKHz
  else
    Result := 0;
end;

function TfrmTRXControl.GetFreqMHz : Double;
begin
  if Assigned(radio) then
    Result := radio.GetFreqMHz
  else
    Result := 0;
end;

function TfrmTRXControl.GetDislayFreq : String;
begin
  if Assigned(radio) then
    Result := FormatFloat(empty_freq + ';;', radio.GetFreqMHz)
  else
    Result := FormatFloat(empty_freq + ';;', 0);
end;

procedure TfrmTRXControl.ClearRIT;
begin
  if (lblFreq.Caption = empty_freq) then
    exit;
  radio.ClearRit;
  radio.ClearXit;   //this clears Xit too
end;

procedure TfrmTRXControl.DisableRitXit;
begin
  if not Assigned(radio) then
    exit;
  radio.DisableRit;
  radio.DisableSplit;   //this disabeles Xit
end;

procedure TfrmTRXControl.LoadUsrButtonCaptions;
var
  r : Char;
begin
  if rbRadio1.Checked then r := '1'
  else
    r := '2';
  btnUsr1.Caption := cqrini.ReadString('TRX' + r, 'usr1name', 'Usr1');
  btnUsr2.Caption := cqrini.ReadString('TRX' + r, 'usr2name', 'Usr2');
  btnUsr3.Caption := cqrini.ReadString('TRX' + r, 'usr3name', 'Usr3');
end;

procedure TfrmTRXControl.LoadButtonCaptions;
begin
  btn160m.Caption := cqrini.ReadString('DefFreq', '160btn', '160m');
  btn80m.Caption := cqrini.ReadString('DefFreq', '80btn', '80m');
  btn40m.Caption := cqrini.ReadString('DefFreq', '40btn', '40m');
  btn30m.Caption := cqrini.ReadString('DefFreq', '30btn', '30m');
  btn20m.Caption := cqrini.ReadString('DefFreq', '20btn', '20m');
  btn17m.Caption := cqrini.ReadString('DefFreq', '17btn', '17m');
  btn15m.Caption := cqrini.ReadString('DefFreq', '15btn', '15m');
  btn12m.Caption := cqrini.ReadString('DefFreq', '12btn', '12m');
  btn10m.Caption := cqrini.ReadString('DefFreq', '10btn', '10m');
  btn6m.Caption := cqrini.ReadString('DefFreq', '6btn', '6m');
  btn2m.Caption := cqrini.ReadString('DefFreq', '2btn', '2m');
  btn70cm.Caption := cqrini.ReadString('DefFreq', '70btn', '70cm');
end;

procedure TfrmTRXControl.SetDebugMode(DebugMode : Boolean);
begin
  if Assigned(radio) then
  begin
    radio.DebugMode := DebugMode;
  end;
end;

function TfrmTRXControl.GetRawMode : String;
begin
  if Assigned(radio) then
    Result := radio.GetRawMode
  else
    Result := '';
end;

procedure TfrmTRXControl.LoadBandButtons;
begin
  btn160MBand := dmUtils.GetBandFromFreq(
    FloatToStr(cqrini.ReadFloat('DefFreq', '160cw', 1830) / 1000));
  btn80MBand := dmUtils.GetBandFromFreq(
    FloatToStr(cqrini.ReadFloat('DefFreq', '80cw', 3525) / 1000));
  btn40MBand := dmUtils.GetBandFromFreq(
    FloatToStr(cqrini.ReadFloat('DefFreq', '40cw', 7015) / 1000));
  btn30MBand := dmUtils.GetBandFromFreq(
    FloatToStr(cqrini.ReadFloat('DefFreq', '30cw', 10110) / 1000));
  btn20MBand := dmUtils.GetBandFromFreq(
    FloatToStr(cqrini.ReadFloat('DefFreq', '20cw', 14025) / 1000));
  btn17MBand := dmUtils.GetBandFromFreq(
    FloatToStr(cqrini.ReadFloat('DefFreq', '17cw', 18080) / 1000));
  btn15MBand := dmUtils.GetBandFromFreq(
    FloatToStr(cqrini.ReadFloat('DefFreq', '15cw', 21025) / 1000));
  btn12MBand := dmUtils.GetBandFromFreq(
    FloatToStr(cqrini.ReadFloat('DefFreq', '12cw', 24895) / 1000));
  btn10MBand := dmUtils.GetBandFromFreq(
    FloatToStr(cqrini.ReadFloat('DefFreq', '10cw', 28025) / 1000));
  btn6MBand := dmUtils.GetBandFromFreq(
    FloatToStr(cqrini.ReadFloat('DefFreq', '6cw', 50090) / 1000));
  btn2MBand := dmUtils.GetBandFromFreq(
    FloatToStr(cqrini.ReadFloat('DefFreq', '2cw', 144050) / 1000));
  btn70CMBand := dmUtils.GetBandFromFreq(
    FloatToStr(cqrini.ReadFloat('DefFreq', '70cw', 430000) / 1000));
end;

end.

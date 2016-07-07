object MainForm: TMainForm
  Left = 276
  Top = 194
  Caption = 'Chromium Embedded'
  ClientHeight = 652
  ClientWidth = 864
  Color = clBtnFace
  TransparentColor = True
  TransparentColorValue = clFuchsia
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter: TSplitter
    Left = 0
    Top = 430
    Width = 864
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    Visible = False
  end
  object Chromium: TChromium
    Left = 0
    Top = 25
    Width = 864
    Height = 405
    Align = alClient
    DefaultUrl = 'http://www.google.com'
    TabOrder = 0
    OnProcessMessageReceived = ChromiumProcessMessageReceived
    OnLoadStart = ChromiumLoadStart
    OnLoadEnd = ChromiumLoadEnd
    OnBeforeContextMenu = ChromiumBeforeContextMenu
    OnContextMenuCommand = ChromiumContextMenuCommand
    OnAddressChange = ChromiumAddressChange
    OnTitleChange = ChromiumTitleChange
    OnStatusMessage = ChromiumStatusMessage
    OnBeforeDownload = ChromiumBeforeDownload
    OnDownloadUpdated = ChromiumDownloadUpdated
    OnBeforePopup = ChromiumBeforePopup
    OnBeforeResourceLoad = ChromiumBeforeResourceLoad
    OnCertificateError = ChromiumCertificateError
  end
  object DevTools: TChromiumDevTools
    Left = 0
    Top = 433
    Width = 864
    Height = 200
    Align = alBottom
    Visible = False
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 633
    Width = 864
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object PanelNavigation: TPanel
    Left = 0
    Top = 0
    Width = 864
    Height = 25
    Align = alTop
    TabOrder = 2
    DesignSize = (
      864
      25)
    object ButtonBack: TSpeedButton
      Left = 0
      Top = 0
      Width = 23
      Height = 22
      Action = ActionPrev
    end
    object ButtonForward: TSpeedButton
      Left = 24
      Top = 0
      Width = 23
      Height = 22
      Action = ActionNext
    end
    object ButtonHome: TSpeedButton
      Left = 48
      Top = 0
      Width = 23
      Height = 22
      Action = ActionHome
    end
    object ButtonReload: TSpeedButton
      Left = 72
      Top = 0
      Width = 23
      Height = 22
      Action = ActionReload
    end
    object ButtonGoto: TSpeedButton
      Left = 841
      Top = 0
      Width = 23
      Height = 22
      Action = ActionGoTo
      Anchors = [akTop, akRight]
    end
    object EditAddress: TEdit
      Left = 95
      Top = 0
      Width = 744
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Text = 'http://www.google.com'
      OnKeyPress = EditAddressKeyPress
    end
  end
  object ActionList: TActionList
    Left = 624
    Top = 112
    object ActionPrev: TAction
      Caption = '<-'
      Enabled = False
      OnExecute = ActionPrevExecute
      OnUpdate = ActionPrevUpdate
    end
    object ActionNext: TAction
      Caption = '->'
      Enabled = False
      OnExecute = ActionNextExecute
      OnUpdate = ActionNextUpdate
    end
    object ActionHome: TAction
      Caption = 'H'
      OnExecute = ActionHomeExecute
      OnUpdate = ActionHomeUpdate
    end
    object ActionReload: TAction
      Caption = 'R'
      OnExecute = ActionReloadExecute
      OnUpdate = ActionReloadUpdate
    end
    object ActionGoTo: TAction
      Caption = '>'
      OnExecute = ActionGoToExecute
    end
    object ActionGetSource: TAction
      Caption = 'Get source'
      OnExecute = ActionGetSourceExecute
    end
    object ActionGetText: TAction
      Caption = 'Get text'
      OnExecute = ActionGetTextExecute
    end
    object ActionZoomIn: TAction
      Caption = 'Zoom in'
      OnExecute = ActionZoomInExecute
    end
    object ActionZoomOut: TAction
      Caption = 'Zoom out'
      OnExecute = ActionZoomOutExecute
    end
    object ActionZoomReset: TAction
      Caption = 'Zoom reset'
      OnExecute = ActionZoomResetExecute
    end
    object ActionExecuteJS: TAction
      Caption = 'Execute JavaScript'
      OnExecute = ActionExecuteJSExecute
    end
    object ActionDom: TAction
      Caption = 'Hook DOM'
      OnExecute = ActionDomExecute
    end
    object ActionDevTool: TAction
      AutoCheck = True
      Caption = 'Show DevTools'
      OnExecute = ActionDevToolExecute
    end
    object ActionDoc: TAction
      Caption = 'Documentation'
      OnExecute = ActionDocExecute
    end
    object ActionGroup: TAction
      Caption = 'Google group'
      OnExecute = ActionGroupExecute
    end
    object ActionFileScheme: TAction
      Caption = 'File Scheme'
      OnExecute = ActionFileSchemeExecute
    end
    object ActionPrint: TAction
      Caption = 'Print'
      OnExecute = ActionPrintExecute
    end
  end
  object MainMenu: TMainMenu
    Left = 624
    Top = 56
    object MenuItemFile: TMenuItem
      Caption = '&File'
      object MenuItemPrint: TMenuItem
        Action = ActionPrint
      end
      object MenuItemExit: TMenuItem
        Caption = 'Exit'
        ShortCut = 16465
        OnClick = MenuItemExitClick
      end
    end
    object MenuItemTest: TMenuItem
      Caption = '&Test'
      object MenuItemGetSource: TMenuItem
        Action = ActionGetSource
      end
      object MenuItemGetText: TMenuItem
        Action = ActionGetText
      end
      object MenuItemExecuteJavaScript: TMenuItem
        Action = ActionExecuteJS
      end
      object MenuItemZoomIn: TMenuItem
        Action = ActionZoomIn
      end
      object MenuItemZoomOut: TMenuItem
        Action = ActionZoomOut
      end
      object MenuItemZoomReset: TMenuItem
        Action = ActionZoomReset
      end
      object MenuItemFileScheme: TMenuItem
        Action = ActionFileScheme
      end
      object MenuItemVisitDOM: TMenuItem
        Action = ActionDom
      end
      object MenuItemDevTools: TMenuItem
        Action = ActionDevTool
        AutoCheck = True
        ShortCut = 123
      end
    end
    object MenuItemHelp: TMenuItem
      Caption = 'Help'
      object MenuItemDocumentation: TMenuItem
        Action = ActionDoc
      end
      object MenuItemGoogleGroup: TMenuItem
        Action = ActionGroup
      end
    end
  end
  object SaveDialog: TSaveDialog
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 624
    Top = 176
  end
end

�
 TMAINFORM 0T  TPF0	TMainFormMainFormLeft)Top� WidthdHeight�CaptionNot connectedFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style PositionpoScreenCenterOnCreate
FormCreatePixelsPerInchx
TextHeight TPanelToolBarLeft Top Width\Height&AlignalTopTabOrder TSpeedButton
ConnectBtnLeftTopWidthHeightHintConnect
Glyph.Data
z  v  BMv      v   (                                       �  �   �� �   � � ��   ���   �  �   �� �   � � ��  ��� UUUUUUP UUUUUUWwUUUUUUP�UUUUUU��UUUUUP �UUUUUWwWUUUUUP��UUUUU��WUUUUP ;UUUUWwUuUUUU ��UUUUUwUWUUUUU;UU��_UuUW  �UUWwuwuWUUp��;UUwUWuUuUU����UUUUUUWUUU���UUUU�UUUU��UUUWUu�UUw���UUUu�uUW�UUP�3��UUUW_UUW�UUU��UUUUu��wUUUUW  uUUUUWwwuUUU	NumGlyphsParentShowHintShowHint	OnClickConnectBtnClick  	TComboBox	TableListLeft(TopWidthHeightTabStopStylecsDropDownList
ItemHeightTabOrder OnChangeTableListChange   TStringGridGridLeft TopLWidth\Height/AlignalClientOptionsgoFixedVertLinegoFixedHorzLine
goVertLine
goHorzLinegoRangeSelectgoColSizinggoRowSelectgoThumbTracking TabOrder   
TStatusBar	StatusBarLeft Top{Width\HeightPanels SimplePanel	  TPanel
XPortPanelLeft Top&Width\Height&AlignalTopTabOrder TSpeedButton	ImportBtnLeftTopWidthHeightHintImport
Glyph.Data
j  f  BMf      v   (               �                       �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� 3333333333  0      333  0x�����333  0�wwww�333  0��www�333  0�����p333  0      333  3333333333  303333333  303333333  30330     30030���  3000�DO  38   0���  33�  0�DO  33300���  333030�O   333330�� 3  333330  3  3333333333  ParentShowHintShowHint	OnClickImportBtnClick  TSpeedButton	ExportBtnLeft(TopWidthHeightHintExport
Glyph.Data
j  f  BMf      v   (               �                       �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� 3333333333  333        333�����  333wwwwx  333�wwwx  333�����  333        3333333333  3333333 33  3333330 3  0   3   3  0���33 33  0�DO33 33  0���38 33  0�DO  33  0���  �33  0�O 33333  0�� 333333  0  333333  3333333333  ParentShowHintShowHint	OnClickExportBtnClick  TLabelColumnLabelLeftLTop	WidthbHeightCaptionColumnLabelFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont   TOracleSessionMainSessionLeftTTop  TOracleQueryTablesQuerySQL.Strings?select distinct owner||'.'||table_name tab from all_tab_columnswhere data_type = 'LONG RAW'order by tab SessionMainSessionCursorcrHourGlassLefttTop  TOracleLogonOracleLogonSessionMainSessionOptions
ldDatabase Left4Top  TOracleQuerySelectQuerySQL.Strings select t.*, rowid from <table> t SessionMainSessionCursorcrHourGlassLeft�Top  TOpenDialog
OpenDialogOptionsofHideReadOnlyofPathMustExistofFileMustExist Left4Top,  TSaveDialog
SaveDialogOptionsofOverwritePromptofHideReadOnlyofPathMustExist LeftTTop,  TOracleQueryGetLongRawQuerySQL.Stringsselect <column> from <table>where rowid = :this_row SessionMainSession
ReadBufferVariables.Data
!         	   :THIS_ROW           CursorcrHourGlassLeft�Top  TOracleQueryPutLongRawQuerySQL.Stringsupdate <table>set <column> = :this_columnwhere rowid = :this_row SessionMainSession
ReadBufferVariables.Data
=         	   :THIS_ROW              :THIS_COLUMN           CursorcrHourGlassLeft�Top   
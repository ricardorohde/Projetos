�
 TMAINFORM 0�  TPF0	TMainFormMainFormLeftqTop� Width�Height�Caption#Multi Tier Department/Employee demoColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrder	PositionpoScreenCenterOnCreate
FormCreatePixelsPerInchx
TextHeight 
TStatusBar	StatusBarLeft TopoWidth�HeightPanels SimplePanel	  TPanelEmpPanelLeft Top� Width�Height� AlignalClientTabOrder TPanelEmpTopPanelLeftTopWidth�Height AlignalTop
BevelOuter	bvLoweredTabOrder  TDBNavigatorEmpDBNavigatorLeftTopWidth� Height
DataSourceEmpDataSourceVisibleButtonsnbFirstnbPriornbNextnbLastnbInsertnbDeletenbEditnbPostnbCancel TabOrder    TDBGrid	EmpDBGridLeftTop!Width�Height� AlignalClient
DataSourceEmpDataSourceTabOrderTitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style    TPanel	DeptPanelLeft Top Width�Height� AlignalTopTabOrder TPanelDeptTopPanelLeftTopWidth�Height AlignalTop
BevelOuter	bvLoweredTabOrder  TSpeedButtonDeptApplyBtnLeft� TopWidthPHeightCaptionApplyFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontOnClickDeptApplyBtnClick  TSpeedButtonDeptCancelBtnLeftLTopWidthRHeightCaptionCancelFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontOnClickDeptCancelBtnClick  TDBNavigatorDeptDBNavigatorLeftTopWidth� Height
DataSourceDeptDataSourceTabOrder    TDBGrid
DeptDBGridLeftTop!Width�Height� AlignalClient
DataSourceDeptDataSourceTabOrderTitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style    TDataSourceDeptDataSourceDataSetDeptClientDataSetLeft(Top(  TDataSourceEmpDataSourceDataSetEmpClientDataSetLeft(TopT  TClientDataSetDeptClientDataSet
Aggregates Params ProviderNameDeptProviderRemoteServerDCOMConnectionOnReconcileErrorDeptClientDataSetReconcileErrorLeftTop( TIntegerFieldDeptClientDataSetDEPTNODisplayWidth	FieldNameDEPTNOProviderFlags
pfInUpdate	pfInWherepfInKey Required	MaxValuecMinValue�  TStringFieldDeptClientDataSetDNAME	FieldNameDNAMESize  TStringFieldDeptClientDataSetLOC	FieldNameLOCSize  TDataSetFieldDeptClientDataSetEmpDataSet	FieldName
EmpDataSetVisible   TClientDataSetEmpClientDataSet
Aggregates DataSetFieldDeptClientDataSetEmpDataSet	FieldDefsNameEMPNO
Attributes
faRequired DataType	ftInteger NameENAMEDataTypeftStringSize
 NameJOBDataTypeftStringSize	 NameMGRDataType	ftInteger NameHIREDATEDataType
ftDateTime NameSALDataTypeftFloat NameCOMMDataTypeftFloat NameDEPTNODataType	ftInteger  	IndexDefs ParamsDataTypeftStringNameDEPTNO	ParamTypeptInputValue10  	StoreDefs	OnNewRecordEmpClientDataSetNewRecordOnReconcileErrorEmpClientDataSetReconcileErrorLeftTopT TIntegerFieldEmpClientDataSetEMPNODisplayWidth	FieldNameEMPNOProviderFlags
pfInUpdate	pfInWherepfInKey Required	MaxValue'MinValue��  TStringFieldEmpClientDataSetENAME	FieldNameENAMERequired	Size
  TStringFieldEmpClientDataSetJOB	FieldNameJOBSize	  TIntegerFieldEmpClientDataSetMGRDisplayWidth	FieldNameMGRMaxValue'MinValue��  TDateTimeFieldEmpClientDataSetHIREDATE	FieldNameHIREDATERequired	  TFloatFieldEmpClientDataSetSALDisplayWidth
	FieldNameSALDisplayFormat	##,##0.00
EditFormat####0.00MaxValue ��Q��O�@MinValue ��Q��O��  TFloatFieldEmpClientDataSetCOMMDisplayWidth
	FieldNameCOMMDisplayFormat	##,##0.00
EditFormat####0.00MaxValue ��Q��O�@MinValue ��Q��O��  TIntegerFieldEmpClientDataSetDEPTNODisplayWidth	FieldNameDEPTNOVisibleMaxValuecMinValue�   TDCOMConnectionDCOMConnectionLoginPrompt	
ServerGUID&{50982DA9-5D34-11D3-BDA2-008048C61588}
ServerNameServer.ServerDMClassOnLoginDCOMConnectionLoginLeft�Top(   
�
 TQUEUEDEMOFORM 0c  TPF0TQueueDemoFormQueueDemoFormLeft�TopBorderStylebsDialogCaption
Queue DemoClientHeighttClientWidthPFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style PixelsPerInchx
TextHeight TPanelBottomPanelLeft TopKWidthPHeight)AlignalBottomFullRepaintTabOrder  TLabelEnterMessageLabelLeftTopWidth[Height	AlignmenttaRightJustifyCaptionEnter message  TButton
SendButtonLeft TopWidthKHeightCaptionSendDefault	EnabledTabOrder OnClickSendButtonClick  TEditSendMessageEditLefttTopWidth�HeightTabOrderOnChangeSendMessageEditChange   TPanelTopPanelLeft Top WidthPHeightKAlignalClientFullRepaintTabOrder TMemoReceiveMemoLeftTopWidthNHeightIAlignalClientFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameCourier New
Font.Style 
ParentFontTabOrder    TOracleSessionReceiveSessionCursorcrHourGlassDesignConnection	ConnectAscaNormal
ThreadSafePreferences.FloatPrecisionPreferences.IntegerPrecision Preferences.SmallIntPrecisionPreferences.UseOCI7Preferences.ConvertCRLF	Preferences.TrimStringFields	Preferences.MaxStringFieldSize Preferences.ZeroDateIsNull	Preferences.NullLOBIsEmptyPreferences.NullObjectIsEmptyPreferences.TemporaryLOBtlCachePreferences.TimestampAsStringPoolingspNone
MTSOptions
moImplicitmoUniqueServer RollbackOnDisconnect	NullValuenvUnAssignedSQLTracestUnchangedOptimizerGoalogUnchangedIsolationLevelilUnchangedBytesPerCharacterbcAutoDetectStatementCacheStatementCacheSize	ConnectedLeftTop  TOracleLogonLogonSessionSendSessionRetriesOptionsldAuto
ldDatabaseldDatabaseListldLogonHistoryldConnectAs AliasDropDownCountHistorySizeHistoryWithPasswordCaptionburpLeftTop$  TOracleSessionSendSessionCursorcrHourGlassDesignConnection	ConnectAscaNormal
ThreadSafePreferences.FloatPrecisionPreferences.IntegerPrecision Preferences.SmallIntPrecisionPreferences.UseOCI7Preferences.ConvertCRLF	Preferences.TrimStringFields	Preferences.MaxStringFieldSize Preferences.ZeroDateIsNull	Preferences.NullLOBIsEmptyPreferences.NullObjectIsEmptyPreferences.TemporaryLOBtlCachePreferences.TimestampAsStringPoolingspNone
MTSOptions
moImplicitmoUniqueServer RollbackOnDisconnect	NullValuenvUnAssignedSQLTracestUnchangedOptimizerGoalogUnchangedIsolationLevelilUnchangedBytesPerCharacterbcAutoDetectStatementCacheStatementCacheSize	ConnectedLeft(Top$  TOracleQueueReceiveQueueDebugCursor	crDefaultSessionReceiveSession	QueueNamedoa_demo_queueThreaded	ThreadSynchronized	EnqueueOptions.Visibility
evOnCommit EnqueueOptions.SequenceDeviation	esDefaultDequeueOptions.DequeueModedmRemoveDequeueOptions.NavigationdnNextMessageDequeueOptions.Visibility
dvOnCommitDequeueOptions.WaitMessageProperties.PriorityMessageProperties.Delay MessageProperties.Expiration�#MessageProperties.SenderId.Protocol OnThreadDequeuedReceiveQueueThreadDequeuedOnThreadStartReceiveQueueThreadStartOnThreadStopReceiveQueueThreadStopLeft$Top  TOracleQueue	SendQueueDebugCursor	crDefaultSessionSendSession	QueueNamedoa_demo_queueThreadedThreadSynchronizedEnqueueOptions.Visibility
evOnCommit EnqueueOptions.SequenceDeviation	esDefaultDequeueOptions.DequeueModedmRemoveDequeueOptions.NavigationdnNextMessageDequeueOptions.Visibility
dvOnCommitDequeueOptions.Wait�MessageProperties.PriorityMessageProperties.Delay MessageProperties.Expiration�#MessageProperties.SenderId.Protocol LeftHTop$  TOracleQueryQueueCheckQuerySQL.Strings select count(*) from user_queueswhere name = 'DOA_DEMO_QUEUE' SessionSendSession
ReadBufferOptimize	DebugCursor	crSQLWaitStringFieldsOnlyThreadedThreadSynchronized	
ScrollableLefthTop$  TOracleQueryRoleCheckQuerySQL.Strings$select count(*) from user_role_privs,where granted_role = 'AQ_ADMINISTRATOR_ROLE' SessionSendSession
ReadBufferOptimize	DebugCursor	crSQLWaitStringFieldsOnlyThreadedThreadSynchronized	
ScrollableLeft� Top$  TOracleScriptCreateQueueScriptSessionSendSessionDebugCursor	crSQLWaitLines.Strings)create type doa_demo_queue_type as object(  message_text varchar2(100),  message_type varchar2(20)); beginF  dbms_aqadm.create_queue_table(queue_table => 'doa_demo_queue_table',M                                queue_payload_type => 'doa_demo_queue_type');:  dbms_aqadm.create_queue(queue_name  => 'doa_demo_queue',A                          queue_table => 'doa_demo_queue_table');9  dbms_aqadm.start_queue(queue_name => 'doa_demo_queue');	  commit;end;/ 
AutoCommitExitOnError	ScanVariables	ColWidth(OutputOptionsooSQLooNonSQLooData
ooFeedbackooError OnErrorCreateQueueScriptErrorLeft� Top$   
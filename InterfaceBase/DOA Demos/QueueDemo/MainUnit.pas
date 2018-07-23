// Direct Oracle Access - QueueDemo
// Allround Automations
// support@allroundautomations.com
// http://www.allroundautomations.com
//
// This application demonstrates the TOracleQueue component:
// - Creation of a queue object, queue table, and the queue itself
// - Enqueueing a message
// - Dequeueing messages in a backgound thread

unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Oracle, OracleMonitor;

type
  TQueueDemoForm = class(TForm)
    BottomPanel: TPanel;
    SendButton: TButton;
    TopPanel: TPanel;
    SendMessageEdit: TEdit;
    EnterMessageLabel: TLabel;
    ReceiveMemo: TMemo;
    ReceiveSession: TOracleSession;
    Logon: TOracleLogon;
    SendSession: TOracleSession;
    ReceiveQueue: TOracleQueue;
    SendQueue: TOracleQueue;
    QueueCheckQuery: TOracleQuery;
    RoleCheckQuery: TOracleQuery;
    CreateQueueScript: TOracleScript;
    procedure SendButtonClick(Sender: TObject);
    procedure CreateQueueScriptError(Sender: TOracleScript);
    procedure SendMessageEditChange(Sender: TObject);
    procedure ReceiveQueueThreadDequeued(Sender: TOracleQueue);
    procedure ReceiveQueueThreadStart(Sender: TOracleQueue);
    procedure ReceiveQueueThreadStop(Sender: TOracleQueue);
  public
    QueueOkay: Boolean;
    procedure Display(const Msg: string);
    procedure StartQueue;
  end;

var
  QueueDemoForm: TQueueDemoForm;

implementation

{$R *.DFM}

// Display queue object creation errors
procedure TQueueDemoForm.CreateQueueScriptError(Sender: TOracleScript);
begin
  ShowMessage(Sender.CurrentCommand.ErrorMessage);
end;

// Connect the sessions and create the queue objects if necessary
procedure TQueueDemoForm.StartQueue;
begin
  try
    // Connect the session if necessary
    if not SendSession.Connected then
    begin
      QueueOkay := False;
      Logon.Execute;
      if SendSession.Connected then
      begin
        QueueOkay := True;
        // Copy logon properties and also connect the receiving session
        ReceiveSession.LogonUsername := SendSession.LogonUsername;
        ReceiveSession.LogonPassword := SendSession.LogonPassword;
        ReceiveSession.LogonDatabase := SendSession.LogonDatabase;
        ReceiveSession.LogOn;
        QueueCheckQuery.Execute;
        // Check if the queue exists
        if QueueCheckQuery.Field(0) = 0 then
        begin
          // If not, create it
          ShowMessage('Press OK to create the demo queue');
          // If user has the AQ_ADMINISTRATOR_ROLE role, create the objects
          RoleCheckQuery.Execute;
          if RoleCheckQuery.Field(0) = 0 then
            ShowMessage('You do not have the role ''AQ_ADMINISTRATOR_ROLE'', which'#13#10 +
                        'is a requirement to create queue objects. Please obtain'#13#10 +
                        'this role and run this demo again.')
          else
            CreateQueueScript.Execute;
          // Check if the queue exists now
          QueueCheckQuery.Execute;
          // If not, exit
          if QueueCheckQuery.Field(0) = 0 then
          begin
            Application.Terminate;
            QueueOkay := False;
          end;
        end;
      end;
    end;
  except
    on E:Exception do
    begin
      ShowMessage(E.Message);
      QueueOkay := False;
    end;
  end;
  if QueueOkay and not ReceiveQueue.ThreadIsRunning then ReceiveQueue.StartThread;
end;

// Send the message
procedure TQueueDemoForm.SendButtonClick(Sender: TObject);
begin
  // Try to connect, create the queue objects, and start it if necessary
  StartQueue;
  if not ReceiveQueue.ThreadIsRunning then Exit;
  // Create the message
  SendQueue.Payload.SetAttr('message_text', SendMessageEdit.Text);
  SendQueue.Payload.SetAttr('message_type', 'Info');
  // Send it
  SendQueue.Enqueue;
  // Commit
  SendSession.Commit;
end;

// Enable/Disable the send button
procedure TQueueDemoForm.SendMessageEditChange(Sender: TObject);
begin
  SendButton.Enabled := (SendMessageEdit.Text <> '');
end;

// Display a message in the receive memo
procedure TQueueDemoForm.Display(const Msg: string);
begin
  ReceiveMemo.Lines.Add(Msg);
end;

// Display a received message
procedure TQueueDemoForm.ReceiveQueueThreadDequeued(Sender: TOracleQueue);
begin
  Display('Message received: ' + Sender.MessageProperties.Msgid);
  Display('Message enqueued: ' + FormatDateTime('c', Sender.MessageProperties.EnqueueTime));
  Display('Message text    : ' + Sender.Payload.GetAttr('message_text'));
  Display('');
end;

// Display that the thread has started
procedure TQueueDemoForm.ReceiveQueueThreadStart(Sender: TOracleQueue);
begin
  Display(Sender.Name + ' started.');
  Display('');
end;

procedure TQueueDemoForm.ReceiveQueueThreadStop(Sender: TOracleQueue);
begin
  if not (csDestroying in ComponentState) then
  begin
    Display(Sender.Name + ' stopped.');
    Display('');
  end;
end;

end.

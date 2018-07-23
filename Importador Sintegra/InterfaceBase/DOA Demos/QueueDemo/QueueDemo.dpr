// Direct Oracle Access - QueueDemo
// Allround Automations
// support@allroundautomations.com
// http://www.allroundautomations.com
//
// This application demonstrates:
// - Creation of a queue object, queue table, and the queue itself
// - Enqueueing a message
// - Dequeueing messages in a backgound thread
program QueueDemo;

uses
  Forms,
  MainUnit in 'MainUnit.pas' {QueueDemoForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TQueueDemoForm, QueueDemoForm);
  Application.Run;
end.

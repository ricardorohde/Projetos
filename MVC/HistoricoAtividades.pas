unit HistoricoAtividades;                                                                                   
                                                                                            
interface                                                                                   
                                                                                            
uses                                                                                        
  Contnrs, HistoricoAtividade;                                                      
                                                                                            
type                                                                                        
  THistoricoAtividades = class(TObjectList)                                         
  private                                                                                   
    function GetItens(Index: Integer): THistoricoAtividade;                         
  public                                                                                    
    constructor Create;                                                                     
    destructor Destroy;override;                                                           
    function Add:THistoricoAtividade;                                              
    function Find(Data: Integer):THistoricoAtividade;                 
    property Items[Index: Integer]:THistoricoAtividade read GetItens;              
  end;                                                                                      
                                                                                            
implementation                                                                              
                                                                                            
uses Classes;                                                                               
                                                                                            
{ THistoricoAtividades }                                                            
                                                                                            
function THistoricoAtividades.Add: THistoricoAtividade;                     
begin                                                                                       
  Result := THistoricoAtividade.Create;                                             
  inherited Add(Result);                                                                    
end;                                                                                        
                                                                                            
constructor THistoricoAtividades.Create;                                            
begin                                                                                       
  OwnsObjects := True;                                                                      
end;                                                                                        
                                                                                            
destructor THistoricoAtividades.Destroy;                                            
begin                                                                                       
                                                                                            
  inherited Destroy;                                                                        
end;                                                                                        
                                                                                            
function THistoricoAtividades.Find(                                                 
  Data: Integer):THistoricoAtividade;                                 
var                                                                                         
  i: Integer;                                                                               
begin                                                                                       
  Result := nil;                                                                            
  for i := 0 to Count-1 do                                                                  
  begin                                                                                     
    if THistoricoAtividade(Items[i]).Data = Data then     
    begin                                                                                   
      Result := THistoricoAtividade(Items[i]);                                      
      Break;
    end;
  end;
end;
                                                                                            
function THistoricoAtividades.GetItens(                                                                     
  Index: Integer): THistoricoAtividade;                                                                    
begin                                                                                       
  Result := THistoricoAtividade(inherited items[index]);                                                   
end;                                                                                        
end.

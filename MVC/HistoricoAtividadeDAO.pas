unit HistoricoAtividadeDAO;                                                                              
                                                                                                        
interface                                                                                               
                                                                                                        
uses                                                                                                    
  Classes, HistoricoAtividade, SysUtils, uDadosConexao,                                                  
  untPhoenixTableUtils, PhQuery, HistoricoAtividades;                                                    
                                                                                                        
type                                                                                                    
  THistoricoAtividadeDAO = class                                                                         
  public                                                                                                
    constructor Create;                                                                                 
    destructor Destroy; override;                                                                       
    procedure Load(Data: Integer; AHistoricoAtividades: THistoricoAtividades);               
    procedure Save(AHistoricoAtividades: THistoricoAtividades);                                           
    procedure Delete(AHistoricoAtividade: THistoricoAtividade);                                           
                                                                                                        
  end;                                                                                                  
                                                                                                        
implementation                                                                                          
                                                                                                        
uses ResourceLoader, DB, Math, StrUtils, untSQLUtils;                                                   
                                                                                                        
                                                                                                        
{ THistoricoAtividadeDAO }                                                                               
                                                                                                        
constructor THistoricoAtividadeDAO.Create;                                                               
begin                                                                                                   
                                                                                                        
end;                                                                                                    
                                                                                                        
destructor THistoricoAtividadeDAO.Destroy;                                                               
begin                                                                                                   
                                                                                                        
  inherited Destroy;                                                                                    
end;                                                                                                    
                                                                                                        
procedure THistoricoAtividadeDAO.Load(Data: Integer;                                       
  AHistoricoAtividades: THistoricoAtividades);                                                            
var                                                                                                     
  QryDao: TPhQuery;                                                                                     
  HistoricoAtividade: THistoricoAtividade;                                                                
  sSQL:string;                                                                                          
begin                                                                                                   
  if AHistoricoAtividades = nil then                                                                     
    Exit;                                                                                               
                                                                                                        
  AHistoricoAtividades.Clear;                                                                            
                                                                                                        
  try                                                                                                   
    QryDao := CreatePhoenixQuery;                                                                       
    QryDao.Name := 'QryHistoricoAtividadeDAO';                                                     
    TResourceLoader.LoadResorceSQl(QryDao.SQL, '');                          
    sSQL := Format(QryDao.SQL.Text, [DadosConexao.Apelido]);                
    QryDAO.SQL.Text :=  sSQL;                                                                           
    QryDao.Open;                                                                                        
                                                                                                        
                                                                                                        
    while not QryDao.Eof do                                                                             
    begin                                                                                               
      HistoricoAtividade := AHistoricoAtividades.Add; 
      HistoricoAtividade.Historicoatividadecodigo := QryDao.FieldByName('Historicoatividadecodigo').AsInteger;
      HistoricoAtividade.Tipoempregado := QryDao.FieldByName('Tipoempregado').AsInteger;
      HistoricoAtividade.Empid := QryDao.FieldByName('Empid').AsInteger;
      HistoricoAtividade.Data := QryDao.FieldByName('Data').AsDateTime;
      HistoricoAtividade.Anexo := QryDao.FieldByName('Anexo').AsInteger;
      HistoricoAtividade.Phx_apelido := QryDao.FieldByName('Phx_apelido').AsString;
      HistoricoAtividade.Nomefuncionario := QryDao.FieldByName('Nomefuncionario').AsString;
      QryDao.Next;                                                                                      
    end;                                                                                                
                                                                                                        
  finally                                                                                               
    QryDao.Free;                                                                                        
  end;                                                                                                  
end;                                                                                                    
                                                                                                        
procedure THistoricoAtividadeDAO.Save( AHistoricoAtividades: THistoricoAtividades);                         
Const                                                                                                   
   SQL_INSERT = '';                                                                                   
begin                                                                                                   
 (* IMPLEMENTAR METODO SAVE *)                                                                          
end;                                                                                                    
                                                                                                        
procedure THistoricoAtividadeDAO.Delete(AHistoricoAtividade: THistoricoAtividade);                         
const                                                                                                   
  DAO_DELETE = '';                                                                                    
var                                                                                                     
  QryDao: TPhQuery;                                                                                     
begin                                                                                                   
  QryDao := CreatePhoenixQuery;                                                                         
  try                                                                                                   
    QryDao.SQL.Text := Format(DAO_DELETE, [DadosConexao.Apelido]);                                      
    QryDao.Name := '';                                                                                
    QryDao.ExecSQL;                                                                                     
  finally                                                                                               
    FreeAndNil(QryDao);                                                                                 
  end;                                                                                                  
end;                                                                                                     
                                                                                                         
end.

unit HistoricoAtividade;                                                                                       
                                                                                               
interface                                                                                      
                                                                                               
uses                                                                                           
  Classes;                                                                                     
                                                                                               
                                                                                               
type                                                                                           
  THistoricoAtividade = class                                                                                  
  private                                                                                     
  public                                                                                      
    constructor Create;                                                                         
    destructor Destroy;override;                                                                
    property Historicoatividadecodigo: Integer;
    property Tipoempregado: Integer;
    property Empid: Integer;
    property Data: TDateTime;
    property Anexo: Integer;
    property Phx_apelido: String;
    property Nomefuncionario: String;
  end;                                                                                        

implementation                                                                              

end.                                                                                           

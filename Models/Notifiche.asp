<%

' 
' This files defines the Notifiche model 
'

class Notifiche

 '=============================
 'Private properties
    private mId

    private mNome 'controller+action
    private mOggetto
    private mMessaggio    
    private mDestinatari
    private mAbilitato
    private mUpdated_at
  
  private sub Class_Initialize()
  end sub

  private sub Class_Terminate()
  end sub
 
 '=============================
 'public properties

    public property get Id()
        Id = mId
    end property
 
    public property let Id(val)
        mId = val
    end property

    public property get Nome()
        Nome = mNome
    end property
 
    public property let Nome(val)
        mNome = val
    end property

    public property get Oggetto()
        Oggetto = mOggetto
    end property
 
    public property let Oggetto(val)
        mOggetto = val
    end property
  
    public property get Messaggio()
        Messaggio = mMessaggio
    end property  

    public property let Messaggio(val)
        mMessaggio = val
    end property
    
    public property get Destinatari()
        Destinatari = mDestinatari
    end property  

    public property let Destinatari(val)
        mDestinatari = val
    end property

    public property get Abilitato()
        Abilitato = mAbilitato
    end property  

    public property let Abilitato(val)
        mAbilitato = val
    end property

    public property get Updated_at()
      Updated_at = mUpdated_at
   end property  

   public property let Updated_at(val)
      mUpdated_at = val
   end property

end class 'Notifiche

'======================
class NotificheHelper

  Dim selectSQL

  private sub Class_Initialize()
    selectSQL = " SELECT * FROM [Notifiche]"
  end sub

  private sub Class_Terminate()
  end sub

 '=============================
 'public Functions

   public function Update(obj)
        Dim strSQLUdt 
        strSQLUdt= " UPDATE [Notifiche] SET  abilitato = {0}, oggetto = '{1}', messaggio = '{2}', destinatari = '{3}', updated_at = '{4}' WHERE id = {5} " 
        DbExecute StringFormat(strSQLUdt, array(Abs(CInt(obj.Abilitato)), obj.Oggetto, obj.Messaggio, obj.Destinatari, obj.Updated_at, obj.Id))   
        Update = true
        DbCloseConnection
    end function

  public function SelectAll()
    Dim records
    set records = DbExecute(selectSQL)
    if records.eof then 
        Set SelectAll = Nothing
    else
        Dim results, obj, record
        Set results = Server.CreateObject("Scripting.Dictionary")
        while not records.eof
            set obj = PopulateObjectFromRecord(records)
			results.Add obj.Id, obj
            records.movenext 
        wend 
        set SelectAll = results
        records.Close
    End If
    set record = nothing
    DbCloseConnection
  end function

    public function SelectById(id)
        Dim record
        set record = DbExecute(StringFormat(selectSQL + " WHERE id = {0}", array(id)))
        Set SelectById = PopulateObjectFromRecord(record)
        record.Close
        set record = nothing
        DbCloseConnection
    end function

    public function SelectByNome(nome)
        Dim record
        set record = DbExecute(StringFormat(selectSQL + " WHERE nome = '{0}' ", array(nome)))
        Set SelectByNome = PopulateObjectFromRecord(record)
        record.Close
        set record = nothing
        DbCloseConnection
    end function

    public function Invia(smtp, oggetto, destinatari, messaggio)      
        Dim BioMail, Config, Fields
        Set Config = Server.CreateObject("CDO.Configuration")
        Set Fields = Config.Fields
            Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = smtp.Smtpauthenticate
            Fields.Item("http://schemas.microsoft.com/cdo/configuration/sendusing")= smtp.Sendusing
            Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpusessl") = smtp.Smtpusessl
            Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")= smtp.Smtpserver
            Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")= smtp.Smtpserverport
            Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusername") = smtp.Sendusername
            Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendpassword") = smtp.Sendpassword
            Fields.Update
        set BioMail = Server.CreateObject("CDO.Message")
            BioMail.Configuration = Config
            BioMail.From = smtp.Sendemailaddress
            BioMail.To = destinatari
            BioMail.Subject = oggetto
            BioMail.HTMLBody = messaggio
            On Error Resume Next
               BioMail.Send()
            If err.Descriprion <> "" Then
               Response.Write err.Description
            End If
        Set BioMail = Nothing
        Set Fields = Nothing
        Set Config = Nothing
    end function


  private function PopulateObjectFromRecord(record)
    if record.eof then
       Set PopulateObjectFromRecord = Nothing
        else
          Dim obj
            set obj = new Notifiche
                obj.Id = record("id")
                obj.Nome = record("nome")
                obj.Oggetto = record("oggetto")
                obj.Messaggio = record("messaggio")
                obj.Destinatari = record("destinatari")
                obj.Abilitato = record("abilitato")
                obj.Updated_at = record("updated_at")
          set PopulateObjectFromRecord = obj
    end if
  end function

end class 'NotificheHelper


%>


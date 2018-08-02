<%

' 
' This files defines the LogNotifiche model 
'

class LogNotifiche

 '=============================
 'Private properties
  private mId

  private  mNomeUtente
  private  mOggetto
  private  mMessaggio
  private  mDestinatari
  private  mCreated_at
  
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

   public property get NomeUtente()
      NomeUtente = mNomeUtente
   end property  

   public property let NomeUtente(val)
      mNomeUtente = val
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

   public property get Created_at()
      Created_at = mCreated_at
   end property  

   public property let Created_at(val)
      mCreated_at = val
   end property

end class 'LogNotifiche

'======================
class LogNotificheHelper

  Dim selectSQL

  private sub Class_Initialize()
    selectSQL = " SELECT * FROM [LogNotifiche] ORDER BY created_at DESC"
  end sub

  private sub Class_Terminate()
  end sub

 '=============================
 'public Functions

  public function Insert(log)
      Dim strSQL 
      strSQL=   " INSERT INTO [LogNotifiche] (nomeUtente, oggetto, messaggio, destinatari, created_at) VALUES ('{0}', '{1}', '{2}', '{3}', '{4}') "
      log.Id = DbExecute (StringFormat(strSQL, array(log.NomeUtente, log.oggetto, log.messaggio, log.destinatari, log.created_at)))
      Insert = true
      DbCloseConnection
  end function

   public function Delete()
     Dim strSQL 
     strSQL= " DELETE FROM [LogNotifiche] "
	 DbExecute (strSQL)
     Delete = true 
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

  private function PopulateObjectFromRecord(record)
    if record.eof then
       Set PopulateObjectFromRecord = Nothing
        else
          Dim obj
          set obj = new LogNotifiche
            obj.Id= record("id") 
            obj.NomeUtente = record("nomeUtente")
            obj.Oggetto = record("oggetto")
            obj.Messaggio = record("messaggio")
            obj.Destinatari = record("destinatari")
            obj.Created_at = record("created_at")
          set PopulateObjectFromRecord = obj
    end if
  end function

end class 'LogNotificheHelper


%>


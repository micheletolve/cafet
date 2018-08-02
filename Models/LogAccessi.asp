<%

' 
' This files defines the LogAccessi model 
'

class LogAccessi

 '=============================
 'Private properties
  private mId

  private  mNomeUtente
  private  mData
  private  mStato
  private  mIp
  
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

   public property get Data()
      Data = mData
   end property  

   public property let Data(val)
      mData = val
   end property

   public property get Stato()
      Stato = mStato
   end property  

   public property let Stato(val)
      mStato = val
   end property

   public property get Ip()
      Ip = mIp
   end property  

   public property let Ip(val)
      mIp = val
   end property  

end class 'LogAccessi

'======================
class LogAccessiHelper

  Dim selectSQL

  private sub Class_Initialize()
    selectSQL = " SELECT * FROM [LogAccessi] ORDER BY data DESC"
  end sub

  private sub Class_Terminate()
  end sub

 '=============================
 'public Functions

  public function Insert(log)
      Dim strSQL 
      strSQL=   " INSERT INTO [LogAccessi] (nomeUtente, data, stato, ip) VALUES ('{0}', '{1}', '{2}', '{3}') "
      log.Id = DbExecute (StringFormat(strSQL, array(log.NomeUtente, log.Data, log.Stato, log.Ip)))
      Insert = true
      DbCloseConnection
  end function

   public function Delete()
     Dim strSQL 
     strSQL= " DELETE FROM [LogAccessi] "
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
          set obj = new LogAccessi
            obj.Id= record("id") 
            obj.NomeUtente = record("nomeUtente")
            obj.Data = record("data")
            obj.Stato = record("stato")  
            obj.Ip = record("ip")
          set PopulateObjectFromRecord = obj
    end if
  end function

end class 'LogAccessiHelper


%>


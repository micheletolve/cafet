<%

' 
' This files defines the LogSettings model 
'

class LogSettings

 '=============================
 'Private properties
  private mId

  private  mUser_id
  private  mLogging
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

   public property get User_id()
      User_id = mUser_id
   end property  

   public property let User_id(val)
      mUser_id = val
   end property

   public property get Logging()
      Logging = mLogging
   end property  

   public property let Logging(val)
      mLogging = val
   end property

   public property get Created_at()
      Created_at = mCreated_at
   end property  

   public property let Created_at(val)
      mCreated_at = val
   end property 

end class 'LogSettings

'======================
class LogSettingsHelper

  Dim selectSQL

  private sub Class_Initialize()
    selectSQL = " SELECT * FROM [LogSettings] ORDER BY created_at DESC"
  end sub

  private sub Class_Terminate()
  end sub

 '=============================
 'public Functions

  public function Insert(log)
      Dim strSQL 
      strSQL=   " INSERT INTO [LogSettings] (user_id, logging, created_at) VALUES ({0}, '{1}', '{2}') "
      log.Id = DbExecute (StringFormat(strSQL, array(log.User_id, log.Logging, log.Created_at)))
      Insert = true
      DbCloseConnection
  end function

   public function Delete()
     Dim strSQL 
     strSQL= " DELETE FROM [LogSettings] "
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
          set obj = new LogSettings
            obj.Id= record("id") 
            obj.User_id = record("user_id")
            obj.Logging = record("logging")
            obj.Created_at = record("created_at")  
          set PopulateObjectFromRecord = obj
    end if
  end function

end class 'LogSettingsHelper


%>


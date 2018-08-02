<%

' 
' This files defines the LogAccessi model 
'

class Smtp

 '=============================
 'Private properties
    private mId

    private mNome
    private mSmtpauthenticate
    private mSendusing
    private mSmtpusessl
    private mSmtpserver
    private mSmtpserverport
    private mSendemailaddress
    private mSendusername
    private mSendpassword
    private mPredefinito
    private mCreated_at
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
  
    public property get Smtpauthenticate()
        Smtpauthenticate = mSmtpauthenticate
    end property  

    public property let Smtpauthenticate(val)
        mSmtpauthenticate = val
    end property
    
    public property get Sendusing()
        Sendusing = mSendusing
    end property  

    public property let Sendusing(val)
        mSendusing = val
    end property

    public property get Smtpusessl()
        Smtpusessl = mSmtpusessl
    end property  

    public property let Smtpusessl(val)
        mSmtpusessl = val
    end property

    public property get Smtpserver()
        Smtpserver = mSmtpserver
    end property  

    public property let Smtpserver(val)
        mSmtpserver = val
    end property

    public property get Smtpserverport()
        Smtpserverport = mSmtpserverport
    end property  

    public property let Smtpserverport(val)
        mSmtpserverport = val
    end property

    public property get Sendemailaddress()
        Sendemailaddress = mSendemailaddress
    end property  

    public property let Sendemailaddress(val)
        mSendemailaddress = val
    end property

    public property get Sendusername()
        Sendusername = mSendusername
    end property  

    public property let Sendusername(val)
        mSendusername = val
    end property

    public property get Sendpassword()
        Sendpassword = mSendpassword
    end property  

    public property let Sendpassword(val)
        mSendpassword = val
    end property

    public property get Predefinito()
        Predefinito = mPredefinito
    end property  

    public property let Predefinito(val)
        mPredefinito = val
    end property

    public property get Created_at()
      Created_at = mCreated_at
   end property  

   public property let Created_at(val)
      mCreated_at = val
   end property

   public property get Updated_at()
      Updated_at = mUpdated_at
   end property  

   public property let Updated_at(val)
      mUpdated_at = val
   end property


end class 'Smtp

'======================
class SmtpHelper

  Dim selectSQL

  private sub Class_Initialize()
    selectSQL = " SELECT * FROM [Smtp] "
  end sub

  private sub Class_Terminate()
  end sub

 '=============================
 'public Functions

  public function Insert(obj)
      Dim strSQL 
      strSQL=   " INSERT INTO [Smtp] (nome, smtpauthenticate, sendusing, smtpusessl, smtpserver, smtpserverport, sendemailaddress, sendusername, sendpassword, predefinito, created_at, updated_at) VALUES ('{0}', {1}, {2}, {3}, '{4}', {5}, '{6}', '{7}', '{8}', {9}, '{10}', '{11}' ) "
      obj.Id = DbExecute (StringFormat(strSQL, array(obj.Nome, obj.Smtpauthenticate, obj.Sendusing, Abs(CInt(obj.Smtpusessl)), obj.Smtpserver, obj.Smtpserverport, obj.Sendemailaddress, obj.Sendusername, obj.Sendpassword, Abs(CInt(obj.Predefinito)), obj.Created_at, obj.Updated_at)))
      Insert = true
      DbCloseConnection
  end function


    public function Update(obj)
        Dim strSQLUdt 
        strSQLUdt= " UPDATE [Smtp] SET  nome = '{0}', smtpauthenticate = {1}, sendusing = {2}, smtpusessl = {3}, smtpserver = '{4}', smtpserverport = {5}, sendemailaddress = '{6}', sendusername = '{7}', sendpassword = '{8}', predefinito = {9}, updated_at = '{10}' WHERE id = {11} " 
        DbExecute StringFormat(strSQLUdt, array( obj.Nome, obj.Smtpauthenticate, obj.Sendusing, Abs(CInt(obj.Smtpusessl)), obj.Smtpserver, obj.Smtpserverport, obj.Sendemailaddress, obj.Sendusername, obj.Sendpassword, Abs(CInt(obj.Predefinito)), obj.Updated_at, obj.Id))   
        Update = true
        DbCloseConnection
    end function

    public function Delete(id)
        Dim strSQL 
        strSQL= "DELETE FROM [Smtp] WHERE id = {0}"
        DbExecute StringFormat(strSQL, array(id))
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

    public function SelectById(id)
        Dim record
        set record = DbExecute(StringFormat(selectSQL + " WHERE id = {0}", array(id)))
        Set SelectById = PopulateObjectFromRecord(record)
        record.Close
        set record = nothing
        DbCloseConnection
    end function

    public function SelectByPredefinito()
        Dim record, sql
        sql = " SELECT * FROM [Smtp] WHERE Predefinito = 1"
        set record = DbExecute(sql)
        Set SelectByPredefinito = PopulateObjectFromRecord(record)
        record.Close
        set record = nothing
        DbCloseConnection
    end function


  private function PopulateObjectFromRecord(record)
    if record.eof then
       Set PopulateObjectFromRecord = Nothing
        else
          Dim obj
            set obj = new Smtp
                obj.Id = record("id")
                obj.Nome = record("nome")
                obj.Smtpauthenticate = record("smtpauthenticate")
                obj.Sendusing = record("sendusing")
                obj.Smtpusessl = record("smtpusessl")
                obj.Smtpserver = record("smtpserver")
                obj.Smtpserverport = record("smtpserverport")
                obj.Sendemailaddress = record("sendemailaddress")
                obj.Sendusername = record("sendusername")    
                obj.Sendpassword = record("sendpassword")    
                obj.Predefinito = record("predefinito")
                obj.Created_at = record("created_at")
                obj.Updated_at = record("updated_at")
          set PopulateObjectFromRecord = obj
    end if
  end function

end class 'SmtpHelper


%>


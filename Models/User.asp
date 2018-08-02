<%

' 
' This files defines the User model 
'

class User

 '=============================
 'Private properties
  private mId

  private  mNome
  private  mCognome
  private  mNomeCompleto
  private  mEmail
  private  mUsername
  private  mPassword
  private  mRuolo_id
  private  mCreated_at
  private  mUpdated_at
  
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

   public property get Cognome()
      Cognome = mCognome
   end property  

   public property let Cognome(val)
      mCognome = val
   end property

   public property get NomeCompleto()
      NomeCompleto = mNomeCompleto
   end property  

   public property let NomeCompleto(val)
      mNomeCompleto = val
   end property 

   public property get Email()
      Email = mEmail
   end property  

   public property let Email(val)
      mEmail = val
   end property

   public property get Username()
      Username = mUsername
   end property  

   public property let Username(val)
      mUsername = val
   end property
   
   public property get Password()
      Password = mPassword
   end property  

   public property let Password(val)
      mPassword = val
   end property  

   public property get Ruolo_id()
      Ruolo_id = mRuolo_id
   end property  

   public property let Ruolo_id(val)
      mRuolo_id = val
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


end class


'======================
class UserHelper

    Dim selectSQL

    private sub Class_Initialize()
        selectSQL = " SELECT * FROM [Utenti] "
    end sub

    private sub Class_Terminate()
    end sub

 '=============================
 'public Functions

    public function Insert(obj)
        Dim strSQL 
        strSQL=   " INSERT INTO [Utenti] (nome, cognome, nomeCompleto, email, username, password, ruolo_id, created_at, updated_at) VALUES ('{0}','{1}','{2}','{3}','{4}', '{5}', {6}, '{7}', '{8}') "
        obj.Id = DbExecute (StringFormat(strSQL, array(obj.Nome, obj.Cognome, obj.NomeCompleto, obj.Email, obj.Username, obj.Password, obj.Ruolo_id, obj.Created_at, obj.Updated_at)))
        Insert = true
        DbCloseConnection
    end function

    public function Update(obj)
        Dim strSQLUdt 
        strSQLUdt= " UPDATE [Utenti] SET  nome = '{0}', cognome = '{1}', nomeCompleto = '{2}', email = '{3}', username = '{4}', ruolo_id = {5} , updated_at = '{6}' WHERE id = {7} " 
        DbExecute StringFormat(strSQLUdt, array( obj.Nome, obj.Cognome, obj.NomeCompleto, obj.Email, obj.Username, obj.Ruolo_id, obj.Updated_at, obj.Id))
        Update = true
        DbCloseConnection
    end function

    public function UpdatePassword(user)
        Dim strSQLUdt 
        strSQLUdt= " UPDATE [Utenti] SET  password = '{0}', updated_at = '{1}' WHERE id = {2} " 
        DbExecute StringFormat(strSQLUdt, array( user.Password, user.Updated_at, user.Id))
        UpdatePassword = true
        DbCloseConnection
    end function

    public function Delete(id)
        Dim strSQL 
        strSQL= "DELETE FROM [Utenti] WHERE id = {0}"
        DbExecute StringFormat(strSQL, array(id))
        Delete = true 
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

    public function SelectByUsername(username)
        Dim record
        Set record = DbExeceute(StringFormat(selectSQL + " WHERE username = '{0}' ", array(username)))
        if record.eof then
            Set SelectByUsername = Nothing
        else
            Set SelectByUsername = PopulateObjectFromRecord(record)
            record.Close
            set record = nothing
        End if
        DbCloseConnection
    end function

    public function SelectLogin(obj)
        Dim record
        set record = DbExecute(StringFormat(selectSQL + " where username = '{0}' and password = '{1}'" , array(obj.Username, obj.Password)))
        if record.eof then
            Set SelectLogin = Nothing
        else
            Set SelectLogin = PopulateObjectFromRecord(record)
            record.Close
            set record = nothing
        End if
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

 public function SelectByRole(id)
    Dim records
    set records = DbExecute(StringFormat(selectSQL + " WHERE ruolo_id = {0}", array(id)))
    if records.eof then 
        Set SelectByRole = Nothing
    else
        Dim results, obj, record
        Set results = Server.CreateObject("Scripting.Dictionary")
        while not records.eof
            set obj = PopulateObjectFromRecord(records)
			results.Add obj.Id, obj
            records.movenext 
        wend 
        set SelectByRole = results
        records.Close
    End If
    set record = nothing
    DbCloseConnection
  end function

  public function SelectAllExceptCda()
    Dim records
    set records = DbExecute("SELECT [Utenti].* FROM [Utenti] EXCEPT SELECT [Utenti].* FROM [Cda] INNER JOIN [Utenti] ON [Cda].utente_id = [Utenti].id")
    if records.eof then 
        Set SelectAllExceptCda = Nothing
    else
        Dim results, obj, record
        Set results = Server.CreateObject("Scripting.Dictionary")
        while not records.eof
            set obj = PopulateObjectFromRecord(records)
			results.Add obj.Id, obj
            records.movenext 
        wend 
        set SelectAllExceptCda = results
        records.Close
    End If
    set record = nothing
    DbCloseConnection
  end function

  public function SelectAllExceptAlreadyExist(area_id)
    Dim records
    set records = DbExecute(StringFormat("SELECT [Utenti].* FROM [Utenti] EXCEPT SELECT [Utenti].* FROM [UtentiAree] INNER JOIN [Utenti] ON [UtentiAree].utente_id = [Utenti].id WHERE [UtentiAree].area_id = {0}", array(area_id)))
    if records.eof then 
        Set SelectAllExceptAlreadyExist = Nothing
    else
        Dim results, obj, record
        Set results = Server.CreateObject("Scripting.Dictionary")
        while not records.eof
            set obj = PopulateObjectFromRecord(records)
			results.Add obj.Id, obj
            records.movenext 
        wend 
        set SelectAllExceptAlreadyExist = results
        records.Close
    End If
    set record = nothing
    DbCloseConnection
  end function

   public function SelectUserFromProposta(id)
        Dim record
        set record = DbExecute(StringFormat("SELECT [Utenti].* FROM [ProposteTeam] JOIN [TeamInterno] ON [TeamInterno].id = {0} JOIN [Utenti] ON [Utenti].id = [TeamInterno].utente_id ", array(id)))
        Set SelectUserFromProposta = PopulateObjectFromRecord(record)
        record.Close
        set record = nothing
        DbCloseConnection
    end function

  public function SelectByField(fieldName, value)
    Dim records, txtSQL
    txtSQL = StringFormat(selectSQL + " where " + fieldName + "={0}" , array(value))
    set records = DbExecute(txtSQL)
    if records.eof then 
        Set SelectByField = Nothing
    else
        Dim results, obj, record
        Set results = Server.CreateObject("Scripting.Dictionary")
        while not records.eof
            set obj = PopulateObjectFromRecord(records)
            results.Add obj.Id, obj
            records.movenext 
        wend 
        set SelectByField = results
        records.Close
    End If
    set record = nothing
    DbCloseConnection
  end function

  public function Validate(user)
    Dim checkUsername, checkEmail
    set checkUsername = DbExecute(StringFormat(selectSQL + " where username = '{0}'" , array(user.Username)))
    set checkEmail = DbExecute(StringFormat(selectSQL + " where email = '{0}'" , array(user.Email)))
    if (checkUsername.eof) AND (checkEmail.eof) then
        Validate = ""
    else
        If (Not checkUsername.eof) Then
            Validate = "usn"
            checkUsername.Close
        Elseif (Not checkEmail.eof) Then
            Validate = "eml"
            checkUsername.Close
        End If
    End if
    DbCloseConnection
  end function

  private function PopulateObjectFromRecord(record)
    if record.eof then
       Set PopulateObjectFromRecord = Nothing
        else
            Dim obj
            set obj = new User
                obj.Id= record("id") 
                obj.Nome = record("nome")  
                obj.Cognome = record("cognome")  
                obj.NomeCompleto = record("nomeCompleto")
                obj.Email = record("email")  
                obj.Username = record("username")
		        obj.Password = record("password")
		        obj.Ruolo_id = record("ruolo_id")
                obj.Created_at = record("created_at")
                obj.Updated_at = record("updated_at")
            set PopulateObjectFromRecord = obj
    end if
  end function

end class 'UserHelper


%>


<%

'
' This files defines the Role model
'

class Role

 '=============================
 'Private properties
    private mId

    private  mCodice
    private  mRuolo
    private  mDescrizione
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

   public property get Codice()
      Codice = mCodice
   end property

   public property let Codice(val)
      mCodice = val
   end property

   public property get Ruolo()
      Ruolo = mRuolo
   end property

   public property let Ruolo(val)
      mRuolo = val
   end property

   public property get Descrizione()
      Descrizione = mDescrizione
   end property

   public property let Descrizione(val)
      mDescrizione = val
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
class RoleHelper

  Dim selectSQL

  private sub Class_Initialize()
    selectSQL = " SELECT * FROM [Ruoli] "
  end sub

  private sub Class_Terminate()
  end sub

 '=============================
 'public Functions

  public function Insert(role)
      Dim strSQL
      strSQL=   " INSERT INTO [Ruoli] (codice, ruolo, descrizione, created_at, updated_at) VALUES ('{0}','{1}','{2}','{3}','{4}') "
      role.Id = DbExecute (StringFormat(strSQL, array(role.Codice, role.Ruolo, role.Descrizione,  obj.Created_at, obj.Updated_at)))
      Insert = true
      DbCloseConnection
  end function

  public function Update(role)
     Dim strSQL
     strSQL= " UPDATE [Ruoli] SET  descrizione = '{0}', updated_at = '{1}' WHERE id = {2} "
     DbExecute StringFormat(strSQL, array( role.Descrizione, obj.Updated_at, role.Id))
     Update = true
     DbCloseConnection
  end function

  public function Delete(id)
     Dim strSQL
     strSQL= "DELETE FROM [Ruoli] WHERE id = {0}"
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

  public function SelectByCodice(codice)
    Dim record
    set record = DbExecute(StringFormat(selectSQL + " WHERE codice = '{0}'", array(codice)))
    Set SelectByCodice = PopulateObjectFromRecord(record)
    record.Close
    set record = nothing
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

  public function SelectAllExceptPermitted(menu_id)
    Dim records, query
    query = StringFormat("SELECT [Ruoli].* FROM [Ruoli] EXCEPT SELECT [Ruoli].* FROM [Ruoli] INNER JOIN [MenuPermission] ON [MenuPermission].Ruolo_id = [Ruoli].id WHERE [MenuPermission].menu_id = {0}", array(menu_id))
    set records = DbExecute(query)
    if records.eof then
        Set SelectAllExceptPermitted = Nothing
    else
        Dim results, obj, record
        Set results = Server.CreateObject("Scripting.Dictionary")
        while not records.eof
            set obj = PopulateObjectFromRecord(records)
			results.Add obj.Id, obj
            records.movenext
        wend
        set SelectAllExceptPermitted = results
        records.Close
    End If
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

  private function PopulateObjectFromRecord(record)
    if record.eof then
       Set PopulateObjectFromRecord = Nothing
        else
          Dim obj
          set obj = new Role
            obj.Id= record("id")
            obj.Codice = record("codice")
            obj.Ruolo = record("ruolo")
            obj.Descrizione = record("descrizione")
            obj.Created_at = record("created_at")
            obj.Updated_at = record("updated_at")
          set PopulateObjectFromRecord = obj
    end if
  end function

end class 'RoleHelper


%>

<%

'
' This files defines the MenuPermission model
'

class MenuPermission

 '=============================
 'Private properties
    private mPermission

    private  mMenu_id
    private  mRuolo_id
    private  mRole_code
    private  mCreated_at
    private  mUpdated_at

    private sub Class_Initialize()
    end sub

    private sub Class_Terminate()
    end sub

 '=============================
 'public properties

   public property get Permission()
      Permission = mPermission
   end property

   public property let Permission(val)
      mPermission = val
   end property

   public property get Menu_id()
      Menu_id = mMenu_id
   end property

   public property let Menu_id(val)
      mMenu_id = val
   end property

   public property get Ruolo_id()
      Ruolo_id = mRuolo_id
   end property

   public property let Ruolo_id(val)
      mRuolo_id = val
   end property

   public property get Role_code()
      Role_code = mRole_code
   end property

   public property let Role_code(val)
      mRole_code = val
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
class MenuPermissionHelper

  Dim selectSQL

  private sub Class_Initialize()
    selectSQL = " SELECT * FROM [MenuPermission] "
  end sub

  private sub Class_Terminate()
  end sub

 '=============================
 'public Functions

  public function Insert(obj)
      Dim strSQL
      strSQL=   " INSERT INTO [MenuPermission] (menu_id, ruolo_id, role_code, created_at, updated_at) VALUES ({0}, {1}, '{2}', '{3}', '{4}') "
      obj.Permission = DbExecute (StringFormat(strSQL, array(obj.Menu_id, obj.Ruolo_id, obj.Role_code, obj.Created_at, obj.Updated_at)))
      Insert = true
      DbCloseConnection
  end function

  public function Delete(permission)
     Dim strSQL
     strSQL= "DELETE FROM [MenuPermission] WHERE permission = '{0}' "
     DbExecute StringFormat(strSQL, array(permission))
     Delete = true
     DbCloseConnection
  end function

  public function Reset(menu_id)
     Dim strSQL
     strSQL= "DELETE FROM [MenuPermission] WHERE menu_id = {0} "
     DbExecute StringFormat(strSQL, array(menu_id))
     Reset = true
     DbCloseConnection
  end function

  public function SelectByPermission(permission)
    Dim record
    set record = DbExecute(StringFormat(selectSQL + " WHERE permission = '{0}' ", array(permission)))
    Set SelectById = PopulateObjectFromRecord(record)
    record.Close
    set record = nothing
    DbCloseConnection
  end function

  public function SelectAll()
    Dim records
    set records = DbExecute(selectSQL + "ORDER BY created_at DESC")
    if records.eof then
        Set SelectAll = Nothing
    else
        Dim results, obj, record
        Set results = Server.CreateObject("Scripting.Dictionary")
        while not records.eof
            set obj = PopulateObjectFromRecord(records)
			      results.Add obj.Permission, obj
            records.movenext
        wend
        set SelectAll = results
        records.Close
    End If
    set record = nothing
    DbCloseConnection
  end function

  public function SelectByField(fieldName, value)
    Dim records, txtSQL
    txtSQL = StringFormat(selectSQL + " where " + fieldName + " = {0} ORDER BY created_at DESC" , array(value))
    set records = DbExecute(txtSQL)
    if records.eof then
        Set SelectByField = Nothing
    else
        Dim results, obj, record
        Set results = Server.CreateObject("Scripting.Dictionary")
        while not records.eof
            set obj = PopulateObjectFromRecord(records)
            results.Add obj.Permission, obj
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
          set obj = new MenuPermission
            obj.Permission= record("permission")
            obj.Menu_id = record("Menu_id")
            obj.Ruolo_id = record("Ruolo_id")
            obj.Role_code = record("Role_code")
            obj.Created_at = record("created_at")
            obj.Updated_at = record("updated_at")
          set PopulateObjectFromRecord = obj
    end if
  end function

end class 'MenuPermissionHelper

%>

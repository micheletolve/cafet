<%

'
' This files defines the Menu model
'

class Menu

 '=============================
 'Private properties
    private mId

    private mOrdine
    private mFa_icon
    private mLabel
    private mController
    private mAction
    private mVars
    private mLink
    private mPills
    private mActive
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

   public property get Ordine()
      Ordine = mOrdine
   end property

   public property let Ordine(val)
      mOrdine = val
   end property

   public property get Fa_icon()
      Fa_icon = mFa_icon
   end property

   public property let Fa_icon(val)
      mFa_icon = val
   end property

   public property get Label()
      Label = mLabel
   end property

   public property let Label(val)
      mLabel = val
   end property

   public property get Controller()
      Controller = mController
   end property

   public property let Controller(val)
      mController = val
   end property

   public property get Action()
      Action = mAction
   end property

   public property let Action(val)
      mAction = val
   end property

   public property get Vars()
      Vars = mVars
   end property

   public property let Vars(val)
      mVars = val
   end property

   public property get Link()
      Link = mLink
   end property

   public property let Link(val)
      mLink = val
   end property

   public property get Pills()
      Pills = mPills
   end property

   public property let Pills(val)
      mPills = val
   end property

   public property get Active()
      Active = mActive
   end property

   public property let Active(val)
      mActive = val
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
class MenuHelper

  Dim selectSQL

  private sub Class_Initialize()
    selectSQL = " SELECT * FROM [Menu] "
  end sub

  private sub Class_Terminate()
  end sub

 '=============================
 'public Functions

 private mOrdine
 private mFa_icon
 private mLabel
 private mController
 private mAction
 private mVars
 private mLink
 private mPills
 private mActive
 private mCreated_at
 private mUpdated_at

  public function Insert(obj)
      Dim strSQL
      strSQL=   " INSERT INTO [Menu] (ordine, fa_icon, label, controller, action, vars, link, pills, active, created_at, updated_at) VALUES ({0}, '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}', {8}, '{9}','{10}') "
      obj.Id = DbExecute (StringFormat(strSQL, array(obj.Ordine, obj.Fa_icon, obj.Label, obj.Controller, obj.Action, obj.Vars, obj.Link, obj.Pills, Abs(CInt(obj.Active)), obj.Created_at, obj.Updated_at)))
      Insert = true
      DbCloseConnection
  end function

  public function Update(obj)
     Dim strSQL
     strSQL= " UPDATE [Menu] SET  ordine = {0}, fa_icon = '{1}', label = '{2}', controller = '{3}', action = '{4}', vars = '{5}', link = '{6}', pills = '{7}', active = {8}, updated_at = '{9}' WHERE id = {10} "
     DbExecute StringFormat(strSQL, array(obj.Ordine, obj.Fa_icon, obj.Label, obj.Controller, obj.Action, obj.Vars, obj.Link, obj.Pills, Abs(CInt(obj.Active)), obj.Updated_at, obj.Id))
     Update = true
     DbCloseConnection
  end function

  public function ToggleMenu(obj)
    Dim strSQL
    strSQL= " UPDATE [Menu] SET  active = {0}, updated_at = '{1}' WHERE id = {2} "
    DbExecute StringFormat(strSQL, array(Abs(CInt(obj.Active)), obj.Updated_at, obj.Id))
    ToggleMenu = true
    DbCloseConnection
  end function

  public function ReorderMenu(obj)
    Dim strSQL
    strSQL= " UPDATE [Menu] SET  ordine = {0}, updated_at = '{1}' WHERE id = {2} "
    DbExecute StringFormat(strSQL, array(CInt(obj.Ordine), obj.Updated_at, obj.Id))
    ReorderMenu = true
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

  public function SelectActive(ruolo_id)
    Dim records, query
    query = StringFormat(" SELECT [Menu].* FROM [Menu] INNER JOIN [MenuPermission] ON [MenuPermission].menu_id = [Menu].id  WHERE [MenuPermission].ruolo_id = {0} ORDER BY [Menu].ordine", array(ruolo_id))
    set records = DbExecute(query)
    if records.eof then
        Set SelectActive = Nothing
    else
        Dim results, obj, record
        Set results = Server.CreateObject("Scripting.Dictionary")
        while not records.eof
            set obj = PopulateObjectFromRecord(records)
      results.Add obj.Id, obj
            records.movenext
        wend
        set SelectActive = results
        records.Close
    End If
    set record = nothing
    DbCloseConnection
  end function

  public function SelectAll()
    Dim records
    set records = DbExecute(selectSQL + " ORDER BY ordine ASC ")
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
          set obj = new Menu
            obj.Id= record("id")
            obj.Ordine = record("ordine")
            obj.Fa_icon = record("fa_icon")
            obj.Label = record("label")
            obj.Controller = record("controller")
            obj.Action= record("action")
            obj.Vars = record("vars")
            obj.Link = record("link")
            obj.Pills = record("pills")
            obj.Active = record("active")
            obj.Created_at = record("created_at")
            obj.Updated_at = record("updated_at")
          set PopulateObjectFromRecord = obj
    end if
  end function

end class 'MenuHelper

%>

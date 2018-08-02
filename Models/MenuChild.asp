<%

'
' This files defines the MenuChild model
'

class MenuChild

 '=============================
 'Private properties
    private mId

    private mOrdine
    private mParent_id
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

   public property get Parent_id()
      Parent_id = mParent_id
   end property

   public property let Parent_id(val)
      mParent_id = val
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
class MenuChildHelper

  Dim selectSQL

  private sub Class_Initialize()
    selectSQL = " SELECT * FROM [MenuChild] "
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
      strSQL=   " INSERT INTO [MenuChild] (ordine, parent_id, fa_icon, label, controller, action, vars, link, pills, active, created_at, updated_at) VALUES ({0}, {1}, '{2}', '{3}', '{4}', '{5}', '{6}', '{7}', '{8}', {9},'{10}', '{11}') "
      obj.Id = DbExecute (StringFormat(strSQL, array(obj.Ordine, obj.Parent_id, obj.Fa_icon, obj.Label, obj.Controller, obj.Action, obj.Vars, obj.Link, obj.Pills, Abs(CInt(obj.Active)), obj.Created_at, obj.Updated_at)))
      Insert = true
      DbCloseConnection
  end function

  public function Update(obj)
     Dim strSQL
     strSQL= " UPDATE [MenuChild] SET  ordine = {0}, parent_id = {1}, fa_icon = '{2}', label = '{3}', controller = '{4}', action = '{5}', vars = '{6}', link = '{7}', pills = '{8}', active = {9}, updated_at = '{10}' WHERE id = {11} "
     DbExecute StringFormat(strSQL, array(obj.Ordine, obj.Parent_id, obj.Fa_icon, obj.Label, obj.Controller, obj.Action, obj.Vars, obj.Link, obj.Pills, Abs(CInt(obj.Active)), obj.Updated_at, obj.Id))
     Update = true
     DbCloseConnection
  end function

  public function ToggleMenu(obj)
    Dim strSQL
    strSQL= " UPDATE [MenuChild] SET  active = {0}, updated_at = '{1}' WHERE id = {2} "
    DbExecute StringFormat(strSQL, array(Abs(CInt(obj.Active)), obj.Updated_at, obj.Id))
    ToggleMenu = true
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

  public function SelectActive()
    Dim records
    set records = DbExecute(selectSQL + " WHERE active = 1 ORDER BY ordine ASC ")
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

  public function SelectByParentId(id)
    Dim records, query
    query = StringFormat(selectSQL + " WHERE parent_id = {0} ORDER BY ordine ASC ", array(id))
    set records = DbExecute(query)
    if records.eof then
        Set SelectByParentId = Nothing
    else
        Dim results, obj, record
        Set results = Server.CreateObject("Scripting.Dictionary")
        while not records.eof
            set obj = PopulateObjectFromRecord(records)
      results.Add obj.Id, obj
            records.movenext
        wend
        set SelectByParentId = results
        records.Close
    End If
    set record = nothing
    DbCloseConnection
  end function

  public function SelectActiveByParentId(parent_id, ruolo_id)
    Dim records, query
    query = StringFormat(" SELECT [MenuChild].* FROM [MenuChild] INNER JOIN [MenuPermission] ON [MenuPermission].menu_id = [MenuChild].id  WHERE [MenuChild].parent_id = {0} AND [MenuPermission].ruolo_id = {1} AND [MenuChild].active = 1 ORDER BY [MenuChild].ordine ASC", array(parent_id, ruolo_id))
    set records = DbExecute(query)

    if records.eof then
        Set SelectActiveByParentId = Nothing
    else
        Dim results, obj, record
        Set results = Server.CreateObject("Scripting.Dictionary")
        while not records.eof
            set obj = PopulateObjectFromRecord(records)
      results.Add obj.Id, obj
            records.movenext
        wend
        set SelectActiveByParentId = results
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
          set obj = new MenuChild
            obj.Id= record("id")
            obj.Parent_id = record("parent_id")
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

end class 'MenuChildHelper

%>

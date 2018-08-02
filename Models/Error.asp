<%

'
' This files defines the Error model
'

class Error

 '=============================
 'Private properties

  private mMessaggio
  private mTipologia

  private sub Class_Initialize()
  end sub

  private sub Class_Terminate()
  end sub

 '=============================
 'public properties

   public property get Messaggio()
      Messaggio = mMessaggio
   end property

   public property let Messaggio(val)
      mMessaggio = val
   end property

   public property get Tipologia()
      Tipologia = mTipologia
   end property

   public property let Tipologia(val)
      mTipologia = val
   end property

end class 'Error

%>

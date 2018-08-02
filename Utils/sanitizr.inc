<%
    public function Sanitize(str)
        dim re
        set re = new RegExp
        re.Pattern = "[^\w\.@\/{}\\\(\)\%\<\>\=\\[\],\s]"
        re.Global = True
        Sanitize = re.Replace(str, "")
        set re = nothing
    end function
%>
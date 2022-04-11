//Created by Action Script Viewer - https://www.buraks.com/asv
package cmodule.encrypt
{
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;
    import flash.text.*;
    import flash.net.*;
    import flash.system.*;

    public function exportSym(_arg_1:String, _arg_2:int):int
    {
        gstate.syms[_arg_1] = _arg_2;
        return (_arg_2);
    }

}//package cmodule.encrypt

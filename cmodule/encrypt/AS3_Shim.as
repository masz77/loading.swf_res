//Created by Action Script Viewer - https://www.buraks.com/asv
package cmodule.encrypt
{
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;
    import cmodule.encrypt.*;
    import flash.text.*;
    import flash.net.*;
    import flash.system.*;

    internal function AS3_Shim(func:Function, thiz:Object, rt:String, tt:String, varargs:Boolean):int
    {
        var retType:CTypemap = CTypemap.getTypeByName(rt);
        var argTypes:Array = CTypemap.getTypesByNames(tt);
        var tm:CTypemap = new CProcTypemap(retType, argTypes, varargs);
        var id:int = tm.createC(function (... _args):*
        {
            return (func.apply(thiz, _args));
        })[0];
        return (id);
    }

}//package cmodule.encrypt

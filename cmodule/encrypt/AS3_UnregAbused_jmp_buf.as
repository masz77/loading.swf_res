//Created by Action Script Viewer - https://www.buraks.com/asv
package cmodule.encrypt
{
    import cmodule.encrypt.log;

    internal function AS3_UnregAbused_jmp_buf(_arg_1:int):void
    {
        log(4, ("unregAbused: " + _arg_1));
        log(1, "Can't UnregAbused -- abuse support disabled");
    }

}//package cmodule.encrypt

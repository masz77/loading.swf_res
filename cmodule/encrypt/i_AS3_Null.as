//Created by Action Script Viewer - https://www.buraks.com/asv
package cmodule.encrypt
{
    import cmodule.encrypt.exportSym;

    internal const i_AS3_Null:int = cmodule.encrypt.exportSym("_AS3_Null", new CProcTypemap(CTypemap.AS3ValType, []).createC(function ():*
    {
        return (null);
    })[0]);
}//package cmodule.encrypt

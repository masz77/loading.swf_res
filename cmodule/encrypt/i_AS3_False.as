//Created by Action Script Viewer - https://www.buraks.com/asv
package cmodule.encrypt
{
    import cmodule.encrypt.exportSym;

    internal const i_AS3_False:int = cmodule.encrypt.exportSym("_AS3_False", new CProcTypemap(CTypemap.AS3ValType, []).createC(function ():Boolean
    {
        return (false);
    })[0]);
}//package cmodule.encrypt

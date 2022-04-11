//Created by Action Script Viewer - https://www.buraks.com/asv
package cmodule.encrypt
{
    import cmodule.encrypt.exportSym;

    internal const i_AS3_True:int = cmodule.encrypt.exportSym("_AS3_True", new CProcTypemap(CTypemap.AS3ValType, []).createC(function ():Boolean
    {
        return (true);
    })[0]);
}//package cmodule.encrypt

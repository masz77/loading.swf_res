//Created by Action Script Viewer - https://www.buraks.com/asv
package cmodule.encrypt
{
    import cmodule.encrypt.exportSym;

    internal const i_AS3_Acquire:int = cmodule.encrypt.exportSym("_AS3_Acquire", new CProcTypemap(CTypemap.VoidType, [CTypemap.PtrType]).createC(CTypemap.AS3ValType.valueTracker.acquireId)[0]);
}//package cmodule.encrypt

//Created by Action Script Viewer - https://www.buraks.com/asv
package cmodule.encrypt
{
    import cmodule.encrypt.exportSym;

    internal const i_AS3_Shim:int = cmodule.encrypt.exportSym("_AS3_Shim", new CProcTypemap(CTypemap.PtrType, [CTypemap.AS3ValType, CTypemap.AS3ValType, CTypemap.StrType, CTypemap.StrType, CTypemap.IntType]).createC(AS3_Shim)[0]);
}//package cmodule.encrypt

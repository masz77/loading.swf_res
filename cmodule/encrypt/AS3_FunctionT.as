﻿//Created by Action Script Viewer - https://www.buraks.com/asv
package cmodule.encrypt
{
    internal function AS3_FunctionT(_arg_1:int, _arg_2:int, _arg_3:String, _arg_4:String, _arg_5:Boolean):Function
    {
        var _local_6:CTypemap = new CProcTypemap(CTypemap.getTypeByName(_arg_3), CTypemap.getTypesByNames(_arg_4), _arg_5);
        return (AS3_Function(_arg_1, _local_6.fromC([_arg_2])));
    }

}//package cmodule.encrypt

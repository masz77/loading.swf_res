//Created by Action Script Viewer - https://www.buraks.com/asv
package cmodule.encrypt
{
    internal function AS3_Function(data:int, func:Function):Function
    {
        return (function (... _args):*
        {
            return (func(data, _args));
        });
    }

}//package cmodule.encrypt

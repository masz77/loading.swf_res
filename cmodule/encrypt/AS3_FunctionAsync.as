//Created by Action Script Viewer - https://www.buraks.com/asv
package cmodule.encrypt
{
    internal function AS3_FunctionAsync(data:int, func:Function):Function
    {
        return (function (... _args):*
        {
            var _local_2:* = _args.shift();
            return (func(_local_2, data, _args));
        });
    }

}//package cmodule.encrypt

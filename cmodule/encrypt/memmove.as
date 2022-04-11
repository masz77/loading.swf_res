//Created by Action Script Viewer - https://www.buraks.com/asv
package cmodule.encrypt
{
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;
    import flash.text.*;
    import flash.net.*;
    import flash.system.*;

    public function memmove(_arg_1:int, _arg_2:int, _arg_3:int):int
    {
        var _local_4:int;
        if (((_arg_2 > _arg_1) || ((_arg_2 + _arg_3) < _arg_1)))
        {
            memcpy(_arg_1, _arg_2, _arg_3);
        }
        else
        {
            _local_4 = (_arg_1 + _arg_3);
            _arg_2 = (_arg_2 + _arg_3);
            while (_arg_3--)
            {
                var _local_5:* = --_local_4;
                gstate.ds[_local_5] = gstate.ds[--_arg_2];
            };
        };
        return (_arg_1);
    }

}//package cmodule.encrypt

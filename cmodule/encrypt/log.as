//Created by Action Script Viewer - https://www.buraks.com/asv
package cmodule.encrypt
{
    public function log(_arg_1:int, _arg_2:String):void
    {
        if (_arg_1 < glogLvl)
        {
            trace(_arg_2);
        };
    }

}//package cmodule.encrypt

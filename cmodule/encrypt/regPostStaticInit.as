//Created by Action Script Viewer - https://www.buraks.com/asv
package cmodule.encrypt
{
    public function regPostStaticInit(_arg_1:Function):void
    {
        if (!gpostStaticInits)
        {
            gpostStaticInits = [];
        };
        gpostStaticInits.push(_arg_1);
    }

}//package cmodule.encrypt

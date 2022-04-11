//Created by Action Script Viewer - https://www.buraks.com/asv
package cmodule.encrypt
{
    public function regPreStaticInit(_arg_1:Function):void
    {
        if (!gpreStaticInits)
        {
            gpreStaticInits = [];
        };
        gpreStaticInits.push(_arg_1);
    }

}//package cmodule.encrypt

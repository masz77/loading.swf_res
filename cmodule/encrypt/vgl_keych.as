//Created by Action Script Viewer - https://www.buraks.com/asv
package cmodule.encrypt
{
    public function vgl_keych():int
    {
        if (vglKeys.length)
        {
            return (vglKeys.shift());
        };
        return (0);
    }

}//package cmodule.encrypt

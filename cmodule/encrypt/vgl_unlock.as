//Created by Action Script Viewer - https://www.buraks.com/asv
package cmodule.encrypt
{
    public function vgl_unlock():void
    {
        if (((gvglbmd) && (gvglpixels)))
        {
            gstate.ds.position = gvglpixels;
            gvglbmd.setPixels(gvglbmd.rect, gstate.ds);
        };
    }

}//package cmodule.encrypt

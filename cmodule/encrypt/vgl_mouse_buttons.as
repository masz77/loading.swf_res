//Created by Action Script Viewer - https://www.buraks.com/asv
package cmodule.encrypt
{
    import flash.display.Stage;
    import cmodule.encrypt.vglMouseFirst;
    import cmodule.encrypt.gsprite;
    import flash.events.MouseEvent;
    import cmodule.encrypt.vglMouseButtons;

    internal function vgl_mouse_buttons():int
    {
        var stage:Stage;
        if (vglMouseFirst)
        {
            stage = gsprite.stage;
            stage.addEventListener(MouseEvent.MOUSE_DOWN, function (_arg_1:MouseEvent):*
            {
                vglMouseButtons = 1;
            });
            stage.addEventListener(MouseEvent.MOUSE_UP, function (_arg_1:MouseEvent):*
            {
                vglMouseButtons = 0;
            });
            vglMouseFirst = false;
        };
        return (vglMouseButtons);
    }

}//package cmodule.encrypt

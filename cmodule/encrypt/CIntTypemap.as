//Created by Action Script Viewer - https://www.buraks.com/asv
package cmodule.encrypt
{
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;
    import cmodule.encrypt.*;
    import flash.text.*;
    import flash.net.*;
    import flash.system.*;

    internal class CIntTypemap extends CTypemap 
    {


        override public function fromC(_arg_1:Array):*
        {
            return (int(_arg_1[0]));
        }

        override public function createC(_arg_1:*, _arg_2:int=0):Array
        {
            return ([int(_arg_1)]);
        }


    }
}//package cmodule.encrypt

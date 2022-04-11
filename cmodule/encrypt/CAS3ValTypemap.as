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

    internal class CAS3ValTypemap extends CTypemap 
    {

        private var values:ValueTracker = new ValueTracker();


        override public function fromC(_arg_1:Array):*
        {
            return (this.values.get(_arg_1[0]));
        }

        override public function createC(_arg_1:*, _arg_2:int=0):Array
        {
            return ([this.values.acquire(_arg_1)]);
        }

        override public function destroyC(_arg_1:Array):void
        {
            this.values.release(_arg_1[0]);
        }

        public function get valueTracker():ValueTracker
        {
            return (this.values);
        }


    }
}//package cmodule.encrypt

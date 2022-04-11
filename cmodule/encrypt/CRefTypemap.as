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

    internal class CRefTypemap extends CTypemap 
    {

        private var subtype:CTypemap;

        public function CRefTypemap(_arg_1:CTypemap)
        {
            this.subtype = _arg_1;
        }

        override public function fromC(_arg_1:Array):*
        {
            var _local_2:int = _arg_1[0];
            var _local_3:int;
            while (_local_3 < this.subtype.ptrLevel)
            {
                mstate.ds.position = _local_2;
                _local_2 = mstate.ds.readInt();
                _local_3++;
            };
            return (this.subtype.readValue(_local_2));
        }

        override public function createC(_arg_1:*, _arg_2:int=0):Array
        {
            return (null);
        }


    }
}//package cmodule.encrypt

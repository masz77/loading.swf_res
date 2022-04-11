//Created by Action Script Viewer - https://www.buraks.com/asv
package cmodule.encrypt
{
    import flash.utils.ByteArray;
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;
    import cmodule.encrypt.*;
    import flash.text.*;
    import flash.net.*;
    import flash.system.*;

    internal class CDoubleTypemap extends CTypemap 
    {

        private var scratch:ByteArray;

        public function CDoubleTypemap()
        {
            this.scratch = new ByteArray();
            this.scratch.length = 8;
            this.scratch.endian = "littleEndian";
        }

        override public function fromReturnRegs(_arg_1:Object):*
        {
            return (_arg_1.st0);
        }

        override public function toReturnRegs(_arg_1:Object, _arg_2:*, _arg_3:int=0):void
        {
            _arg_1.st0 = _arg_2;
        }

        override public function createC(_arg_1:*, _arg_2:int=0):Array
        {
            this.scratch.position = 0;
            this.scratch.writeDouble(_arg_1);
            this.scratch.position = 0;
            return ([this.scratch.readInt(), this.scratch.readInt()]);
        }

        override public function fromC(_arg_1:Array):*
        {
            this.scratch.position = 0;
            this.scratch.writeInt(_arg_1[0]);
            this.scratch.writeInt(_arg_1[1]);
            this.scratch.position = 0;
            return (this.scratch.readDouble());
        }

        override public function get typeSize():int
        {
            return (8);
        }


    }
}//package cmodule.encrypt

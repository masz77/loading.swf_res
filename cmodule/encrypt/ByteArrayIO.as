//Created by Action Script Viewer - https://www.buraks.com/asv
package cmodule.encrypt
{
    import flash.utils.ByteArray;
    import cmodule.encrypt.gstate;

    internal class ByteArrayIO extends IO 
    {

        public var byteArray:ByteArray;


        override public function set size(_arg_1:int):void
        {
            if (!this.byteArray)
            {
                throw (new AlchemyBlock());
            };
            this.byteArray.length = _arg_1;
        }

        override public function read(_arg_1:int, _arg_2:int):int
        {
            if (!this.byteArray)
            {
                throw (new AlchemyBlock());
            };
            var _local_3:int = Math.min(_arg_2, this.byteArray.bytesAvailable);
            if (_local_3)
            {
                this.byteArray.readBytes(gstate.ds, _arg_1, _local_3);
            };
            return (_local_3);
        }

        override public function get size():int
        {
            if (!this.byteArray)
            {
                throw (new AlchemyBlock());
            };
            return (this.byteArray.length);
        }

        override public function get position():int
        {
            if (!this.byteArray)
            {
                throw (new AlchemyBlock());
            };
            return (this.byteArray.position);
        }

        override public function set position(_arg_1:int):void
        {
            if (!this.byteArray)
            {
                throw (new AlchemyBlock());
            };
            this.byteArray.position = _arg_1;
        }

        override public function write(_arg_1:int, _arg_2:int):int
        {
            if (!this.byteArray)
            {
                throw (new AlchemyBlock());
            };
            if (_arg_2)
            {
                this.byteArray.writeBytes(gstate.ds, _arg_1, _arg_2);
            };
            return (_arg_2);
        }


    }
}//package cmodule.encrypt

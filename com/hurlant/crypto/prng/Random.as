//Created by Action Script Viewer - https://www.buraks.com/asv
package com.hurlant.crypto.prng
{
    import flash.utils.ByteArray;
    import flash.text.Font;
    import flash.system.System;
    import flash.system.Capabilities;
    import flash.utils.getTimer;
    import com.hurlant.util.Memory;

    public class Random 
    {

        private var state:IPRNG;
        private var ready:Boolean = false;
        private var pool:ByteArray;
        private var psize:int;
        private var pptr:int;
        private var seeded:Boolean = false;

        public function Random(_arg_1:Class=null)
        {
            var _local_2:uint;
            if (_arg_1 == null)
            {
                _arg_1 = ARC4;
            };
            this.state = (new (_arg_1)() as IPRNG);
            this.psize = this.state.getPoolSize();
            this.pool = new ByteArray();
            this.pptr = 0;
            while (this.pptr < this.psize)
            {
                _local_2 = uint((0x10000 * Math.random()));
                var _local_3:* = this.pptr++;
                this.pool[_local_3] = (_local_2 >>> 8);
                var _local_4:* = this.pptr++;
                this.pool[_local_4] = (_local_2 & 0xFF);
            };
            this.pptr = 0;
            this.seed();
        }

        public function seed(_arg_1:int=0):void
        {
            if (_arg_1 == 0)
            {
                _arg_1 = new Date().getTime();
            };
            var _local_2:* = this.pptr++;
            this.pool[_local_2] = (this.pool[_local_2] ^ (_arg_1 & 0xFF));
            var _local_3:* = this.pptr++;
            this.pool[_local_3] = (this.pool[_local_3] ^ ((_arg_1 >> 8) & 0xFF));
            var _local_4:* = this.pptr++;
            this.pool[_local_4] = (this.pool[_local_4] ^ ((_arg_1 >> 16) & 0xFF));
            var _local_5:* = this.pptr++;
            this.pool[_local_5] = (this.pool[_local_5] ^ ((_arg_1 >> 24) & 0xFF));
            this.pptr = (this.pptr % this.psize);
            this.seeded = true;
        }

        public function autoSeed():void
        {
            var _local_1:Font;
            var _local_2:ByteArray = new ByteArray();
            _local_2.writeUnsignedInt(System.totalMemory);
            _local_2.writeUTF(Capabilities.serverString);
            _local_2.writeUnsignedInt(getTimer());
            _local_2.writeUnsignedInt(new Date().getTime());
            var _local_3:Array = Font.enumerateFonts(true);
            for each (_local_1 in _local_3)
            {
                _local_2.writeUTF(_local_1.fontName);
                _local_2.writeUTF(_local_1.fontStyle);
                _local_2.writeUTF(_local_1.fontType);
            };
            _local_2.position = 0;
            while (_local_2.bytesAvailable >= 4)
            {
                this.seed(_local_2.readUnsignedInt());
            };
        }

        public function nextBytes(_arg_1:ByteArray, _arg_2:int):void
        {
            while (_arg_2--)
            {
                _arg_1.writeByte(this.nextByte());
            };
        }

        public function nextByte():int
        {
            if (!this.ready)
            {
                if (!this.seeded)
                {
                    this.autoSeed();
                };
                this.state.init(this.pool);
                this.pool.length = 0;
                this.pptr = 0;
                this.ready = true;
            };
            return (this.state.next());
        }

        public function dispose():void
        {
            var _local_1:uint;
            while (_local_1 < this.pool.length)
            {
                this.pool[_local_1] = (Math.random() * 0x0100);
                _local_1++;
            };
            this.pool.length = 0;
            this.pool = null;
            this.state.dispose();
            this.state = null;
            this.psize = 0;
            this.pptr = 0;
            Memory.gc();
        }

        public function toString():String
        {
            return ("random-" + this.state.toString());
        }


    }
}//package com.hurlant.crypto.prng

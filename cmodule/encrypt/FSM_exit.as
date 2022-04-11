﻿//Created by Action Script Viewer - https://www.buraks.com/asv
package cmodule.encrypt
{
    import avm2.intrinsics.memory.*; // ASC2.0, AIR3.6 SDK and above, FlasCC (Alchemy)

    public final class FSM_exit extends Machine 
    {

        public static const intRegCount:int = 2;
        public static const NumberRegCount:int = 0;

        public var i0:int;
        public var i1:int;


        public static function start():void
        {
            var _local_1:FSM_exit;
            _local_1 = new (FSM_exit)();
            gstate.gworker = _local_1;
        }


        final override public function work():void
        {
            switch (state)
            {
                case 0:
                    public::mstate.esp = (public::mstate.esp - 4);
                    si32(public::mstate.ebp, public::mstate.esp);
                    public::mstate.ebp = public::mstate.esp;
                    public::mstate.esp = (public::mstate.esp - 0);
                    this.i0 = li8(___cleanup_2E_b);
                    this.i1 = li32(public::mstate.ebp + 8);
                    this.i0 = (this.i0 ^ 0x01);
                    this.i0 = (this.i0 & 0x01);
                    if (!(!(this.i0 == 0)))
                    {
                        state = 1;
                        public::mstate.esp = (public::mstate.esp - 4);
                        FSM__cleanup.start();
                        return;
                    };
                case 1:
                    public::mstate.esp = (public::mstate.esp - 4);
                    si32(this.i1, public::mstate.esp);
                    public::mstate.esp = (public::mstate.esp - 4);
                    FSM__exit.start();
                case 2:
                    public::mstate.esp = (public::mstate.esp + 4);
                default:
                    throw ("Invalid state in _exit");
            };
        }


    }
}//package cmodule.encrypt

//Created by Action Script Viewer - https://www.buraks.com/asv
package cmodule.encrypt
{
    import avm2.intrinsics.memory.*; // ASC2.0, AIR3.6 SDK and above, FlasCC (Alchemy)

    public final class FSM_ftell extends Machine 
    {

        public static const intRegCount:int = 4;
        public static const NumberRegCount:int = 0;

        public var i0:int;
        public var i1:int;
        public var i2:int;
        public var i3:int;


        public static function start():void
        {
            var _local_1:FSM_ftell;
            _local_1 = new (FSM_ftell)();
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
                    public::mstate.esp = (public::mstate.esp - 8);
                    this.i0 = (public::mstate.ebp + -8);
                    public::mstate.esp = (public::mstate.esp - 8);
                    this.i1 = li32(public::mstate.ebp + 8);
                    si32(this.i1, public::mstate.esp);
                    si32(this.i0, (public::mstate.esp + 4));
                    state = 1;
                    public::mstate.esp = (public::mstate.esp - 4);
                    FSM__ftello.start();
                    return;
                case 1:
                    this.i0 = public::mstate.eax;
                    public::mstate.esp = (public::mstate.esp + 8);
                    if (!(this.i0 == 0))
                    {
                        this.i0 = -1;
                        this.i1 = this.i0;
                    }
                    else
                    {
                        this.i0 = li32(public::mstate.ebp + -8);
                        this.i1 = li32(public::mstate.ebp + -4);
                        if ((this.i1 < 0))
                        {
                            this.i0 = 29;
                            si32(this.i0, _val_2E_1440);
                            this.i0 = -1;
                            this.i1 = this.i0;
                        };
                    };
                    this.i2 = ((this.i1 < 0) ? 1 : 0);
                    this.i3 = ((uint(this.i0) < uint(-2147483648)) ? 1 : 0);
                    this.i1 = ((this.i1 == 0) ? 1 : 0);
                    this.i1 = ((this.i1 != 0) ? this.i3 : this.i2);
                    if (!(!(this.i1 == 0)))
                    {
                        this.i0 = 84;
                        si32(this.i0, _val_2E_1440);
                        this.i0 = -1;
                    };
                    public::mstate.eax = this.i0;
                    public::mstate.esp = public::mstate.ebp;
                    public::mstate.ebp = li32(public::mstate.esp);
                    public::mstate.esp = (public::mstate.esp + 4);
                    public::mstate.esp = (public::mstate.esp + 4);
                    public::mstate.gworker = caller;
                    return;
                default:
                    throw ("Invalid state in _ftell");
            };
        }


    }
}//package cmodule.encrypt

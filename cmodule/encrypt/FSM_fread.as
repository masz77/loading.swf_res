//Created by Action Script Viewer - https://www.buraks.com/asv
package cmodule.encrypt
{
    import avm2.intrinsics.memory.*; // ASC2.0, AIR3.6 SDK and above, FlasCC (Alchemy)

    public final class FSM_fread extends Machine 
    {

        public static const intRegCount:int = 8;
        public static const NumberRegCount:int = 0;

        public var i0:int;
        public var i1:int;
        public var i2:int;
        public var i3:int;
        public var i4:int;
        public var i5:int;
        public var i6:int;
        public var i7:int;


        public static function start():void
        {
            var _local_1:FSM_fread;
            _local_1 = new (FSM_fread)();
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
                    this.i0 = li32(public::mstate.ebp + 16);
                    this.i1 = li32(public::mstate.ebp + 12);
                    this.i2 = li32(public::mstate.ebp + 8);
                    this.i3 = li32(public::mstate.ebp + 20);
                    this.i0 = (this.i0 * this.i1);
                    if (this.i0 == 0) goto _label_4;
                    this.i1 = li32(this.i3 + 56);
                    this.i4 = li32(this.i1 + 16);
                    this.i1 = (this.i1 + 16);
                    if (!(!(this.i4 == 0)))
                    {
                        this.i4 = -1;
                        si32(this.i4, this.i1);
                    };
                    this.i1 = li32(this.i3 + 4);
                    this.i4 = (this.i3 + 4);
                    if (!(this.i1 < 0)) goto _label_2;
                    this.i1 = 0;
                    si32(this.i1, this.i4);
                    this.i1 = li32(this.i3);
                    if (this.i0 == 0) goto _label_3;
                    this.i5 = 0;
                    
                _label_1: 
                    this.i6 = this.i2;
                    this.i7 = this.i5;
                    memcpy(this.i6, this.i1, this.i7);
                    this.i1 = li32(this.i3);
                    this.i1 = (this.i1 + this.i5);
                    si32(this.i1, this.i3);
                    public::mstate.esp = (public::mstate.esp - 4);
                    si32(this.i3, public::mstate.esp);
                    state = 1;
                    public::mstate.esp = (public::mstate.esp - 4);
                    FSM___srefill.start();
                    return;
                case 1:
                    this.i1 = public::mstate.eax;
                    public::mstate.esp = (public::mstate.esp + 4);
                    this.i0 = (this.i0 - this.i5);
                    this.i2 = (this.i2 + this.i5);
                    if (!(!(this.i1 == 0)))
                    {
                        
                    _label_2: 
                        this.i1 = this.i2;
                        this.i5 = li32(this.i4);
                        this.i6 = li32(this.i3);
                        if (!(uint(this.i5) < uint(this.i0)))
                        {
                            this.i2 = this.i1;
                            this.i1 = this.i6;
                        }
                        else
                        {
                            this.i2 = this.i1;
                            this.i1 = this.i6;
                            goto _label_1;
                        };
                        
                    _label_3: 
                        this.i5 = this.i0;
                        memcpy(this.i2, this.i1, this.i5);
                        this.i1 = li32(this.i4);
                        this.i1 = (this.i1 - this.i0);
                        si32(this.i1, this.i4);
                        this.i1 = li32(this.i3);
                        this.i0 = (this.i1 + this.i0);
                        si32(this.i0, this.i3);
                    };
                    
                _label_4: 
                    public::mstate.esp = public::mstate.ebp;
                    public::mstate.ebp = li32(public::mstate.esp);
                    public::mstate.esp = (public::mstate.esp + 4);
                    public::mstate.esp = (public::mstate.esp + 4);
                    public::mstate.gworker = caller;
                    return;
                default:
                    throw ("Invalid state in _fread");
            };
        }


    }
}//package cmodule.encrypt

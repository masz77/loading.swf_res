﻿//Created by Action Script Viewer - https://www.buraks.com/asv
package cmodule.encrypt
{
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;
    import flash.text.*;
    import flash.net.*;
    import flash.system.*;
    import avm2.intrinsics.memory.*; // ASC2.0, AIR3.6 SDK and above, FlasCC (Alchemy)

    public final class FSM_fclose extends Machine 
    {

        public static const intRegCount:int = 5;
        public static const NumberRegCount:int = 0;

        public var i0:int;
        public var i1:int;
        public var i2:int;
        public var i3:int;
        public var i4:int;


        public static function start():void
        {
            var _local_1:FSM_fclose;
            _local_1 = new (FSM_fclose)();
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
                    this.i0 = li32(public::mstate.ebp + 8);
                    this.i1 = li16(this.i0 + 12);
                    this.i2 = (this.i0 + 12);
                    if (!(!(this.i1 == 0)))
                    {
                        this.i0 = 9;
                        si32(this.i0, _val_2E_1440);
                        
                    _label_1: 
                        public::mstate.esp = public::mstate.ebp;
                        public::mstate.ebp = li32(public::mstate.esp);
                        public::mstate.esp = (public::mstate.esp + 4);
                        public::mstate.esp = (public::mstate.esp + 4);
                        public::mstate.gworker = caller;
                        return;
                    };
                    this.i1 = (this.i1 & 0x08);
                    if (this.i1 == 0) goto _label_2;
                    public::mstate.esp = (public::mstate.esp - 4);
                    si32(this.i0, public::mstate.esp);
                    state = 1;
                    public::mstate.esp = (public::mstate.esp - 4);
                    FSM___sflush.start();
                    return;
                case 1:
                    this.i1 = public::mstate.eax;
                    public::mstate.esp = (public::mstate.esp + 4);
                    
                _label_2: 
                    this.i1 = li32(this.i0 + 32);
                    if (this.i1 == 0) goto _label_3;
                    this.i3 = li32(this.i0 + 28);
                    public::mstate.esp = (public::mstate.esp - 4);
                    si32(this.i3, public::mstate.esp);
                    state = 2;
                    public::mstate.esp = (public::mstate.esp - 4);
                    (public::mstate.funcs[this.i1]());
                    return;
                case 2:
                    this.i1 = public::mstate.eax;
                    public::mstate.esp = (public::mstate.esp + 4);
                    
                _label_3: 
                    this.i1 = li16(this.i2);
                    this.i1 = (this.i1 & 0x80);
                    if (this.i1 == 0) goto _label_4;
                    this.i1 = 0;
                    this.i3 = li32(this.i0 + 16);
                    public::mstate.esp = (public::mstate.esp - 8);
                    si32(this.i3, public::mstate.esp);
                    si32(this.i1, (public::mstate.esp + 4));
                    state = 3;
                    public::mstate.esp = (public::mstate.esp - 4);
                    FSM_pubrealloc.start();
                    return;
                case 3:
                    this.i1 = public::mstate.eax;
                    public::mstate.esp = (public::mstate.esp + 8);
                    
                _label_4: 
                    this.i1 = li32(this.i0 + 48);
                    this.i3 = (this.i0 + 48);
                    if (this.i1 == 0) goto _label_6;
                    this.i4 = (this.i0 + 64);
                    if (this.i1 == this.i4) goto _label_5;
                    this.i4 = 0;
                    public::mstate.esp = (public::mstate.esp - 8);
                    si32(this.i1, public::mstate.esp);
                    si32(this.i4, (public::mstate.esp + 4));
                    state = 4;
                    public::mstate.esp = (public::mstate.esp - 4);
                    FSM_pubrealloc.start();
                    return;
                case 4:
                    this.i1 = public::mstate.eax;
                    public::mstate.esp = (public::mstate.esp + 8);
                    
                _label_5: 
                    this.i1 = 0;
                    si32(this.i1, this.i3);
                    
                _label_6: 
                    this.i1 = li32(this.i0 + 68);
                    this.i3 = (this.i0 + 68);
                    if (this.i1 == 0) goto _label_7;
                    this.i4 = 0;
                    public::mstate.esp = (public::mstate.esp - 8);
                    si32(this.i1, public::mstate.esp);
                    si32(this.i4, (public::mstate.esp + 4));
                    state = 5;
                    public::mstate.esp = (public::mstate.esp - 4);
                    FSM_pubrealloc.start();
                    return;
                case 5:
                    this.i1 = public::mstate.eax;
                    public::mstate.esp = (public::mstate.esp + 8);
                    si32(this.i4, this.i3);
                    
                _label_7: 
                    this.i1 = -1;
                    si16(this.i1, (this.i0 + 14));
                    this.i1 = 0;
                    si32(this.i1, (this.i0 + 8));
                    si32(this.i1, (this.i0 + 4));
                    si16(this.i1, this.i2);
                    goto _label_1;
                default:
                    throw ("Invalid state in _fclose");
            };
        }


    }
}//package cmodule.encrypt

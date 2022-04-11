//Created by Action Script Viewer - https://www.buraks.com/asv
package cmodule.encrypt
{
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;
    import flash.text.*;
    import flash.net.*;
    import flash.system.*;
    import avm2.intrinsics.memory.*; // ASC2.0, AIR3.6 SDK and above, FlasCC (Alchemy)

    public final class FSM_decryptBytes extends Machine 
    {

        public static const intRegCount:int = 17;
        public static const NumberRegCount:int = 0;

        public var i10:int;
        public var i11:int;
        public var i12:int;
        public var i13:int;
        public var i14:int;
        public var i15:int;
        public var i16:int;
        public var i0:int;
        public var i1:int;
        public var i2:int;
        public var i3:int;
        public var i4:int;
        public var i5:int;
        public var i6:int;
        public var i7:int;
        public var i8:int;
        public var i9:int;


        public static function start():void
        {
            var _local_1:FSM_decryptBytes;
            _local_1 = new (FSM_decryptBytes)();
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
                    public::mstate.esp = (public::mstate.esp - 80);
                    this.i0 = 0;
                    si32(this.i0, (public::mstate.ebp + -68));
                    public::mstate.esp = (public::mstate.esp - 16);
                    this.i0 = li32(public::mstate.ebp + 12);
                    this.i1 = __2E_str1100;
                    this.i2 = (public::mstate.ebp + -72);
                    this.i3 = (public::mstate.ebp + -68);
                    si32(this.i0, public::mstate.esp);
                    si32(this.i1, (public::mstate.esp + 4));
                    si32(this.i2, (public::mstate.esp + 8));
                    si32(this.i3, (public::mstate.esp + 12));
                    state = 1;
                    public::mstate.esp = (public::mstate.esp - 4);
                    (public::mstate.funcs[_AS3_ArrayValue]());
                    return;
                case 1:
                    public::mstate.esp = (public::mstate.esp + 16);
                    this.i0 = li32(public::mstate.ebp + -72);
                    state = 2;
                    public::mstate.esp = (public::mstate.esp - 4);
                    FSM___sfp.start();
                    return;
                case 2:
                    this.i1 = public::mstate.eax;
                    if (!(!(this.i1 == 0)))
                    {
                        this.i0 = 0;
                    }
                    else
                    {
                        this.i2 = 16;
                        si16(this.i2, (this.i1 + 12));
                        this.i2 = -1;
                        si16(this.i2, (this.i1 + 14));
                        si32(this.i0, (this.i1 + 28));
                        this.i0 = _readByteArray;
                        si32(this.i0, (this.i1 + 36));
                        this.i0 = _writeByteArray;
                        si32(this.i0, (this.i1 + 44));
                        this.i0 = _seekByteArray;
                        si32(this.i0, (this.i1 + 40));
                        this.i0 = _closeByteArray;
                        si32(this.i0, (this.i1 + 32));
                        this.i0 = this.i1;
                    };
                    this.i1 = 2;
                    public::mstate.esp = (public::mstate.esp - 12);
                    this.i2 = 0;
                    si32(this.i0, public::mstate.esp);
                    si32(this.i2, (public::mstate.esp + 4));
                    si32(this.i1, (public::mstate.esp + 8));
                    state = 3;
                    public::mstate.esp = (public::mstate.esp - 4);
                    FSM_fseek.start();
                    return;
                case 3:
                    public::mstate.esp = (public::mstate.esp + 12);
                    public::mstate.esp = (public::mstate.esp - 4);
                    si32(this.i0, public::mstate.esp);
                    state = 4;
                    public::mstate.esp = (public::mstate.esp - 4);
                    FSM_ftell.start();
                    return;
                case 4:
                    this.i1 = public::mstate.eax;
                    public::mstate.esp = (public::mstate.esp + 4);
                    public::mstate.esp = (public::mstate.esp - 4);
                    si32(this.i0, public::mstate.esp);
                    state = 5;
                    public::mstate.esp = (public::mstate.esp - 4);
                    FSM_rewind.start();
                    return;
                case 5:
                    public::mstate.esp = (public::mstate.esp + 4);
                    public::mstate.esp = (public::mstate.esp - 12);
                    this.i3 = 4;
                    si32(this.i0, public::mstate.esp);
                    si32(this.i3, (public::mstate.esp + 4));
                    si32(this.i2, (public::mstate.esp + 8));
                    state = 6;
                    public::mstate.esp = (public::mstate.esp - 4);
                    FSM_fseek.start();
                    return;
                case 6:
                    public::mstate.esp = (public::mstate.esp + 12);
                    public::mstate.esp = (public::mstate.esp - 8);
                    this.i1 = (this.i1 + -4);
                    si32(this.i2, public::mstate.esp);
                    si32(this.i1, (public::mstate.esp + 4));
                    state = 7;
                    public::mstate.esp = (public::mstate.esp - 4);
                    FSM_pubrealloc.start();
                    return;
                case 7:
                    this.i2 = public::mstate.eax;
                    public::mstate.esp = (public::mstate.esp + 8);
                    public::mstate.esp = (public::mstate.esp - 16);
                    this.i3 = 1;
                    si32(this.i2, public::mstate.esp);
                    si32(this.i3, (public::mstate.esp + 4));
                    si32(this.i1, (public::mstate.esp + 8));
                    si32(this.i0, (public::mstate.esp + 12));
                    state = 8;
                    public::mstate.esp = (public::mstate.esp - 4);
                    FSM_fread.start();
                    return;
                case 8:
                    public::mstate.esp = (public::mstate.esp + 16);
                    public::mstate.esp = (public::mstate.esp - 4);
                    si32(this.i0, public::mstate.esp);
                    state = 9;
                    public::mstate.esp = (public::mstate.esp - 4);
                    FSM_fclose.start();
                    return;
                case 9:
                    public::mstate.esp = (public::mstate.esp + 4);
                    this.i0 = li32(public::mstate.ebp + -72);
                    state = 10;
                    public::mstate.esp = (public::mstate.esp - 4);
                    FSM___sfp.start();
                    return;
                case 10:
                    this.i3 = public::mstate.eax;
                    if (!(!(this.i3 == 0)))
                    {
                        this.i0 = 0;
                    }
                    else
                    {
                        this.i4 = 16;
                        si16(this.i4, (this.i3 + 12));
                        this.i4 = -1;
                        si16(this.i4, (this.i3 + 14));
                        si32(this.i0, (this.i3 + 28));
                        this.i0 = _readByteArray;
                        si32(this.i0, (this.i3 + 36));
                        this.i0 = _writeByteArray;
                        si32(this.i0, (this.i3 + 44));
                        this.i0 = _seekByteArray;
                        si32(this.i0, (this.i3 + 40));
                        this.i0 = _closeByteArray;
                        si32(this.i0, (this.i3 + 32));
                        this.i0 = this.i3;
                    };
                    this.i3 = li32(public::mstate.ebp + -68);
                    if (!(this.i3 == 1))
                    {
                        if (!(!(this.i3 == 0)))
                        {
                            this.i3 = -1829543817;
                            this.i4 = 0;
                            this.i5 = 45212;
                            this.i6 = 67641;
                            this.i7 = 94157;
                            this.i8 = 31264;
                            goto _label_2;
                        };
                        this.i3 = 0;
                        this.i8 = this.i3;
                        this.i7 = this.i3;
                        this.i6 = this.i3;
                        this.i5 = this.i3;
                        this.i4 = this.i3;
                        goto _label_2;
                    };
                    if (this.i1 == 0) goto _label_3;
                    this.i3 = 1309368235;
                    this.i4 = 0;
                    this.i5 = 65454;
                    this.i6 = 81657;
                    this.i7 = 90634;
                    this.i8 = 27432;
                    
                _label_1: 
                    this.i9 = 0;
                    this.i10 = (this.i2 + this.i4);
                    this.i10 = li32(this.i10);
                    si32(this.i10, (public::mstate.ebp + -76));
                    this.i11 = (this.i4 + this.i2);
                    this.i11 = li32(this.i11 + 4);
                    si32(this.i11, (public::mstate.ebp + -80));
                    this.i12 = (this.i3 << 4);
                    this.i13 = (-57344 - this.i6);
                    this.i14 = (-57344 - this.i8);
                    do 
                    {
                        this.i11 = (this.i14 + this.i11);
                        this.i15 = (this.i10 << 4);
                        this.i11 = (this.i11 - this.i15);
                        this.i15 = (this.i10 ^ this.i7);
                        this.i16 = (this.i10 >>> 8);
                        this.i11 = (this.i11 - this.i15);
                        this.i15 = (this.i16 ^ this.i12);
                        this.i11 = (this.i11 - this.i15);
                        this.i10 = (this.i13 + this.i10);
                        this.i15 = (this.i11 << 4);
                        this.i16 = (this.i11 >>> 8);
                        this.i10 = (this.i10 - this.i15);
                        this.i15 = (this.i11 ^ this.i5);
                        this.i10 = (this.i10 - this.i15);
                        this.i15 = (this.i16 ^ this.i12);
                        this.i12 = (this.i12 - this.i3);
                        this.i9 = (this.i9 + 1);
                        this.i10 = (this.i10 - this.i15);
                    } while (!(this.i9 == 16));
                    this.i9 = (public::mstate.ebp + -76);
                    si32(this.i11, (public::mstate.ebp + -80));
                    si32(this.i10, (public::mstate.ebp + -76));
                    si32(this.i9, (public::mstate.ebp + -8));
                    this.i9 = 4;
                    si32(this.i9, (public::mstate.ebp + -4));
                    si32(this.i9, (public::mstate.ebp + -24));
                    this.i9 = (public::mstate.ebp + -8);
                    si32(this.i9, (public::mstate.ebp + -32));
                    this.i9 = 1;
                    si32(this.i9, (public::mstate.ebp + -28));
                    this.i9 = li32(this.i0 + 56);
                    this.i10 = li32(this.i9 + 16);
                    this.i9 = (this.i9 + 16);
                    this.i11 = (this.i0 + 56);
                    if (!(!(this.i10 == 0)))
                    {
                        this.i10 = -1;
                        si32(this.i10, this.i9);
                    };
                    this.i9 = (public::mstate.ebp + -32);
                    public::mstate.esp = (public::mstate.esp - 8);
                    si32(this.i0, public::mstate.esp);
                    si32(this.i9, (public::mstate.esp + 4));
                    state = 11;
                    public::mstate.esp = (public::mstate.esp - 4);
                    FSM___sfvwrite.start();
                    return;
                case 11:
                    this.i9 = public::mstate.eax;
                    public::mstate.esp = (public::mstate.esp + 8);
                    this.i9 = (public::mstate.ebp + -80);
                    si32(this.i9, (public::mstate.ebp + -40));
                    this.i9 = 4;
                    si32(this.i9, (public::mstate.ebp + -36));
                    si32(this.i9, (public::mstate.ebp + -56));
                    this.i9 = (public::mstate.ebp + -40);
                    si32(this.i9, (public::mstate.ebp + -64));
                    this.i9 = 1;
                    si32(this.i9, (public::mstate.ebp + -60));
                    this.i9 = li32(this.i11);
                    this.i10 = li32(this.i9 + 16);
                    this.i9 = (this.i9 + 16);
                    if (!(!(this.i10 == 0)))
                    {
                        this.i10 = -1;
                        si32(this.i10, this.i9);
                    };
                    this.i9 = (public::mstate.ebp + -64);
                    public::mstate.esp = (public::mstate.esp - 8);
                    si32(this.i0, public::mstate.esp);
                    si32(this.i9, (public::mstate.esp + 4));
                    state = 12;
                    public::mstate.esp = (public::mstate.esp - 4);
                    FSM___sfvwrite.start();
                    return;
                case 12:
                    this.i9 = public::mstate.eax;
                    public::mstate.esp = (public::mstate.esp + 8);
                    this.i4 = (this.i4 + 8);
                    
                _label_2: 
                    if (!(uint(this.i4) >= uint(this.i1))) goto _label_1;
                    
                _label_3: 
                    this.i3 = 0;
                    public::mstate.esp = (public::mstate.esp - 8);
                    si32(this.i2, public::mstate.esp);
                    si32(this.i3, (public::mstate.esp + 4));
                    state = 13;
                    public::mstate.esp = (public::mstate.esp - 4);
                    FSM_pubrealloc.start();
                    return;
                case 13:
                    this.i2 = public::mstate.eax;
                    public::mstate.esp = (public::mstate.esp + 8);
                    public::mstate.esp = (public::mstate.esp - 4);
                    si32(this.i0, public::mstate.esp);
                    state = 14;
                    public::mstate.esp = (public::mstate.esp - 4);
                    FSM_fclose.start();
                    return;
                case 14:
                    public::mstate.esp = (public::mstate.esp + 4);
                    public::mstate.esp = (public::mstate.esp - 4);
                    si32(this.i1, public::mstate.esp);
                    state = 15;
                    public::mstate.esp = (public::mstate.esp - 4);
                    (public::mstate.funcs[_AS3_Int]());
                    return;
                case 15:
                    this.i0 = public::mstate.eax;
                    public::mstate.esp = (public::mstate.esp + 4);
                    public::mstate.eax = this.i0;
                    public::mstate.esp = public::mstate.ebp;
                    public::mstate.ebp = li32(public::mstate.esp);
                    public::mstate.esp = (public::mstate.esp + 4);
                    public::mstate.esp = (public::mstate.esp + 4);
                    public::mstate.gworker = caller;
                    return;
                default:
                    throw ("Invalid state in _decryptBytes");
            };
        }


    }
}//package cmodule.encrypt

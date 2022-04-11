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

    public final class FSM_encryptBytes extends Machine 
    {

        public static const intRegCount:int = 12;
        public static const NumberRegCount:int = 0;

        public var i10:int;
        public var i11:int;
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
            var _local_1:FSM_encryptBytes;
            _local_1 = new (FSM_encryptBytes)();
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
                    public::mstate.esp = (public::mstate.esp - 128);
                    this.i0 = (public::mstate.ebp + -32);
                    this.i1 = _C_2E_4_2E_2802;
                    this.i2 = 16;
                    memcpy(this.i0, this.i1, this.i2);
                    public::mstate.esp = (public::mstate.esp - 12);
                    this.i1 = li32(public::mstate.ebp + 12);
                    this.i2 = __2E_str3102;
                    this.i3 = (public::mstate.ebp + -4);
                    si32(this.i1, public::mstate.esp);
                    si32(this.i2, (public::mstate.esp + 4));
                    si32(this.i3, (public::mstate.esp + 8));
                    state = 1;
                    public::mstate.esp = (public::mstate.esp - 4);
                    (public::mstate.funcs[_AS3_ArrayValue]());
                    return;
                case 1:
                    public::mstate.esp = (public::mstate.esp + 12);
                    this.i1 = li32(public::mstate.ebp + -4);
                    state = 2;
                    public::mstate.esp = (public::mstate.esp - 4);
                    FSM___sfp.start();
                    return;
                case 2:
                    this.i2 = public::mstate.eax;
                    if (!(!(this.i2 == 0)))
                    {
                        this.i1 = 0;
                    }
                    else
                    {
                        this.i3 = 16;
                        si16(this.i3, (this.i2 + 12));
                        this.i3 = -1;
                        si16(this.i3, (this.i2 + 14));
                        si32(this.i1, (this.i2 + 28));
                        this.i1 = _readByteArray;
                        si32(this.i1, (this.i2 + 36));
                        this.i1 = _writeByteArray;
                        si32(this.i1, (this.i2 + 44));
                        this.i1 = _seekByteArray;
                        si32(this.i1, (this.i2 + 40));
                        this.i1 = _closeByteArray;
                        si32(this.i1, (this.i2 + 32));
                        this.i1 = this.i2;
                    };
                    this.i2 = 2;
                    public::mstate.esp = (public::mstate.esp - 12);
                    this.i3 = 0;
                    si32(this.i1, public::mstate.esp);
                    si32(this.i3, (public::mstate.esp + 4));
                    si32(this.i2, (public::mstate.esp + 8));
                    state = 3;
                    public::mstate.esp = (public::mstate.esp - 4);
                    FSM_fseek.start();
                    return;
                case 3:
                    public::mstate.esp = (public::mstate.esp + 12);
                    public::mstate.esp = (public::mstate.esp - 4);
                    si32(this.i1, public::mstate.esp);
                    state = 4;
                    public::mstate.esp = (public::mstate.esp - 4);
                    FSM_ftell.start();
                    return;
                case 4:
                    this.i2 = public::mstate.eax;
                    public::mstate.esp = (public::mstate.esp + 4);
                    public::mstate.esp = (public::mstate.esp - 4);
                    si32(this.i1, public::mstate.esp);
                    state = 5;
                    public::mstate.esp = (public::mstate.esp - 4);
                    FSM_rewind.start();
                    return;
                case 5:
                    public::mstate.esp = (public::mstate.esp + 4);
                    public::mstate.esp = (public::mstate.esp - 8);
                    this.i4 = (this.i2 + 9);
                    si32(this.i3, public::mstate.esp);
                    si32(this.i4, (public::mstate.esp + 4));
                    state = 6;
                    public::mstate.esp = (public::mstate.esp - 4);
                    FSM_pubrealloc.start();
                    return;
                case 6:
                    this.i3 = public::mstate.eax;
                    public::mstate.esp = (public::mstate.esp + 8);
                    this.i5 = 66;
                    si8(this.i5, this.i3);
                    this.i5 = 97;
                    si8(this.i5, (this.i3 + 1));
                    this.i5 = 98;
                    si8(this.i5, (this.i3 + 2));
                    this.i5 = 101;
                    si8(this.i5, (this.i3 + 3));
                    this.i6 = 108;
                    si8(this.i6, (this.i3 + 4));
                    this.i6 = 84;
                    si8(this.i6, (this.i3 + 5));
                    this.i6 = 105;
                    si8(this.i6, (this.i3 + 6));
                    this.i6 = 109;
                    si8(this.i6, (this.i3 + 7));
                    si8(this.i5, (this.i3 + 8));
                    public::mstate.esp = (public::mstate.esp - 16);
                    this.i5 = (this.i3 + 9);
                    this.i6 = 1;
                    si32(this.i5, public::mstate.esp);
                    si32(this.i6, (public::mstate.esp + 4));
                    si32(this.i2, (public::mstate.esp + 8));
                    si32(this.i1, (public::mstate.esp + 12));
                    state = 7;
                    public::mstate.esp = (public::mstate.esp - 4);
                    FSM_fread.start();
                    return;
                case 7:
                    public::mstate.esp = (public::mstate.esp + 16);
                    public::mstate.esp = (public::mstate.esp - 4);
                    si32(this.i1, public::mstate.esp);
                    state = 8;
                    public::mstate.esp = (public::mstate.esp - 4);
                    FSM_fclose.start();
                    return;
                case 8:
                    public::mstate.esp = (public::mstate.esp + 4);
                    this.i1 = this.i3;
                    if (!(this.i2 == 1))
                    {
                        this.i5 = 0;
                        this.i6 = (this.i2 + -1);
                        do 
                        {
                            this.i7 = (this.i3 + this.i5);
                            this.i8 = li8(this.i7 + 9);
                            this.i9 = li8(this.i7 + 10);
                            this.i8 = (this.i9 ^ this.i8);
                            si8(this.i8, (this.i7 + 9));
                            this.i5 = (this.i5 + 1);
                        } while (!(this.i5 == this.i6));
                    };
                    this.i3 = 1732584193;
                    this.i5 = (this.i2 + this.i1);
                    this.i6 = li8(this.i5 + 8);
                    this.i6 = (this.i6 ^ this.i2);
                    si8(this.i6, (this.i5 + 8));
                    si32(this.i3, (public::mstate.ebp + -128));
                    this.i3 = -271733879;
                    si32(this.i3, (public::mstate.ebp + -124));
                    this.i3 = -1732584194;
                    si32(this.i3, (public::mstate.ebp + -120));
                    this.i3 = 271733878;
                    si32(this.i3, (public::mstate.ebp + -116));
                    this.i3 = (this.i4 << 3);
                    this.i5 = (public::mstate.ebp + -128);
                    si32(this.i3, (public::mstate.ebp + -112));
                    this.i3 = (this.i4 >>> 29);
                    si32(this.i3, (public::mstate.ebp + -108));
                    this.i3 = (this.i5 + 24);
                    this.i4 = (this.i5 + 20);
                    this.i2 = (this.i2 + 9);
                    this.i6 = (this.i5 + 16);
                    this.i7 = this.i3;
                    this.i8 = this.i1;
                    
                _label_1: 
                    if (uint(this.i2) < uint(64)) goto _label_2;
                    this.i9 = 64;
                    this.i10 = this.i3;
                    this.i11 = this.i8;
                    memcpy(this.i10, this.i11, this.i9);
                    public::mstate.esp = (public::mstate.esp - 8);
                    si32(this.i5, public::mstate.esp);
                    si32(this.i7, (public::mstate.esp + 4));
                    public::mstate.esp = (public::mstate.esp - 4);
                    FSM_MD5Transform.start();
                case 9:
                    public::mstate.esp = (public::mstate.esp + 8);
                    this.i2 = (this.i2 + -64);
                    this.i8 = (this.i8 + 64);
                    goto _label_1;
                    
                _label_2: 
                    this.i9 = (public::mstate.ebp + -128);
                    this.i10 = this.i3;
                    memcpy(this.i10, this.i8, this.i2);
                    this.i2 = li32(this.i6);
                    this.i2 = (this.i2 >>> 3);
                    this.i2 = (this.i2 & 0x3F);
                    this.i8 = (this.i9 + 24);
                    this.i9 = (this.i2 + this.i8);
                    this.i10 = -128;
                    this.i8 = (this.i8 + this.i2);
                    si8(this.i10, this.i8);
                    this.i8 = (this.i9 + 1);
                    this.i2 = (63 - this.i2);
                    if (uint(this.i2) > uint(7)) goto _label_3;
                    this.i9 = 0;
                    memset(this.i8, this.i9, this.i2);
                    public::mstate.esp = (public::mstate.esp - 8);
                    si32(this.i5, public::mstate.esp);
                    si32(this.i7, (public::mstate.esp + 4));
                    public::mstate.esp = (public::mstate.esp - 4);
                    FSM_MD5Transform.start();
                case 10:
                    public::mstate.esp = (public::mstate.esp + 8);
                    this.i2 = this.i3;
                    this.i8 = this.i9;
                    this.i3 = 56;
                    memset(this.i2, this.i8, this.i3);
                    goto _label_4;
                    
                _label_3: 
                    this.i3 = 0;
                    this.i2 = (this.i2 + -8);
                    memset(this.i8, this.i3, this.i2);
                    
                _label_4: 
                    this.i2 = __2E_str4103;
                    this.i3 = li32(this.i6);
                    si32(this.i3, (this.i7 + 56));
                    this.i3 = li32(this.i4);
                    si32(this.i3, (this.i7 + 60));
                    public::mstate.esp = (public::mstate.esp - 8);
                    si32(this.i5, public::mstate.esp);
                    si32(this.i7, (public::mstate.esp + 4));
                    public::mstate.esp = (public::mstate.esp - 4);
                    FSM_MD5Transform.start();
                case 11:
                    public::mstate.esp = (public::mstate.esp + 8);
                    this.i3 = li32(public::mstate.ebp + -128);
                    this.i4 = li32(public::mstate.ebp + -124);
                    this.i5 = li32(public::mstate.ebp + -120);
                    this.i6 = li32(public::mstate.ebp + -116);
                    si32(this.i3, this.i0);
                    si32(this.i4, (this.i0 + 4));
                    si32(this.i5, (this.i0 + 8));
                    si32(this.i6, (this.i0 + 12));
                    public::mstate.esp = (public::mstate.esp - 4);
                    si32(this.i2, public::mstate.esp);
                    state = 12;
                    public::mstate.esp = (public::mstate.esp - 4);
                    (public::mstate.funcs[_AS3_String]());
                    return;
                case 12:
                    this.i2 = public::mstate.eax;
                    public::mstate.esp = (public::mstate.esp + 4);
                    public::mstate.esp = (public::mstate.esp - 4);
                    this.i3 = __2E_str45;
                    si32(this.i3, public::mstate.esp);
                    state = 13;
                    public::mstate.esp = (public::mstate.esp - 4);
                    (public::mstate.funcs[_AS3_Array]());
                    return;
                case 13:
                    this.i3 = public::mstate.eax;
                    public::mstate.esp = (public::mstate.esp + 4);
                    public::mstate.esp = (public::mstate.esp - 8);
                    this.i4 = __2E_str6105;
                    si32(this.i2, public::mstate.esp);
                    si32(this.i4, (public::mstate.esp + 4));
                    state = 14;
                    public::mstate.esp = (public::mstate.esp - 4);
                    (public::mstate.funcs[_AS3_NSGetS]());
                    return;
                case 14:
                    this.i4 = public::mstate.eax;
                    public::mstate.esp = (public::mstate.esp + 8);
                    public::mstate.esp = (public::mstate.esp - 8);
                    si32(this.i4, public::mstate.esp);
                    si32(this.i3, (public::mstate.esp + 4));
                    state = 15;
                    public::mstate.esp = (public::mstate.esp - 4);
                    (public::mstate.funcs[_AS3_New]());
                    return;
                case 15:
                    this.i5 = public::mstate.eax;
                    public::mstate.esp = (public::mstate.esp + 8);
                    public::mstate.esp = (public::mstate.esp - 12);
                    this.i6 = 16;
                    si32(this.i5, public::mstate.esp);
                    si32(this.i0, (public::mstate.esp + 4));
                    si32(this.i6, (public::mstate.esp + 8));
                    state = 16;
                    public::mstate.esp = (public::mstate.esp - 4);
                    (public::mstate.funcs[_AS3_ByteArray_writeBytes]());
                    return;
                case 16:
                    this.i0 = public::mstate.eax;
                    public::mstate.esp = (public::mstate.esp + 12);
                    public::mstate.esp = (public::mstate.esp - 4);
                    si32(this.i2, public::mstate.esp);
                    state = 17;
                    public::mstate.esp = (public::mstate.esp - 4);
                    (public::mstate.funcs[_AS3_Release]());
                    return;
                case 17:
                    public::mstate.esp = (public::mstate.esp + 4);
                    public::mstate.esp = (public::mstate.esp - 4);
                    si32(this.i3, public::mstate.esp);
                    state = 18;
                    public::mstate.esp = (public::mstate.esp - 4);
                    (public::mstate.funcs[_AS3_Release]());
                    return;
                case 18:
                    public::mstate.esp = (public::mstate.esp + 4);
                    public::mstate.esp = (public::mstate.esp - 4);
                    si32(this.i4, public::mstate.esp);
                    state = 19;
                    public::mstate.esp = (public::mstate.esp - 4);
                    (public::mstate.funcs[_AS3_Release]());
                    return;
                case 19:
                    public::mstate.esp = (public::mstate.esp + 4);
                    public::mstate.esp = (public::mstate.esp - 8);
                    this.i0 = 0;
                    si32(this.i1, public::mstate.esp);
                    si32(this.i0, (public::mstate.esp + 4));
                    state = 20;
                    public::mstate.esp = (public::mstate.esp - 4);
                    FSM_pubrealloc.start();
                    return;
                case 20:
                    this.i0 = public::mstate.eax;
                    public::mstate.esp = (public::mstate.esp + 8);
                    public::mstate.eax = this.i5;
                    public::mstate.esp = public::mstate.ebp;
                    public::mstate.ebp = li32(public::mstate.esp);
                    public::mstate.esp = (public::mstate.esp + 4);
                    public::mstate.esp = (public::mstate.esp + 4);
                    public::mstate.gworker = caller;
                    return;
                default:
                    throw ("Invalid state in _encryptBytes");
            };
        }


    }
}//package cmodule.encrypt

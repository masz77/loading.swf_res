﻿//Created by Action Script Viewer - https://www.buraks.com/asv
package cmodule.encrypt
{
    import avm2.intrinsics.memory.*; // ASC2.0, AIR3.6 SDK and above, FlasCC (Alchemy)

    public final class FSM___trailz_D2A extends Machine 
    {


        public static function start():void
        {
            var _local_1:int;
            var _local_2:int;
            var _local_3:int;
            var _local_4:int;
            var _local_5:int;
            var _local_6:int;
            var _local_7:int;
            mstate.esp = (mstate.esp - 4);
            si32(mstate.ebp, mstate.esp);
            mstate.ebp = mstate.esp;
            mstate.esp = (mstate.esp - 4);
            _local_1 = li32(mstate.ebp + 8);
            _local_2 = li32(_local_1 + 16);
            _local_3 = (_local_1 + 20);
            _local_4 = (_local_2 << 2);
            _local_4 = (_local_3 + _local_4);
            if (!(_local_2 > 0))
            {
                _local_1 = 0;
                _local_2 = _local_3;
            }
            else
            {
                _local_3 = 0;
                _local_1 = (_local_1 + 20);
                _local_5 = _local_3;
                do 
                {
                    _local_6 = li32(_local_1);
                    _local_7 = _local_1;
                    if (!(_local_6 == 0)) goto _label_1;
                    _local_5 = (_local_5 + 32);
                    _local_1 = (_local_1 + 4);
                    _local_3 = (_local_3 + 1);
                    _local_6 = _local_1;
                } while ((_local_3 < _local_2));
                _local_1 = _local_5;
                _local_2 = _local_6;
                goto _label_2;
                
            _label_1: 
                _local_1 = _local_5;
                _local_2 = _local_7;
            };
            
        _label_2: 
            if (!(uint(_local_2) >= uint(_local_4)))
            {
                _local_3 = (mstate.ebp + -4);
                _local_2 = li32(_local_2);
                si32(_local_2, (mstate.ebp + -4));
                mstate.esp = (mstate.esp - 4);
                si32(_local_3, mstate.esp);
                mstate.esp = (mstate.esp - 4);
                FSM___lo0bits_D2A.start();
                _local_2 = mstate.eax;
                mstate.esp = (mstate.esp + 4);
                _local_1 = (_local_2 + _local_1);
            };
            mstate.eax = _local_1;
            mstate.esp = mstate.ebp;
            mstate.ebp = li32(mstate.esp);
            mstate.esp = (mstate.esp + 4);
            mstate.esp = (mstate.esp + 4);
        }


    }
}//package cmodule.encrypt

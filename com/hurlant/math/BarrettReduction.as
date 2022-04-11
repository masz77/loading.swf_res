﻿//Created by Action Script Viewer - https://www.buraks.com/asv
package com.hurlant.math
{
    use namespace bi_internal;

    public class BarrettReduction implements IReduction 
    {

        private var m:BigInteger;
        private var r2:BigInteger;
        private var q3:BigInteger;
        private var mu:BigInteger;

        public function BarrettReduction(_arg_1:BigInteger)
        {
            this.r2 = new BigInteger();
            this.q3 = new BigInteger();
            BigInteger.ONE.dlShiftTo((2 * _arg_1.t), this.r2);
            this.mu = this.r2.divide(_arg_1);
            this.m = _arg_1;
        }

        public function revert(_arg_1:BigInteger):BigInteger
        {
            return (_arg_1);
        }

        public function mulTo(_arg_1:BigInteger, _arg_2:BigInteger, _arg_3:BigInteger):void
        {
            _arg_1.multiplyTo(_arg_2, _arg_3);
            this.reduce(_arg_3);
        }

        public function sqrTo(_arg_1:BigInteger, _arg_2:BigInteger):void
        {
            _arg_1.squareTo(_arg_2);
            this.reduce(_arg_2);
        }

        public function convert(_arg_1:BigInteger):BigInteger
        {
            if (((_arg_1.s < 0) || (_arg_1.t > (2 * this.m.t))))
            {
                return (_arg_1.mod(this.m));
            };
            if (_arg_1.compareTo(this.m) < 0)
            {
                return (_arg_1);
            };
            var _local_2:BigInteger = new BigInteger();
            _arg_1.copyTo(_local_2);
            this.reduce(_local_2);
            return (_local_2);
        }

        public function reduce(_arg_1:BigInteger):void
        {
            var _local_2:BigInteger = (_arg_1 as BigInteger);
            _local_2.drShiftTo((this.m.t - 1), this.r2);
            if (_local_2.t > (this.m.t + 1))
            {
                _local_2.t = (this.m.t + 1);
                _local_2.clamp();
            };
            this.mu.multiplyUpperTo(this.r2, (this.m.t + 1), this.q3);
            this.m.multiplyLowerTo(this.q3, (this.m.t + 1), this.r2);
            while (_local_2.compareTo(this.r2) < 0)
            {
                _local_2.dAddOffset(1, (this.m.t + 1));
            };
            _local_2.subTo(this.r2, _local_2);
            while (_local_2.compareTo(this.m) >= 0)
            {
                _local_2.subTo(this.m, _local_2);
            };
        }


    }
}//package com.hurlant.math

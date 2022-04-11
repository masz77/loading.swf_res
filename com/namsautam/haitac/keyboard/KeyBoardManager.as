//Created by Action Script Viewer - https://www.buraks.com/asv
package com.namsautam.haitac.keyboard
{
    import flash.display.Stage;
    import flash.events.KeyboardEvent;

    public class KeyBoardManager 
    {

        private static var stage:Stage;
        private static var targetList:Array = [];


        public static function init(_arg_1:Stage):void
        {
            KeyBoardManager.stage = _arg_1;
            _arg_1.addEventListener(KeyboardEvent.KEY_UP, onKeyHandler);
        }

        private static function onKeyHandler(_arg_1:KeyboardEvent):void
        {
            var _local_3:Object;
            var _local_2:int;
            while (_local_2 < targetList.length)
            {
                _local_3 = targetList[_local_2];
                if (((_local_3.target.visible) && (_arg_1.keyCode == _local_3.keyCode)))
                {
                    _local_3.callback();
                };
                _local_2++;
            };
        }

        public static function destroy():void
        {
            stage.removeEventListener(KeyboardEvent.KEY_UP, onKeyHandler);
            stage = null;
        }

        public static function register(_arg_1:*, _arg_2:uint, _arg_3:Function):void
        {
            targetList.push({
                "target":_arg_1,
                "keyCode":_arg_2,
                "callback":_arg_3
            });
        }


    }
}//package com.namsautam.haitac.keyboard

//Created by Action Script Viewer - https://www.buraks.com/asv
package com.namsautam.haitac.component
{
    import flash.display.Sprite;
    import flash.text.TextField;
    import flash.display.SimpleButton;
    import flash.events.FocusEvent;
    import flash.events.SoftKeyboardEvent;
    import flash.events.Event;

    public class TextInputWrapper extends Sprite 
    {

        private var input:TextField;
        private var placeHolder:String;
        private var isPassWord:Boolean;
        private var clearBtn:SimpleButton;
        private var softInputText:SoftInputText;

        public function TextInputWrapper(_arg_1:TextField, _arg_2:String, _arg_3:SimpleButton, _arg_4:SoftInputText)
        {
            this.isPassWord = _arg_1.displayAsPassword;
            this.input = _arg_1;
            this.input.addEventListener(FocusEvent.FOCUS_IN, this.onFocusIn);
            this.input.addEventListener(FocusEvent.FOCUS_OUT, this.onFocusOut);
            this.input.addEventListener(SoftKeyboardEvent.SOFT_KEYBOARD_ACTIVATE, this.onKeyBoardShowed);
            this.input.addEventListener(Event.CHANGE, this.onChange);
            this.input.displayAsPassword = false;
            this.input.text = _arg_2;
            this.placeHolder = _arg_2;
            this.clearBtn = _arg_3;
            this.softInputText = _arg_4;
        }

        public static function createTextInputWrapper(_arg_1:TextField, _arg_2:String, _arg_3:SimpleButton=null, _arg_4:SoftInputText=null):TextInputWrapper
        {
            return (new TextInputWrapper(_arg_1, _arg_2, _arg_3, _arg_4));
        }


        private function onKeyBoardShowed(_arg_1:SoftKeyboardEvent):void
        {
            if (this.softInputText)
            {
                this.softInputText.visible = true;
            };
        }

        private function onChange(_arg_1:Event):void
        {
            if (this.clearBtn != null)
            {
                this.clearBtn.visible = (!(this.isEmpty()));
            };
            if (this.softInputText)
            {
                this.softInputText.setText(this.input.text);
            };
        }

        public function clearText():void
        {
            this.input.displayAsPassword = false;
            this.input.text = this.placeHolder;
            this.clearBtn.visible = false;
            if (this.softInputText)
            {
                this.softInputText.setText("");
            };
        }

        private function onFocusOut(_arg_1:FocusEvent):void
        {
            if (this.isEmpty())
            {
                this.input.displayAsPassword = false;
                this.input.text = this.placeHolder;
            };
            if (this.softInputText)
            {
                this.softInputText.visible = false;
            };
        }

        private function onFocusIn(_arg_1:FocusEvent):void
        {
            if (this.isEmpty())
            {
                this.input.text = "";
                this.input.displayAsPassword = this.isPassWord;
            };
            if (this.softInputText)
            {
                this.softInputText.setText(this.input.text);
            };
        }

        public function isEmpty():Boolean
        {
            return ((this.input) && ((this.input.text == "") || (this.input.text == this.placeHolder)));
        }

        public function get text():String
        {
            if (this.isEmpty())
            {
                return ("");
            };
            return (this.input.text);
        }

        public function set text(_arg_1:String):void
        {
            this.input.text = _arg_1;
        }


    }
}//package com.namsautam.haitac.component

//Created by Action Script Viewer - https://www.buraks.com/asv
package com.namsautam.haitac.login
{
    import flash.display.MovieClip;
    import flash.text.TextField;
    import flash.display.SimpleButton;
    import com.namsautam.haitac.component.SoftInputText;
    import com.namsautam.haitac.component.CheckBox;
    import com.namsautam.haitac.component.TextInputWrapper;
    import com.namsautam.haitac.component.Captcha;
    import com.namsautam.haitac.api.dto.TokenResponse;
    import flash.events.MouseEvent;
    import com.namsautam.haitac.config.StringValues;
    import com.namsautam.haitac.keyboard.KeyBoardManager;
    import flash.ui.Keyboard;
    import flash.events.Event;
    import flash.net.navigateToURL;
    import flash.net.URLRequest;
    import com.namsautam.haitac.storage.StorageManager;
    import com.namsautam.haitac.config.Configurations;
    import com.namsautam.haitac.component.Components;
    import com.namsautam.haitac.api.Api;

    public class LoginPopup extends MovieClip 
    {

        public var news:NewsComp;
        public var slideshow:SlideComp;
        public var userNameInput:TextField;
        public var passwordInput:TextField;
        public var loginBtn:SimpleButton;
        public var forgetPassword:SimpleButton;
        public var registerBtn:SimpleButton;
        public var btnHomePage:SimpleButton;
        public var btnForum:SimpleButton;
        public var btnFanpage:SimpleButton;
        public var btnPay:SimpleButton;
        public var fbBtn:SimpleButton;
        public var btnClearUsername:SimpleButton;
        public var btnClearPassword:SimpleButton;
        public var googleBtn:SimpleButton;
        public var softKeyBoard:SoftInputText;
        public var saveInfo:CheckBox;
        private var userNameWrapper:TextInputWrapper;
        private var passwordWrapper:TextInputWrapper;
        public var captchaInput:TextField;
        public var captcha:Captcha;
        public var captchaBg:MovieClip;
        public var reloadCaptchaBtn:SimpleButton;
        private var captchaWrapper:TextInputWrapper;
        private var data:TokenResponse;

        public function LoginPopup()
        {
            this.btnHomePage.addEventListener(MouseEvent.CLICK, this.onHomePage);
            this.btnForum.addEventListener(MouseEvent.CLICK, this.onForum);
            this.btnFanpage.addEventListener(MouseEvent.CLICK, this.onFanpage);
            this.btnPay.addEventListener(MouseEvent.CLICK, this.onPay);
            this.loginBtn.addEventListener(MouseEvent.CLICK, this.onLogin);
            this.forgetPassword.addEventListener(MouseEvent.CLICK, this.onForgetPass);
            this.registerBtn.addEventListener(MouseEvent.CLICK, this.onQuickRegister);
            this.fbBtn.addEventListener(MouseEvent.CLICK, this.onFBClick);
            this.googleBtn.addEventListener(MouseEvent.CLICK, this.onGoogleClick);
            this.btnClearUsername.addEventListener(MouseEvent.CLICK, this.onClearUserName);
            this.btnClearPassword.addEventListener(MouseEvent.CLICK, this.onClearPassword);
            this.reloadCaptchaBtn.addEventListener(MouseEvent.CLICK, this.onReloadCaptcha);
            this.fbBtn.visible = false;
            this.googleBtn.visible = false;
            this.userNameInput.tabIndex = 10;
            this.userNameInput.tabEnabled = true;
            this.passwordInput.tabIndex = 11;
            this.passwordInput.tabEnabled = true;
            this.userNameWrapper = TextInputWrapper.createTextInputWrapper(this.userNameInput, StringValues.USERNAME_PLACEHOLDER, this.btnClearUsername, this.softKeyBoard);
            this.passwordWrapper = TextInputWrapper.createTextInputWrapper(this.passwordInput, StringValues.PASSWORD_PLACEHOLDER, this.btnClearPassword, this.softKeyBoard);
            this.captchaWrapper = TextInputWrapper.createTextInputWrapper(this.captchaInput, StringValues.CAPTCHA_PLACEHOLDER);
            KeyBoardManager.register(this, Keyboard.ENTER, this.onEnterHandler);
            addEventListener(Event.ENTER_FRAME, this.onEnterFrame);
        }

        public function setData(_arg_1:TokenResponse):void
        {
            this.data = _arg_1;
            this.news.setData(_arg_1.posts);
            this.slideshow.setData(_arg_1.slides);
        }

        public function destroy():void
        {
            this.slideshow.destroy();
        }

        private function onForum(_arg_1:MouseEvent):void
        {
            navigateToURL(new URLRequest(this.data.forumLink));
        }

        private function onHomePage(_arg_1:MouseEvent):void
        {
            navigateToURL(new URLRequest(this.data.homePageLink));
        }

        private function onPay(_arg_1:MouseEvent):void
        {
            navigateToURL(new URLRequest(this.data.paymentLink));
        }

        private function onFanpage(_arg_1:MouseEvent):void
        {
            navigateToURL(new URLRequest(this.data.fanpageLink));
        }

        private function onClearPassword(_arg_1:MouseEvent):void
        {
            this.passwordWrapper.clearText();
        }

        private function onClearUserName(_arg_1:MouseEvent):void
        {
            this.userNameWrapper.clearText();
        }

        private function onEnterFrame(_arg_1:Event):void
        {
            var _local_2:Object;
            if (StorageManager.storage)
            {
                removeEventListener(Event.ENTER_FRAME, this.onEnterFrame);
                this.saveInfo.setLabel(StringValues.SAVE_LOGIN_INFO);
                this.saveInfo.isCheck = StorageManager.storage.isExist();
                _local_2 = StorageManager.storage.getItem();
                if (_local_2)
                {
                    this.userNameWrapper.text = _local_2["username"];
                    this.passwordWrapper.text = _local_2["password"];
                    this.passwordInput.displayAsPassword = true;
                    this.btnClearPassword.visible = true;
                    this.btnClearUsername.visible = true;
                };
            };
        }

        private function onEnterHandler():void
        {
            this.onLogin(null);
        }

        private function onFBClick(_arg_1:MouseEvent):void
        {
        }

        private function onGoogleClick(_arg_1:MouseEvent):void
        {
        }

        private function onQuickRegister(_arg_1:MouseEvent):void
        {
            navigateToURL(new URLRequest(Configurations.QUICK_REGISTER));
        }

        private function onForgetPass(_arg_1:MouseEvent):void
        {
            navigateToURL(new URLRequest(Configurations.FORGET_PASS_URL));
        }

        private function onLogin(_arg_1:MouseEvent):void
        {
            if (this.userNameWrapper.isEmpty())
            {
                Components.NoticePopup.show(StringValues.ERROR_USERNAME_EMPTY);
                return;
            };
            if (this.passwordWrapper.isEmpty())
            {
                Components.NoticePopup.show(StringValues.ERROR_PASSWORD_EMPTY);
                return;
            };
            if (((this.reloadCaptchaBtn.visible) && (this.captchaWrapper.isEmpty())))
            {
                Components.NoticePopup.show(StringValues.ERROR_CAPTCHA_EMPTY);
                return;
            };
            if (this.saveInfo.isCheck)
            {
                StorageManager.storage.save({
                    "username":this.userNameWrapper.text,
                    "password":this.passwordWrapper.text
                });
            }
            else
            {
                StorageManager.storage.clear();
            };
            Api.login(this.userNameWrapper.text, this.passwordWrapper.text, this.captchaWrapper.text);
        }

        private function onReloadCaptcha(_arg_1:MouseEvent):void
        {
            Api.reloadCaptcha();
        }

        public function loadCaptcha(_arg_1:String):void
        {
            this.captcha.load(_arg_1);
            if (!_arg_1)
            {
                this.reloadCaptchaBtn.visible = false;
                this.captchaInput.visible = false;
                this.captchaBg.visible = false;
            }
            else
            {
                this.reloadCaptchaBtn.visible = true;
                this.captchaInput.visible = true;
                this.captchaBg.visible = true;
            };
        }


    }
}//package com.namsautam.haitac.login

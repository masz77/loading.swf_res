//Created by Action Script Viewer - https://www.buraks.com/asv
package cmodule.encrypt
{
    import flash.display.Sprite;

    public class ConSprite extends Sprite 
    {

        private var runner:CRunner = new CRunner();

        public function ConSprite()
        {
            if (gsprite)
            {
                log(1, "More than one sprite!");
            };
            gsprite = this;
            this.runner.startSystem();
        }

    }
}//package cmodule.encrypt

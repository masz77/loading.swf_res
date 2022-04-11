//Created by Action Script Viewer - https://www.buraks.com/asv
package com.namsautam.haitac.log
{
    import com.namsautam.haitac.config.Configurations;

    public class Logger 
    {


        public static function log(_arg_1:*):void
        {
            if (Configurations.ENABLE_LOGGER)
            {
                trace(_arg_1);
            };
        }


    }
}//package com.namsautam.haitac.log

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package config;


import java.util.Locale;
import java.util.ResourceBundle;

import javax.servlet.http.HttpSession;



public class LanguageManager {



    private static Locale locale =
            new Locale("ar");





    // الطريقة القديمة
    public static String get(String key){


        ResourceBundle bundle =
                ResourceBundle.getBundle(
                        "i18n.strings",
                        locale
                );


        return bundle.getString(key);


    }








    // الطريقة الجديدة مع Session
    public static String get(
            String key,
            HttpSession session
    ){



        String lang = "ar";



        if(session != null){



            Object currentLang =
                    session.getAttribute("lang");



            if(currentLang != null){


                lang =
                currentLang.toString();


            }


        }






        Locale currentLocale =
                new Locale(lang);





        ResourceBundle bundle =
                ResourceBundle.getBundle(
                        "i18n.strings",
                        currentLocale
                );





        return bundle.getString(key);



    }









    public static void setLanguage(String lang){


        locale =
                new Locale(lang);


    }







    public static Locale getLocale(){


        return locale;


    }



}
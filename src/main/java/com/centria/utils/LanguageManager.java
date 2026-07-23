package com.centria.utils;


import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;

import java.nio.charset.StandardCharsets;

import java.util.Locale;
import java.util.PropertyResourceBundle;
import java.util.ResourceBundle;

import javax.servlet.http.HttpSession;



public class LanguageManager {



    private static Locale locale =
            new Locale("ar");





    private static ResourceBundle loadBundle(Locale locale){


        ResourceBundle bundle = null;


        String path =
                "i18n/strings_" 
                + locale.getLanguage()
                + ".properties";



        try(
            InputStream input =
            LanguageManager.class
            .getClassLoader()
            .getResourceAsStream(path)
        ){


            if(input == null){

                return null;

            }



            Reader reader =
                    new InputStreamReader(
                            input,
                            StandardCharsets.UTF_8
                    );



            bundle =
                new PropertyResourceBundle(
                        reader
                );



        }
        catch(IOException e){

            e.printStackTrace();

        }



        return bundle;

    }









    public static String get(String key){


        ResourceBundle bundle =
                loadBundle(locale);



        if(bundle == null){

            return key;

        }



        return bundle.containsKey(key)
                ? bundle.getString(key)
                : key;


    }









    public static String get(
            String key,
            HttpSession session
    ){



        String lang="ar";



        if(session != null){


            Object current =
                    session.getAttribute("lang");


            if(current != null){

                lang =
                current.toString();

            }


        }




        Locale currentLocale =
                new Locale(lang);




        ResourceBundle bundle =
                loadBundle(currentLocale);




        if(bundle == null){

            return key;

        }



        return bundle.containsKey(key)
                ? bundle.getString(key)
                : key;



    }









    public static void setLanguage(String lang){


        locale =
                new Locale(lang);


    }









    public static Locale getLocale(){


        return locale;


    }



}
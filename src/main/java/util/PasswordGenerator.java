package util;


import java.security.SecureRandom;



public class PasswordGenerator {



    private static final String UPPERCASE =
            "ABCDEFGHIJKLMNOPQRSTUVWXYZ";


    private static final String LOWERCASE =
            "abcdefghijklmnopqrstuvwxyz";


    private static final String NUMBERS =
            "0123456789";


    private static final String SYMBOLS =
            "@#$%&*!";



    private static final String ALL_CHARACTERS =
            UPPERCASE
            + LOWERCASE
            + NUMBERS
            + SYMBOLS;



    private static final SecureRandom random =
            new SecureRandom();






    public static String generatePassword(){


        int length = 10;


        StringBuilder password =
                new StringBuilder();





        password.append(
                UPPERCASE.charAt(
                        random.nextInt(
                                UPPERCASE.length()
                        )
                )
        );



        password.append(
                LOWERCASE.charAt(
                        random.nextInt(
                                LOWERCASE.length()
                        )
                )
        );



        password.append(
                NUMBERS.charAt(
                        random.nextInt(
                                NUMBERS.length()
                        )
                )
        );



        password.append(
                SYMBOLS.charAt(
                        random.nextInt(
                                SYMBOLS.length()
                        )
                )
        );






        for(int i = 4; i < length; i++){


            password.append(
                    ALL_CHARACTERS.charAt(
                            random.nextInt(
                                    ALL_CHARACTERS.length()
                            )
                    )
            );


        }





        return password.toString();



    }



}
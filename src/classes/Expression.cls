/**
* Description   - EXpression Opartor and Type Casting
*
* Created by    - Sagar Nirwal
*
* Created Date  - 24/06/2022
*
* Revision log  -  V_1.0 - Created  - Youe name - Date
*                  V_1.1 - Modified - Youe Name - Date - Details what you modified
*
**/
public with sharing class Expression {
    /**   Description :   Expression Constuctor  Using to calculate all Operator
    *
    *     Created By  :   Sagar Nirwal
    *
    *     Arguments   :   Integer,boolean
    *
    *     Return      :   void
    *
    *     Revision log:   V_1.0 - Created  - Youe name - Date
    *                     V_1.1 - Modified - Youe Name - Date - Details what you modified
    * 
    **/
    public Expression(integer a, integer b, integer c, boolean d, boolean e) {

        //Unary Expression -
        system.debug('Unary Expression'); 
        system.debug(~a);           //(minus of total positive value which starts from 0)  
        system.debug(~b);           // (positive of total minus, positive starts from 0)  
        system.debug(!d);           // (opposite of boolean value)  
        system.debug(!e);           //(opposite of boolean value)
        
        //Arithmetic Expression -
        system.debug('Arithmetic Expression');
        system.debug(a+b);  
        system.debug(a-b); 
        system.debug(a*b); 
        system.debug(a/b); 
        
        //Left Shift Expression -
        system.debug('Left Shift Expression'); 
        system.debug(a<<b);   // for ex - 10*2^2=10*4=40   

        //Right Shift Expression -
        system.debug('Right Shift Expression');
        system.debug(a>>b);   //for ex - 10/2^2=10/4=2  

        // AND Expression -
        system.debug('AND Expression'); 
        system.debug(a<b&&a<c);
        system.debug(a<b&a<c);

        // OR Expressiono -
        system.debug('OR Expression'); 
        system.debug(a>b||a++<c);
        system.debug(a>b|a++<c);

        //Ternary Expression
        system.debug('Ternary Expression');
        integer min=(a<b)?a:b;  
        system.debug(min); 

        // Assigment Expreesion -
        system.debug('Assigment Expression');
        system.debug(a += b);
        system.debug(b -= c);
        system.debug(c *= a);
        system.debug(b /= a);
        system.debug(c *= a*b);
        system.debug(b += a-c );

        //Relation Expreession -
        system.debug('Relation Expression'); 
        system.debug(a == b);
        system.debug(c != b);  
        system.debug(c > a);  
        system.debug(b < a);  
        system.debug(a >= c);  
        system.debug(b <= c);

        //Role of Conversion -
        system.debug('Role of Conversion'); 
        double mywide1 = a; // Widening(Automatic) casting: integer to double
        decimal mywide2 = b;
        
        system.debug(mywide1);
        system.debug(mywide2); 

        double mynarrow1 = 9.78d;
        integer mynarrow2 = (integer) mynarrow1; // Narrowing(Manual) casting: double to integer
        long mynarrow3 = (long) mynarrow1;
        
        system.debug(mynarrow2);
        system.debug(mynarrow3);

        decimal mywide3 = mynarrow2;
        
        system.debug(mywide3);
    }
        
    //Safe Navigation
    public static void safeOperator(){
        String a=NULL;
        String b='abc';
        System.debug(a==null? b:a);
        Account acc =new Account();
        acc.Name='test';
        insert acc;
        System.debug([SELECT ID , Name FROM Account where ID=:acc.ID]?.NAME);
    }
}
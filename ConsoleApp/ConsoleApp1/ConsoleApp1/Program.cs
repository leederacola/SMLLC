/*
 * Console app to calculate base number raised to power of another number
 * implement math.pow() with recurssion
 */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1
{
    class Program
    {
        static void Main(string[] args)
        {
            int x = SomeMath(5, 2);
            int y = SomeMath(5, 3);
            int z = SomeMath(5, 5);
            int a = SomeMath(5, 1);
            int b = SomeMath(5, 0);
            int c = SomeMath(0, 1);
            int d = SomeMath(0, 0);
    

            Console.WriteLine("hello world, welcome back to the command line!");
            Console.WriteLine("some tests below");
            Console.WriteLine("5 ^ 2  = " + x);
            Console.WriteLine("5 ^ 3  = " + y);
            Console.WriteLine("5 ^ 5  = " + z);
            Console.WriteLine("5 ^ 1 =  " + a);
            Console.WriteLine("5 ^ 0 =  " + b);
            Console.WriteLine("0 ^ 1 =  " + c);
            Console.WriteLine("0 ^ 0 =  " + d );


            int userInputBase;
            int userInputPow;
            int userResult;
            Console.WriteLine("press enter to do some math or quit to exit application");
            while(Console.ReadLine() != "quit")
            {
                Console.WriteLine("try it! enter base number integer");
                while (!int.TryParse(Console.ReadLine(), out userInputBase))
                {
                    Console.WriteLine("Please enter a vaild integer for base");
                };
                Console.WriteLine("now enter power to raise to");
                while (!int.TryParse(Console.ReadLine(), out userInputPow))
                {
                    Console.WriteLine("Please enter a vaild integer for pow");
                } ;
                userResult = SomeMath(userInputBase, userInputPow);
                Console.WriteLine(userInputBase + " ^ " + userInputPow + " = " + userResult);
                Console.WriteLine("press enter continue");
            }
           if(Console.ReadLine() == "quit")
            {
                Environment.Exit(0);
            }
        }
        // raises number to power of another number
        // int number = base number
        // int power = power to be raised to
        public static int SomeMath(int number, int power)
        {
            // check exit condition
            if (power == 0)
            {
                return 1;
            }                
            else
            {
                // recurssive call
                power--;
                return (number * SomeMath(number, power));
            }                    
        }
 
    }
}

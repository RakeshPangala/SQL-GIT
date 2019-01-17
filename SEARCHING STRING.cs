using System;
					
   public class Program
   {
     public  static void Main(string[] args)
       {
           string testValue = "Welcome to SQL vm";

           

           
           Console.WriteLine(testValue.Contains("net"));
		 
		 
           Console.WriteLine(testValue.Contains("SQL"));


       }
   }

   public static class StringExtensions
   {
       public static bool ContainsAny(this string str, params string[] values)
       {
           if (!string.IsNullOrEmpty(str) || values.Length > 0)
           {
               foreach (string value in values)
               {
                   if(str.Contains(value))
                       return true;
               }
           }

           return false;
       }

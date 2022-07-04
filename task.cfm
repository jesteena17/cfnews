<cfscript>
/***

1 2 3 4 5 
10 9 8 7 6 
11 12 13 14 15 
20 19 18 17 16 
21 22 23 24 25

***/
c=0;
n=5
    for(i=1;i<=5;i++)
    {
        if(i%2!=0)
        {

             for(j=1;j<=n;j++)
        {
            c++;
            WriteOutput(c&"&nbsp;");
        }
        }
        else{
            temp =c;

             for(j=c+n;j>temp;j--)
        {
            c++;
            WriteOutput(j&"&nbsp;");
        }
        }
       
         WriteOutput("<br>");
    }

</cfscript>
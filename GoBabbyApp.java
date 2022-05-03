import com.ibm.db2.cmx.annotation.Select;

import java.sql.* ;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Scanner;

public class GoBabbyApp {
    public static int idnum = 38555;
    public static int idt = 32155;
    public static void uno (String pracid, String aid, Statement s) {
        try {
            //String dateSQL = "SELECT * from PARTICPATE where PRACID= " + "'" + date + "'";
            String participateSQL = "SELECT date, bro.TIME, bro.OBSERVATION FROM APPOINTMENT\n" +
                    "    Join (\n" +
                    "Select * from NOTE\n" +
                    "JOIN HAS H ON NOTE.NID = H.NID) bro on bro.AID = APPOINTMENT.AID\n" +
                    "WHERE bro.AID = " + aid +   ";";


            java.sql.ResultSet participaters = s.executeQuery(participateSQL);
            System.out.println("Date \t Time \t Observation");
            while (participaters.next()) {

                String d = participaters.getString(1);
                String atime = participaters.getString(2);
                String o = participaters.getString(3);

                System.out.println(d + "\t" +  atime + "\t"  + o);

            }


            //System.out.println ("DONE");
        } catch (SQLException e) {

            // Your code to handle errors comes here;
            // something more meaningful than a print would be good
            System.out.println("ERROR INVALID DATE. TRY AGAIN" + e);

        }
    }
    public static void dos (String pracid, String aid, Statement s) {
        try {
            //String dateSQL = "SELECT * from PARTICPATE where PRACID= " + "'" + date + "'";
            String participateSQL = "SELECT COALESCE(Result, 'PENDING'), type, dateprescribed FROM PRESCRIBES\n" +
                    "JOIN TEST T ON T.TID = PRESCRIBES.TID\n" +
                    "WHERE AID IN (SELECT aid FROM PARTICIPATE WHERE pid IN (\n" +
                    "    SELECT pid FROM PARTICIPATE WHERE aid = " + aid + " )) ORDER BY dateprescribed DESC;";


            java.sql.ResultSet participaters = s.executeQuery(participateSQL);
            System.out.println("Date \t Type \t Result");
            while (participaters.next()) {

                String res = participaters.getString(1);
                String type = participaters.getString(2);
                String d = participaters.getString(3);

                System.out.println(d + "  [" + type + "]  " + res );

            }


            //System.out.println ("DONE");
        } catch (SQLException e) {

            // Your code to handle errors comes here;
            // something more meaningful than a print would be good
            System.out.println("ERROR INVALID DATE. TRY AGAIN" + e);

        }
    }
    public static void tres (String pracid, String aid, Statement s) {
        Scanner input = new Scanner(System.in);
        System.out.println("Please type your observation:\n");
        String date = input.nextLine();
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("HH:mm:ss");
        LocalTime localTime = LocalTime.now();
        //System.out.println(dtf.format(localTime).toString());
        idnum = idnum + (int)(Math.random() * ((10000 - 100) + 1));
        try {
            //String dateSQL = "SELECT * from PARTICPATE where PRACID= " + "'" + date + "'";
            String participateSQL = "INSERT INTO Note VALUES (" + idnum + "," + "'" + date + "'" + "," +  "'" +  dtf.format(localTime).toString() + "'" +   ");";
            //System.out.println(participateSQL);

            int participaters = s.executeUpdate(participateSQL);
            String hSQL = "INSERT INTO HAS VALUES (" + idnum + "," + aid  + ");";
            int a = s.executeUpdate(hSQL);

            idnum = idnum + 1 ;

            //System.out.println ("DONE");
        } catch (SQLException e) {

            // Your code to handle errors comes here;
            // something more meaningful than a print would be good
            System.out.println("ERROR INVALID DATE. TRY AGAIN" + e);

        }
    }
    public static void quattro (String pracid, String aid, Statement s) {
        Scanner input = new Scanner(System.in);
        System.out.println("Please enter the type of test:\n");
        String date = input.nextLine();
        idt = idt + (int)(Math.random() * ((10000 - 100) + 1));
        try {
            //String dateSQL = "SELECT * from PARTICPATE where PRACID= " + "'" + date + "'";
            String participateSQL = "INSERT INTO TEST VALUES (" + idt + ", 'John Kruger', '2022-03-11', '2022-03-11', '2022-03-10',5469875, NULL," + "'" + date + "'" + ", 888);";
            //System.out.println(participateSQL);

            int participaters = s.executeUpdate(participateSQL);
            String hSQL = "INSERT INTO PRESCRIBES VALUES (" + idt + "," + aid  + ",'mom');";
            int a = s.executeUpdate(hSQL);



            //System.out.println ("DONE");
        } catch (SQLException e) {

            // Your code to handle errors comes here;
            // something more meaningful than a print would be good
            System.out.println("ERROR INVALID DATE. TRY AGAIN" + e);

        }
    }




    public static boolean notesmenu (String pracid, String aid, Statement s) {
        while (true) {
            Scanner input = new Scanner(System.in);
            System.out.println("1. Review notes\n" +
                    "2. Review tests\n" +
                    "3. Add a note\n" +
                    "4. Prescribe a test\n" +
                    "5. Go back to the appointments.\n" +
                    "Enter your choice:");
            String date = input.nextLine();
            if (date.equals("E")) {
                return true;
            }
            else if (date.equals("1")) {
                uno(pracid, aid, s);
            }
            else if (date.equals("2")) {
                dos(pracid, aid, s);
            }
            else if (date.equals("3")) {
                tres(pracid, aid, s);
            }
            else if (date.equals("4")) {
                quattro(pracid, aid, s);
            }
            else if (date.equals("5")) {
                boolean y = getaid(pracid, s);
                if (y == true) {
                    return true;
                }
            }
            else {
                System.out.println("Bro wrong option");
            }
        }

    }



    public static boolean getaid (String pracid, Statement s){
        while (true) {
            Scanner input = new Scanner(System.in);
            System.out.println("Enter the appointment number that you would like to work on.\n [E] to exit [D] to go back to another date :");
            String date = input.nextLine();
            if (date.equals("E")) {
                return true;
            }
            if (date.equals("D")) {
                boolean y = getappointment(pracid, s);
                if (y == true) {
                    return true;
                }
            }
            try {
                String participateSQL = "Select NAME,HEALTHID FROM PARENT\n" +
                        "    Join (\n" +
                        "Select FEMALEIN.PID, AID FROM FEMALEIN\n" +
                        "    join(\n" +
                        "Select *  from Participate\n" +
                        "JOIN EXPECTS E ON PARTICIPATE.PID = E.PID) c on c.CID = FEMALEIN.CID) p on p.PID = PARENT.PID\n" +
                        "WHERE AID = " + date;
                java.sql.ResultSet participaters = s.executeQuery(participateSQL);

                while (participaters.next()) {

                    String fname = participaters.getString(1);
                    String hid = participaters.getString(2);

                    System.out.println("For " + fname + "  " + hid );
                }
                boolean x = notesmenu(pracid, date,s);
                if (x == true) {
                    return true;
                }

            }
            catch (SQLException e) {

                // Your code to handle errors comes here;
                // something more meaningful than a print would be good
                System.out.println("ERROR INVALID. TRY AGAIN" + e);

            }
        }
    }

    public static boolean getappointment (String pracid, Statement s){
        //Get prac id
        while (true) {
            Scanner input = new Scanner(System.in);
            System.out.println("Please enter the date for appointment list [E] to exit:");
            String date = input.nextLine();
            if (date.equals("E")) {
                return true;
            }
            ArrayList backups = new ArrayList();
            try {
                //String dateSQL = "SELECT * from PARTICPATE where PRACID= " + "'" + date + "'";
                String participateSQL = "SELECT NAME,Time, HEALTHID, 'B' as isprim FROM PARENT JOIN (\n" +
                        "Select FEMALEIN.PID, TIME FROM FEMALEIN JOIN (\n" +
                        "Select CID, Time from EXPECTS Join (\n" +
                        "Select ASSIGNEDTOBACKUP.PID, TIME from ASSIGNEDTOBACKUP\n" +
                        "    Join (\n" +
                        "Select * from APPOINTMENT\n" +
                        "    JOIN (\n" +
                        "select * from PARTICIPATE where PRACID = " + pracid + ") p on p.aid = APPOINTMENT.AID\n" +
                        "WHERE DATE = " + "'" + date + "'"+ ") ap on ap.PRACID = ASSIGNEDTOBACKUP.PRACID AND ap.PID = ASSIGNEDTOBACKUP.PID) b\n" +
                        "on EXPECTS.PID = b.PID) c on c.cid = FEMALEIN.CID) f on f.PID = PARENT.pid\n" +
                        "UNION\n" +
                        "(\n" +
                        "SELECT NAME,Time, HEALTHID, 'P' as isprim  FROM PARENT JOIN (\n" +
                        "    Select FEMALEIN.PID, TIME FROM FEMALEIN JOIN (\n" +
                        "        Select CID, Time from EXPECTS Join (\n" +
                        "            Select ASSIGNEDTOprim.PID, TIME from ASSIGNEDTOPRIM\n" +
                        "                                                       Join (\n" +
                        "                Select * from APPOINTMENT\n" +
                        "                                  JOIN (\n" +
                        "                    select * from PARTICIPATE where " + pracid + ") p on p.aid = APPOINTMENT.AID\n" +
                        "                WHERE DATE = " + "'" + date + "'"+ ") ap on ap.PRACID = ASSIGNEDTOPRIM.PRACID AND ap.PID = ASSIGNEDTOPRIM.PID) b\n" +
                        "                                           on EXPECTS.PID = b.PID) c on c.cid = FEMALEIN.CID) f on f.PID = PARENT.pid)\n;";


                java.sql.ResultSet participaters = s.executeQuery(participateSQL);
                System.out.println("Time \t isPrimary \t Time \t hid");
                while (participaters.next()) {

                    String fname = participaters.getString(1);
                    String atime = participaters.getString(2);
                    String hid = participaters.getString(3);
                    String BSTAT = participaters.getString(4);
                    System.out.println(atime+ "\t" +  BSTAT + "\t"  + fname  + "\t" + hid);

                }
                boolean x = getaid(pracid,s);
                if (x == true) {
                    return true;
                }

                //System.out.println ("DONE");
            } catch (SQLException e) {

                // Your code to handle errors comes here;
                // something more meaningful than a print would be good
                System.out.println("ERROR INVALID DATE. TRY AGAIN" + e);

            }
        }


    }
    public static void main ( String [ ] args ) throws SQLException
    {
        // Unique table names.  Either the user supplies a unique identifier as a command line argument, or the program makes one up.
        String tableName = "";
        int sqlCode=0;      // Variable to hold SQLCODE
        String sqlState="00000";  // Variable to hold SQLSTATE

        if ( args.length > 0 )
            tableName += args [ 0 ] ;
        else
            tableName += "exampletbl";

        // Register the driver.  You must register the driver before you can use it.
        try { DriverManager.registerDriver ( new com.ibm.db2.jcc.DB2Driver() ) ; }
        catch (Exception cnfe){ System.out.println("Class not found"); }

        // This is the url you must use for DB2.
        //Note: This url may not valid now ! Check for the correct year and semester and server name.
        String url = "jdbc:db2://winter2022-comp421.cs.mcgill.ca:50000/cs421";

        //REMEMBER to remove your user id and password before submitting your code!!
        String your_userid = "jislam7";
        String your_password = "Rabb!3466089";
        //AS AN ALTERNATIVE, you can just set your password in the shell environment in the Unix (as shown below) and read it from there.
        //$  export SOCSPASSWD=yoursocspasswd
        if(your_userid == null && (your_userid = System.getenv("SOCSUSER")) == null)
        {
            System.err.println("Error!! do not have a password to connect to the database!");
            System.exit(1);
        }
        if(your_password == null && (your_password = System.getenv("SOCSPASSWD")) == null)
        {
            System.err.println("Error!! do not have a password to connect to the database!");
            System.exit(1);
        }
        Connection con = DriverManager.getConnection (url,your_userid,your_password) ;
        Statement statement = con.createStatement ( ) ;

        boolean exit = false;
        outerloop:
        while (true) {

            Scanner input = new Scanner(System.in);
            System.out.println("Please enter your practitioner id [E] to exit:");
            String pracid = input.nextLine();
            if (pracid.equals("E")) {
                break;
            }
            //Get prac id
            try
            {
                String querySQL = "SELECT pracid, name from MIDWIFE WHERE PRACID = " + pracid;
                //System.out.println (querySQL) ;
                java.sql.ResultSet rs = statement.executeQuery ( querySQL ) ;

                while ( rs.next ( ) )
                {
                    String id = rs.getString ( 1 ) ;
                    String name = rs.getString (2);
                    System.out.println ("Hello " + name);
                    boolean x =  getappointment(id, statement);
                    if (x == true){break outerloop;

                        }
                }
                //System.out.println ("DONE");
            }
            catch (SQLException e)
            {
                sqlCode = e.getErrorCode(); // Get SQLCODE
                sqlState = e.getSQLState(); // Get SQLSTATE

                // Your code to handle errors comes here;
                // something more meaningful than a print would be good
                System.out.println("ERROR INVALID ID. TRY AGAIN");

            }

        }
        System.out.println("Goodbye");
        // Finally but importantly close the statement and connection
        statement.close ( ) ;
        con.close ( ) ;
    }
}

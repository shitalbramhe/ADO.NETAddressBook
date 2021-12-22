using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ADO.NETAddressBook
{
    public class Operation
    {
        private SqlConnection con;
        //To Handle connection related activities    
        private void Connection()
        {
            string constr = "Server=(localdb)\\MSSQLLocalDB;Database=AddressBookServiceDB;Trusted_Connection=true";
            con = new SqlConnection(constr);

        }
        //To Add details    
        public AddressBookModel AddData(AddressBookModel data)
        {
            try
            {

                Connection();
                SqlCommand com = new SqlCommand("AddAddressBook", con);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@firstname", data.firstname);
                com.Parameters.AddWithValue("@lastname", data.lastname);
                com.Parameters.AddWithValue("@address", data.address);
                com.Parameters.AddWithValue("@city", data.city);
                com.Parameters.AddWithValue("@state", data.state);
                com.Parameters.AddWithValue("@zip", data.zip);
                com.Parameters.AddWithValue("@phonenumber", data.phonenumber);
                com.Parameters.AddWithValue("@email", data.email);
                com.Parameters.AddWithValue("@name", data.name);
                com.Parameters.AddWithValue("@type", data.type);
                com.Parameters.AddWithValue("@Contact_id", data.Contact_id);
                con.Open();
                int i = com.ExecuteNonQuery();
                con.Close();
                return data;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        //To Delete Person details    
        public int DeletePersonDetails(int id)
        {
            try
            {
                Connection();
                SqlCommand com = new SqlCommand("DeleteAddressBook", con);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@id", id);
                con.Open();
                int i = com.ExecuteNonQuery();
                con.Close();
                if (i >= 1)
                {

                    return id;

                }
                else
                {

                    return 0;
                }
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        //To Update Address book Table details 
        public bool UpdateAddressBookDetail(int id, string firstname)
        {
            try
            {
                Connection();
                SqlCommand com = new SqlCommand("UpdateAddressBook", con);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@id", id);
                com.Parameters.AddWithValue("@firstname", firstname);
                con.Open();
                int i = com.ExecuteNonQuery();
                con.Close();
                if (i >= 1)
                {

                    return true;

                }
                else
                {

                    return false;
                }
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        //To Get AddressBook Table data 
        public DataSet GetAllContact()
        {
            Connection();
            DataSet dataSet = new DataSet(); ;
            con.Open();
            SqlDataAdapter adapter = new SqlDataAdapter("GetAddressBookTable", con);
            adapter.Fill(dataSet, "AddressBookTable");
            foreach (DataRow dataRow in dataSet.Tables["AddressBookTable"].Rows)
            {
                Console.WriteLine("\t" + dataRow["id"] + "  " + dataRow["firstname"] + " " + dataRow["lastname"] + " " + dataRow["address"] + " " + dataRow["city"] + " " + dataRow["state"] + " " + dataRow["zip"] + " " + dataRow["phonenumber"] + " " + dataRow["email"] + " " + dataRow["name"] + " " + dataRow["type"] + " " + dataRow["Contact_id"]);
            }
            return dataSet;
        }
    }
}

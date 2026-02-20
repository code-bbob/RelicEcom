using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace RelicEcommerce
{
    /// <summary>
    /// Database helper class for common database operations
    /// </summary>
    public class DBHelper
    {
        private static string connectionString = ConfigurationManager.ConnectionStrings["RelicConnectionString"].ConnectionString;

        /// <summary>
        /// Get SQL Connection
        /// </summary>
        public static SqlConnection GetConnection()
        {
            return new SqlConnection(connectionString);
        }

        /// <summary>
        /// Execute non-query command (INSERT, UPDATE, DELETE)
        /// </summary>
        public static int ExecuteNonQuery(string query, SqlParameter[] parameters = null)
        {
            using (SqlConnection conn = GetConnection())
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    if (parameters != null)
                    {
                        cmd.Parameters.AddRange(parameters);
                    }
                    
                    conn.Open();
                    return cmd.ExecuteNonQuery();
                }
            }
        }

        /// <summary>
        /// Execute scalar command (COUNT, MAX, etc.)
        /// </summary>
        public static object ExecuteScalar(string query, SqlParameter[] parameters = null)
        {
            using (SqlConnection conn = GetConnection())
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    if (parameters != null)
                    {
                        cmd.Parameters.AddRange(parameters);
                    }
                    
                    conn.Open();
                    return cmd.ExecuteScalar();
                }
            }
        }

        /// <summary>
        /// Execute query and return DataTable
        /// </summary>
        public static DataTable ExecuteQuery(string query, SqlParameter[] parameters = null)
        {
            using (SqlConnection conn = GetConnection())
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    if (parameters != null)
                    {
                        cmd.Parameters.AddRange(parameters);
                    }
                    
                    using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        adapter.Fill(dt);
                        return dt;
                    }
                }
            }
        }

        /// <summary>
        /// Execute query and return DataSet
        /// </summary>
        public static DataSet ExecuteDataSet(string query, SqlParameter[] parameters = null)
        {
            using (SqlConnection conn = GetConnection())
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    if (parameters != null)
                    {
                        cmd.Parameters.AddRange(parameters);
                    }
                    
                    using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adapter.Fill(ds);
                        return ds;
                    }
                }
            }
        }

        /// <summary>
        /// Check if record exists
        /// </summary>
        public static bool RecordExists(string tableName, string columnName, object value)
        {
            string query = $"SELECT COUNT(*) FROM {tableName} WHERE {columnName} = @Value";
            SqlParameter[] parameters = { new SqlParameter("@Value", value) };
            
            int count = Convert.ToInt32(ExecuteScalar(query, parameters));
            return count > 0;
        }
    }
}

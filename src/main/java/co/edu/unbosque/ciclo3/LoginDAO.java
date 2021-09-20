package co.edu.unbosque.ciclo3;

import java.sql.*;

public class LoginDAO {
	public Usuario validar(String email, String pass) throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/tiendagenerica?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
				"root", ""); //Reemplazar "root" por el nombre de usuario de MySQL Workbench y escribir en "" la contraseña 

		PreparedStatement ps = con.prepareStatement("select * from usuario where email_usuario=? and password=?");
		ps.setString(1, email);
		ps.setString(2, pass);

		ResultSet rs = ps.executeQuery();

		Usuario usuario = null;

		if (rs.next()) {
			usuario = new Usuario();
			usuario.setUsuario(rs.getString("usuario"));
			usuario.setEmail(email);
		}
		con.close();

		return usuario;
	}
}
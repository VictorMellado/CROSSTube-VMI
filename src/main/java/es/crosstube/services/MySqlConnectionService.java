package es.crosstube.services;

import es.crosstube.model.dto.TipoUsuario;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class MySqlConnectionService {
    private Connection connection;
    private String ip;
    private String database;
    private String userName;
    private String password;

    public MySqlConnectionService(TipoUsuario tipoUsuario) {

        try {
            Properties properties = new Properties();
            switch (tipoUsuario){
                case ADMIN:
                    properties.load(new FileReader(MySqlConnectionService.class.getResource("/database/db.properties").getFile()));
                    break;
                case AUTENTICADO:
                    properties.load(new FileReader(MySqlConnectionService.class.getResource("/database/dbUserAutenticado.properties").getFile()));
                    break;
                default:
                    properties.load(new FileReader(MySqlConnectionService.class.getResource("/database/dbUserNormal.properties").getFile()));
            }
            this.ip = String.valueOf(properties.get("ip"));
            this.database = String.valueOf(properties.get("database"));
            this.userName = String.valueOf(properties.get("user"));
            this.password = String.valueOf(properties.get("password"));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
    public Connection getConnection() {
        if (connection == null){
            try {
                String dbURL = "jdbc:mysql://" + ip + "/" + database + "?serverTimezone=UTC&allowPublicKeyRetrieval=true";
                Connection connection = DriverManager.getConnection(dbURL,userName,password);
                this.connection = connection;
                System.out.println("Conexión válida: " + connection.isValid(20));
            } catch (SQLException exception) {
                throw new RuntimeException(exception.getMessage());
            }
        }
        return this.connection;
    }

    public void closeConnection() {
        try {
            this.connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}

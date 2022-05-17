module com.example.crosstube {
    requires javafx.controls;
    requires javafx.fxml;
    requires java.sql;


    opens es.crosstube to javafx.fxml;
    exports es.crosstube;
}
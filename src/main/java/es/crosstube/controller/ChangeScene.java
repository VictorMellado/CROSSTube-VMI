package es.crosstube.controller;

import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;

import java.io.IOException;

public class ChangeScene {

    public static void change(Stage stage, GenericController controller, String path_to_view_file) {
        try {
            FXMLLoader fxmlLoader = new FXMLLoader();
            fxmlLoader.setLocation(ChangeScene.class.getResource(path_to_view_file));
            fxmlLoader.setController(controller);

            AnchorPane rootLayout = fxmlLoader.load();

            Scene scene = new Scene(rootLayout, 600, 600);
            stage.setScene(scene);
            stage.setResizable(true);
            stage.show();
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }
}

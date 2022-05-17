package es.crosstube;

import es.crosstube.controller.ChangeScene;
import es.crosstube.controller.MainController;
import javafx.application.Application;
import javafx.stage.Stage;

import java.io.IOException;

/**
 * JavaFX App
 */
public class App extends Application {

    @Override
    public void start(Stage stage) throws IOException {

        MainController mainController = new MainController();
        ChangeScene.change(stage, mainController, "/vista/principal.fxml");
    }

    public static void main(String[] args) {
        launch();
    }


}

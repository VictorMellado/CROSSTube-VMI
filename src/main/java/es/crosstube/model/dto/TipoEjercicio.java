package es.crosstube.model.dto;

public enum TipoEjercicio {
    MUSCULACION,CARDIO;

    public static TipoEjercicio parse(String tipoEjercicio) {
        if (tipoEjercicio.equals("MUSCULACION")) {
            return MUSCULACION;
        } else if (tipoEjercicio.equals("CARDIO")) {
            return CARDIO;
        } else {
            return null;
        }
    }
}

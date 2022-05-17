package es.crosstube.model.dto;

public enum GrupoMuscular {
    HOMBROS, ESPALDA, BICEPS, TRICEPS, PECHO, ABDOMINAL, GLUTEOS, CUADRICEPS, PIERNAS, LUMBAR, GRIP, CARDIO;

    public static GrupoMuscular parse(String grupoMuscular) {
        switch (grupoMuscular) {
            case "Hombros":
                return HOMBROS;
            case "Espalda":
                return ESPALDA;
            case "Biceps":
                return BICEPS;
            case "TRICEPS":
                return TRICEPS;
            case "PECHO":
                return PECHO;
            case "ABDOMINAL":
                return ABDOMINAL;
            case "GLUTEOS":
                return GLUTEOS;
            case "CUADRICEPS":
                return CUADRICEPS;
            case "PIERNAS":
                return PIERNAS;
            case "LUMBAR":
                return LUMBAR;
            case "GRIP":
                return GRIP;
            case "CARDIO":
                return CARDIO;
            default:
                return null;
        }
    }
}

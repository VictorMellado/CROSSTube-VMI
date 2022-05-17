package es.crosstube.model.dto;

import java.net.URL;

public class Ejercicio {
    private int codigo;
    private String nombre;
    private TipoEjercicio tipo;
    private NivelEsfuerzo nivel;
    private int repeticiones;
    private URL videoURL;
    private boolean autoload;
    private URL poster;
    private String descripcion;
    private GrupoMuscular musculos;
    private int calorias;
    private int tiempo;

    public Ejercicio(int codigo, String nombre, TipoEjercicio tipo, NivelEsfuerzo nivel, int repeticiones, URL videoURL, boolean autoload, URL poster, String descripcion, GrupoMuscular musculos, int calorias, int tiempo) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.tipo = tipo;
        this.nivel = nivel;
        this.repeticiones = repeticiones;
        this.videoURL = videoURL;
        this.autoload = autoload;
        this.poster = poster;
        this.descripcion = descripcion;
        this.musculos = musculos;
        this.calorias = calorias;
        this.tiempo = tiempo;
    }

    public int getCodigo() {
        return codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public TipoEjercicio getTipo() {
        return tipo;
    }

    public NivelEsfuerzo getNivel() {
        return nivel;
    }

    public int getRepeticiones() {
        return repeticiones;
    }

    public URL getVideoURL() {
        return videoURL;
    }

    public boolean isAutoload() {
        return autoload;
    }

    public URL getPoster() {
        return poster;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public GrupoMuscular getMusculos() {
        return musculos;
    }

    public int getCalorias() {
        return calorias;
    }

    public int getTiempo() {
        return tiempo;
    }
}

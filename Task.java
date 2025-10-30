import java.io.Serializable;
import java.time.LocalDate;

public class Task implements Serializable {
    private String titre;
    private String description;
    private LocalDate dateEcheance;
    private boolean completee;

    public Task(String titre, String description, LocalDate dateEcheance) {
        this.titre = titre;
        this.description = description;
        this.dateEcheance = dateEcheance;
        this.completee = false;
    }

    //Getters et Setters
    public String getTitre() { return titre; }
    public void setTitre(String titre) { this.titre = titre; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public LocalDate getDateEcheance() { return dateEcheance; }
    public void setDateEcheance(LocalDate dateEcheance) { this.dateEcheance = dateEcheance; }

    public boolean isCompletee() { return completee; }
    public void setCompletee(boolean completee) { this.completee = completee; }
}

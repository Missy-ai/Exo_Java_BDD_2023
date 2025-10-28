import java.io.Serializable;
import java.time.LocalDate;

public class Task implements serializable {
  private string titre;
  private String description;
  private LocalDate dateEcheance;
  private bool completee;

  public Task(String titre, String description, LocalDate dateEcheance){
    this.titre = titre;
    this.description = description;
    this.dateEcheance = dateEcheance;
    this.completee = false;
  }

}

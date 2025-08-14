package session3.webappv0.model;


import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "product")
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String title;

    @Column(name = "release_date")
    private LocalDate releaseDate;

    private String mode;

    @Column(name = "certification_level")
    private String certificationLevel;

    @Column(length = 500)
    private String description;

    @Column(name = "duration_hours")
    private int durationHours;

    public  Product() {}


    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public LocalDate getReleaseDate() { return releaseDate; }
    public void setReleaseDate(LocalDate releaseDate) { this.releaseDate = releaseDate; }

    public String getMode() { return mode; }
    public void setMode(String mode) { this.mode = mode; }

    public String getCertificationLevel() { return certificationLevel; }
    public void setCertificationLevel(String certificationLevel) { this.certificationLevel = certificationLevel; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public int getDurationHours() { return durationHours; }
    public void setDurationHours(int durationHours) { this.durationHours = durationHours; }
}

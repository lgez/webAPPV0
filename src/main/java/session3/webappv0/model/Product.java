package session3.webappv0.model;

import jakarta.persistence.*;

import java.math.BigDecimal;
import java.util.Date;

@Entity
@Table(name = "product")
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(length = 100, nullable = false)
    private String title;

    @Column(name = "release_date")
    @Temporal(TemporalType.DATE)
    private Date releaseDate;

    @Column(length = 50)
    private String mode;

    @Column(name = "certification_level", length = 20)
    private String certificationLevel;

    @Column(length = 500)
    private String description;

    @Column(name = "duration_hours")
    private Integer durationHours;

    @Column(name = "product_key", length = 50, unique = true)
    private String productKey;

    @Column(length = 100)
    private String path;

    @Column(precision = 10, scale = 2)
    private BigDecimal prix;

    // --- Getters and Setters ---

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }

    public String getMode() {
        return mode;
    }

    public void setMode(String mode) {
        this.mode = mode;
    }

    public String getCertificationLevel() {
        return certificationLevel;
    }

    public void setCertificationLevel(String certificationLevel) {
        this.certificationLevel = certificationLevel;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getDurationHours() {
        return durationHours;
    }

    public void setDurationHours(Integer durationHours) {
        this.durationHours = durationHours;
    }

    public String getProductKey() {
        return productKey;
    }

    public void setProductKey(String productKey) {
        this.productKey = productKey;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public BigDecimal getPrix() {
        return prix;
    }
    public void setPrix(BigDecimal prix) {
        this.prix = prix;
    }
}

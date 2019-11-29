package work.huangxin.source.model;

import javax.persistence.*;

@Table(name = "`admin`")
public class Admin {
    @Id
    @Column(name = "`admin_id`")
    private Integer adminId;

    @Column(name = "`admin_username`")
    private String adminUsername;

    @Column(name = "`admin_password`")
    private String adminPassword;

    @Column(name = "`admin_level`")
    private String adminLevel;

    @Column(name = "`admin_type`")
    private String adminType;

    /**
     * @return admin_id
     */
    public Integer getAdminId() {
        return adminId;
    }

    /**
     * @param adminId
     */
    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }

    /**
     * @return admin_username
     */
    public String getAdminUsername() {
        return adminUsername;
    }

    /**
     * @param adminUsername
     */
    public void setAdminUsername(String adminUsername) {
        this.adminUsername = adminUsername;
    }

    /**
     * @return admin_password
     */
    public String getAdminPassword() {
        return adminPassword;
    }

    /**
     * @param adminPassword
     */
    public void setAdminPassword(String adminPassword) {
        this.adminPassword = adminPassword;
    }

    /**
     * @return admin_level
     */
    public String getAdminLevel() {
        return adminLevel;
    }

    /**
     * @param adminLevel
     */
    public void setAdminLevel(String adminLevel) {
        this.adminLevel = adminLevel;
    }

    /**
     * @return admin_type
     */
    public String getAdminType() {
        return adminType;
    }

    /**
     * @param adminType
     */
    public void setAdminType(String adminType) {
        this.adminType = adminType;
    }
}
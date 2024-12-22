package com.flipkart;

public class PlacementDrive {
    private String company_name;
    private String company_address;
    private String position;
    private double salary;
    private String required_skills;
    private String status;

    public PlacementDrive(String company_name, String company_address, String position, double salary, String required_skills, String status) {
        this.company_name = company_name;
        this.company_address = company_address;
        this.position = position;
        this.salary = salary;
        this.required_skills = required_skills;
        this.status = status;
    }

    public String getCompanyName() { return company_name; }
    public String getCompanyAddress() { return company_address; }
    public String getPosition() { return position; }
    public double getSalary() { return salary; }
    public String getRequiredSkills() { return required_skills; }
    public String getStatus() { return status; }

    public void setStatus(String status) { this.status = status; }
}

package kr.or.iei.project.model.vo;

import java.util.ArrayList;

import kr.or.iei.emp.model.vo.Team;

public class Project {
	private String projectNo;
	private String documentTypeCode;
	private String projectTitle;
	private String projectContent;
	private String projectEnd;
	private String empCode;
	private String projectStart;
	
	public String getProjectStart() {
		return projectStart;
	}


	public void setProjectStart(String projectStart) {
		this.projectStart = projectStart;
	}


	public Project(String projectStart) {
		super();
		this.projectStart = projectStart;
	}


	//종속 변수
	private String documentDate;
	private ArrayList<Team> teamList;
	private String empName;
	private String teamLeader;
	private ArrayList<ProjectPartemp> projectPartemp;
	private ArrayList<ProjectTeam> projectTeam;
	private String projectProgressRate;
	private String teamProgressRate;
	
	
	public Project() {
		super();
		
	}


	public Project(String projectNo, String documentTypeCode, String projectTitle, String projectContent,
			String projectEnd, String empCode, String documentDate, ArrayList<Team> teamList, String empName,
			String teamLeader, ArrayList<ProjectPartemp> projectPartemp, ArrayList<ProjectTeam> projectTeam,
			String projectProgressRate, String teamProgressRate) {
		super();
		this.projectNo = projectNo;
		this.documentTypeCode = documentTypeCode;
		this.projectTitle = projectTitle;
		this.projectContent = projectContent;
		this.projectEnd = projectEnd;
		this.empCode = empCode;
		this.documentDate = documentDate;
		this.teamList = teamList;
		this.empName = empName;
		this.teamLeader = teamLeader;
		this.projectPartemp = projectPartemp;
		this.projectTeam = projectTeam;
		this.projectProgressRate = projectProgressRate;
		this.teamProgressRate = teamProgressRate;
	}


	public String getProjectNo() {
		return projectNo;
	}


	public void setProjectNo(String projectNo) {
		this.projectNo = projectNo;
	}


	public String getDocumentTypeCode() {
		return documentTypeCode;
	}


	public void setDocumentTypeCode(String documentTypeCode) {
		this.documentTypeCode = documentTypeCode;
	}


	public String getProjectTitle() {
		return projectTitle;
	}


	public void setProjectTitle(String projectTitle) {
		this.projectTitle = projectTitle;
	}


	public String getProjectContent() {
		return projectContent;
	}


	public void setProjectContent(String projectContent) {
		this.projectContent = projectContent;
	}


	public String getProjectEnd() {
		return projectEnd;
	}


	public void setProjectEnd(String projectEnd) {
		this.projectEnd = projectEnd;
	}


	public String getEmpCode() {
		return empCode;
	}


	public void setEmpCode(String empCode) {
		this.empCode = empCode;
	}


	public String getDocumentDate() {
		return documentDate;
	}


	public void setDocumentDate(String documentDate) {
		this.documentDate = documentDate;
	}


	public ArrayList<Team> getTeamList() {
		return teamList;
	}


	public void setTeamList(ArrayList<Team> teamList) {
		this.teamList = teamList;
	}


	public String getEmpName() {
		return empName;
	}


	public void setEmpName(String empName) {
		this.empName = empName;
	}


	public String getTeamLeader() {
		return teamLeader;
	}


	public void setTeamLeader(String teamLeader) {
		this.teamLeader = teamLeader;
	}


	public ArrayList<ProjectPartemp> getProjectPartemp() {
		return projectPartemp;
	}


	public void setProjectPartemp(ArrayList<ProjectPartemp> projectPartemp) {
		this.projectPartemp = projectPartemp;
	}


	public ArrayList<ProjectTeam> getProjectTeam() {
		return projectTeam;
	}


	public void setProjectTeam(ArrayList<ProjectTeam> projectTeam) {
		this.projectTeam = projectTeam;
	}


	public String getProjectProgressRate() {
		return projectProgressRate;
	}


	public void setProjectProgressRate(String projectProgressRate) {
		this.projectProgressRate = projectProgressRate;
	}


	public String getTeamProgressRate() {
		return teamProgressRate;
	}


	public void setTeamProgressRate(String teamProgressRate) {
		this.teamProgressRate = teamProgressRate;
	}


	@Override
	public String toString() {
		return "Project [projectNo=" + projectNo + ", documentTypeCode=" + documentTypeCode + ", projectTitle="
				+ projectTitle + ", projectContent=" + projectContent + ", projectEnd=" + projectEnd + ", empCode="
				+ empCode + ", projectStart=" + projectStart + ", documentDate=" + documentDate + ", teamList="
				+ teamList + ", empName=" + empName + ", teamLeader=" + teamLeader + ", projectPartemp="
				+ projectPartemp + ", projectTeam=" + projectTeam + ", projectProgressRate=" + projectProgressRate
				+ ", teamProgressRate=" + teamProgressRate + "]";
	}


	


	
	
}

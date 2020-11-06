package com.cdac.dto;

import javax.persistence.*;

@Entity
public class matchDetails {

	@Id
	@GeneratedValue
	private int matchNo;
	private String team1Name;
	private String team2Name;
	private String matchDate;
	private String matchVenue;
	private String cotchName;
	public matchDetails() {
	}
	public int getMatchNo() {
		return matchNo;
	}
	public void setMatchNo(int matchNo) {
		this.matchNo = matchNo;
	}
	public String getTeam1Name() {
		return team1Name;
	}
	public void setTeam1Name(String team1Name) {
		this.team1Name = team1Name;
	}
	public String getTeam2Name() {
		return team2Name;
	}
	public void setTeam2Name(String team2Name) {
		this.team2Name = team2Name;
	}
	public String getMatchDate() {
		return matchDate;
	}
	public void setMatchDate(String matchDate) {
		this.matchDate = matchDate;
	}
	public String getMatchVenue() {
		return matchVenue;
	}
	public void setMatchVenue(String matchVenue) {
		this.matchVenue = matchVenue;
	}
	public String getCotchName() {
		return cotchName;
	}
	public void setCotchName(String cotchName) {
		this.cotchName = cotchName;
	}
	@Override
	public String toString() {
		return "matchDetails [matchNo=" + matchNo + ", team1Name=" + team1Name + ", team2Name=" + team2Name
				+ ", matchDate=" + matchDate + ", matchVenue=" + matchVenue + ", cotchName=" + cotchName + "]";
	}
	
}

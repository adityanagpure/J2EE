package com.cdac.dto;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class ScoreBoard {

	@Id
	@GeneratedValue
	private int ID;
	private String playerName;
	private int fourRun;
	private int sixRun;
	private String playerTotalRun;
	private int playerBalls;
	
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getPlayerName() {
		return playerName;
	}
	public void setPlayerName(String playerName) {
		this.playerName = playerName;
	}
	public int getFourRun() {
		return fourRun;
	}
	public void setFourRun(int fourRun) {
		this.fourRun = fourRun;
	}
	public int getSixRun() {
		return sixRun;
	}
	public void setSixRun(int sixRun) {
		this.sixRun = sixRun;
	}
	public String getPlayerTotalRun() {
		return playerTotalRun;
	}
	public void setPlayerTotalRun(String playerTotalRun) {
		this.playerTotalRun = playerTotalRun;
	}
	public int getPlayerBalls() {
		return playerBalls;
	}
	public void setPlayerBalls(int playerBalls) {
		this.playerBalls = playerBalls;
	}
	public ScoreBoard() {
	}
	
	
}

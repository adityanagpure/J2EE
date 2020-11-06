package com.cdac.dto;

public class Runs {

	private int runTaken;
	private String runType;
	private String extraRun;
	static private int score;
	static private int wicket;
	static private int score1;
	static private int wicket1;
	static private int balls1;
	static private int balls2;
	
	
	
	public static int getBalls1() {
		return balls1;
	}
	public static void setBalls1(int balls1) {
		Runs.balls1 = balls1;
	}
	public static int getBalls2() {
		return balls2;
	}
	public static void setBalls2(int balls2) {
		Runs.balls2 = balls2;
	}
	public static int getScore() {
		return score;
	}
	public static void setScore(int score) {
		Runs.score = score;
	}
	public static int getWicket() {
		return wicket;
	}
	public static void setWicket(int wicket) {
		Runs.wicket = wicket;
	}
	public static int getScore1() {
		return score1;
	}
	public static void setScore1(int score1) {
		Runs.score1 = score1;
	}
	public static int getWicket1() {
		return wicket1;
	}
	public static void setWicket1(int wicket1) {
		Runs.wicket1 = wicket1;
	}
	public Runs() {
		// TODO Auto-generated constructor stub
	}
	public int getRunTaken() {
		return runTaken;
	}
	public void setRunTaken(int runTaken) {
		this.runTaken = runTaken;
	}
	public String getRunType() {
		return runType;
	}
	public void setRunType(String runType) {
		this.runType = runType;
	}
	public String getExtraRun() {
		return extraRun;
	}
	public void setExtraRun(String extraRun) {
		this.extraRun = extraRun;
	}
	
}

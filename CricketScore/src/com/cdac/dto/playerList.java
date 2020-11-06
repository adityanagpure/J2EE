package com.cdac.dto;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class playerList {

	@Id
	@GeneratedValue
	private int playerId;
	private String playerName;
	private String playerTeam;
	
	public playerList(){		
	}

	public playerList(int playerId) {
		super();
		this.playerId = playerId;
	}

	public int getPlayerId() {
		return playerId;
	}

	public void setPlayerId(int playerId) {
		this.playerId = playerId;
	}

	public String getPlayerName() {
		return playerName;
	}

	public void setPlayerName(String playerName) {
		this.playerName = playerName;
	}

	public String getPlayerTeam() {
		return playerTeam;
	}

	public void setPlayerTeam(String playerTeam) {
		this.playerTeam = playerTeam;
	}

	@Override
	public String toString() {
		return "playerList [playerId=" + playerId + ", playerName=" + playerName + ", playerTeam=" + playerTeam + "]";
	}
	
}

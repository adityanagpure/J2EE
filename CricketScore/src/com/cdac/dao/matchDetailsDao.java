package com.cdac.dao;

import java.util.List;

import javax.servlet.jsp.el.ScopedAttributeELResolver;

import com.cdac.dto.ScoreBoard;
import com.cdac.dto.matchDetails;
import com.cdac.dto.playerList;

public interface matchDetailsDao {
	void addMatchDeatils(matchDetails details);
	void addPlayerDetails(playerList details);
	List <playerList> showListofPlayers(); 
	void deletePlayer(int playerId);
	playerList findPlayer(int playerId); 
	playerList updatePlayerDetails(playerList list);
	List <playerList> teamWiseListofPlayers(String team);
	List <playerList> BowlingTeamList(String team);
	void addScoreBoard(ScoreBoard board);
	boolean findPlayer(String name); 
	ScoreBoard getAllrecordOfPlayerByname(String name);
	void updateScoreOfplayers(ScoreBoard board);
	List <ScoreBoard> getAllScoreBoard();
	ScoreBoard temp(String name);
	List<matchDetails> getMatchDetails();
	boolean checkUser(String userName, String userPass);
	String validateUser(String userName, String userEmail );
	
}

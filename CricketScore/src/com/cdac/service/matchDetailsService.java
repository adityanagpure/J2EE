package com.cdac.service;

import java.util.List;

import com.cdac.dto.ScoreBoard;
import com.cdac.dto.matchDetails;
import com.cdac.dto.playerList;

public interface matchDetailsService {
	void addDeatails(matchDetails details);
	void insertPlayerDetails(playerList details);
	List <playerList> displayListofPlayers();
	void removePlayer(int playerId);
	 playerList searchPlayer(int playerId);
	 playerList modifyPlayerDetails(playerList list);
	 List<playerList> seprateTeamListofPlayers(String team);
	 List<playerList> BallerTeamList(String team);
	 void insertScoreBoard(ScoreBoard board);
	 boolean SearchPlayerByname(String name);
	 ScoreBoard searchAllrecordOfPlayerByname(String name);
	 void modifyScoreOfplayers(ScoreBoard board); 
	 List<ScoreBoard> getAllScoreSummaryOfPlayers();
	 List<matchDetails> getAllMatchDetails() ;
}

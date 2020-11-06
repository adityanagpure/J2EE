package com.cdac.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cdac.dao.matchDetailsDao;
import com.cdac.dto.ScoreBoard;
import com.cdac.dto.matchDetails;
import com.cdac.dto.playerList;

@Service
public class matchDetailsServiceImple implements matchDetailsService {

	@Autowired
	private matchDetailsDao matchDao;
	
	@Override
	public void addDeatails(matchDetails details) {
		matchDao.addMatchDeatils(details);
	}

	@Override
	public void insertPlayerDetails(playerList details) {
		matchDao.addPlayerDetails(details);
	}

	@Override
	public List<playerList> displayListofPlayers() {
		return matchDao.showListofPlayers();
	}

	@Override
	public void removePlayer(int playerId) {
		matchDao.deletePlayer(playerId);
	}

	@Override
	public playerList searchPlayer(int playerId) {
		return matchDao.findPlayer(playerId);
	}

	@Override
	public playerList modifyPlayerDetails(playerList list) {
		return matchDao.updatePlayerDetails(list);
	}

	@Override
	public List<playerList> seprateTeamListofPlayers(String team) {
		return matchDao.teamWiseListofPlayers(team);
	}

	@Override
	public List<playerList> BallerTeamList(String team) {
		// TODO Auto-generated method stub
		return matchDao.BowlingTeamList(team);
	}

	@Override
	public void insertScoreBoard(ScoreBoard board) {
		matchDao.addScoreBoard(board);
		
	}

	@Override
	public boolean SearchPlayerByname(String name) {
		// TODO Auto-generated method stub
		return matchDao.findPlayer(name);
	}

	@Override
	public ScoreBoard searchAllrecordOfPlayerByname(String name) {
		System.out.println("in service name is "+name);		
		return matchDao.getAllrecordOfPlayerByname(name);
	}

	@Override
	public void modifyScoreOfplayers(ScoreBoard board) {
			matchDao.updateScoreOfplayers(board);	
	}

	@Override
	public List<ScoreBoard> getAllScoreSummaryOfPlayers() {
		
		return matchDao.getAllScoreBoard();
	}

	@Override
	public List<matchDetails> getAllMatchDetails() {
		// TODO Auto-generated method stub
		return matchDao.getMatchDetails();
	}

}

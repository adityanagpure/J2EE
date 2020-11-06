package com.cdac.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.cdac.dto.Admin;
import com.cdac.dto.ScoreBoard;
import com.cdac.dto.matchDetails;
import com.cdac.dto.playerList;

@Repository
public class matchDetailsDaoImple implements matchDetailsDao {

	@Autowired
	private HibernateTemplate h;
	
	@Override
	public void addMatchDeatils(matchDetails details) {
		h.execute(new HibernateCallback<Void>() {
			@Override
			public Void doInHibernate(Session s) throws HibernateException {
				Transaction tr = s.beginTransaction();
				s.save(details);
				tr.commit();
				s.flush();
				s.close();
				return null;
			}
		});
	}

	@Override
	public void addPlayerDetails(playerList details) {
		h.execute(new HibernateCallback<Void>() {
			@Override
			public Void doInHibernate(Session s) throws HibernateException {
				Transaction tr = s.beginTransaction();
				s.save(details);
				tr.commit();
				s.flush();
				s.close();
				return null;
			}
		});	
	}

	@Override
	public List<playerList> showListofPlayers() {
		return	h.execute(new HibernateCallback<List<playerList>>() {
				@Override
				public List<playerList> doInHibernate(Session s) throws HibernateException {
					Transaction tr = s.beginTransaction();
					Query q = s.createQuery("from playerList");
					List<playerList> li = q.list();
					tr.commit();
					s.flush();
					s.close();
					return li;
				}
			});
	}

	@Override
	public void deletePlayer(int playerId) {
			h.execute(new HibernateCallback<Void>() {
			@Override
			public Void doInHibernate(Session s) throws HibernateException {
				Transaction tr = s.beginTransaction();
				s.delete(new playerList(playerId));
				tr.commit();
				s.flush();
				s.close();
				return null;
			}
		});
	}

	@Override
	public playerList findPlayer(int playerId) {
		return	h.execute(new HibernateCallback<playerList>() {
			@Override
			public playerList doInHibernate(Session s) throws HibernateException {
				Transaction tr = s.beginTransaction();
				Query q = s.createQuery("from playerList where playerId = ?");
				q.setInteger(0, playerId);
				List<playerList> plist = q.list();
				tr.commit();
				s.flush();
				s.close();
				return plist.get(0);
			}
		});
	}

	@Override
	public playerList updatePlayerDetails(playerList list) {
	return	h.execute(new HibernateCallback<playerList>() {
			@Override
			public playerList doInHibernate(Session session) throws HibernateException {
				Transaction tr = session.beginTransaction();
				
				playerList ex = (playerList)session.get(playerList.class,list.getPlayerId());
				ex.setPlayerName(list.getPlayerName());
				ex.setPlayerTeam(list.getPlayerTeam());				
				session.update(ex);			
				tr.commit();
				session.flush();
				session.close();
				return ex;
			}			
		});

	}

	@Override
	public List<playerList> teamWiseListofPlayers(String team) {
		return	h.execute(new HibernateCallback<List<playerList>>() {
			@Override
			public List<playerList> doInHibernate(Session s) throws HibernateException {
				Transaction tr = s.beginTransaction();
				Query q = s.createQuery("from playerList where playerTeam = ?");
				q.setString(0, team);
				List<playerList> li = q.list();
				tr.commit();
				s.flush();
				s.close();
				return li;
			}
		});
	
	}

	@Override
	public List<playerList> BowlingTeamList(String team) {
		return	h.execute(new HibernateCallback<List<playerList>>() {
			@Override
			public List<playerList> doInHibernate(Session s) throws HibernateException {
				Transaction tr = s.beginTransaction();
				Query q = s.createQuery("from playerList where playerTeam != ?");
				q.setString(0, team);
				List<playerList> li = q.list();
				tr.commit();
				s.flush();
				s.close();
				return li;
			}
		});
	
	}

	@Override
	public void addScoreBoard(ScoreBoard board) {
		h.execute(new HibernateCallback<Void>() {
			@Override
			public Void doInHibernate(Session s) throws HibernateException {
				Transaction tr = s.beginTransaction();
				s.save(board);
				tr.commit();
				s.flush();
				s.close();
				return null;
			}
		});
		
	}

	@Override
	public boolean findPlayer(String name) {
		return h.execute(new HibernateCallback<Boolean>() {
			@Override
			public Boolean doInHibernate(Session s) throws HibernateException {
				Boolean flag = false;
				Transaction tr = s.beginTransaction();
				Query q = s.createQuery("from ScoreBoard where playerName = ?");
				q.setString(0, name);
				List<ScoreBoard> li = q.list();
				flag = li.isEmpty();
				tr.commit();
				s.flush();
				s.close();
				return flag;
			}
		});
	}

	@Override
	public ScoreBoard getAllrecordOfPlayerByname(String name) {
		System.out.println("Strat the fun -- "+name);
		return	h.execute(new HibernateCallback<ScoreBoard>() {
			//System.out.println("Strat the fun 2 --");
			@Override
			public ScoreBoard doInHibernate(Session s) throws HibernateException {
				System.out.println("into the DAO "+name);
				
				Transaction tr = s.beginTransaction();
				Query q = s.createQuery("from ScoreBoard where playerName = ?");
				q.setString(0, name);
				List<ScoreBoard> li = q.list();
				tr.commit();
				s.flush();
				s.close();
				
					return li.get(0);
			}
		});
	}

	@Override
	public void updateScoreOfplayers(ScoreBoard board) {
		h.execute(new HibernateCallback<Void>() {
			@Override
			public Void doInHibernate(Session s) throws HibernateException {
				Transaction tr = s.beginTransaction();
				s.update(board);
				tr.commit();
				s.flush();
				s.close();
				return null;
			}
		});
	}

	@Override
	public List<ScoreBoard> getAllScoreBoard() {
		return	h.execute(new HibernateCallback<List<ScoreBoard> >() {
			@Override
			public List<ScoreBoard>  doInHibernate(Session s) throws HibernateException {				
				Transaction tr = s.beginTransaction();
				Query q = s.createQuery("from ScoreBoard");				
				List<ScoreBoard> li = q.list();
				tr.commit();
				s.flush();
				s.close();
				return li;
			}
		});
	}

	@Override
	public ScoreBoard temp(String name) {
		System.out.println("Strat the fun 1 -- "+name);
		return	h.execute(new HibernateCallback<ScoreBoard>() {
			//System.out.println("Strat the fun 2 --");
			@Override
			public ScoreBoard doInHibernate(Session s) throws HibernateException {
				System.out.println("into the DAO 1 "+name);
				
				Transaction tr = s.beginTransaction();
				Query q = s.createQuery("from ScoreBoard where playerName = ?");
				q.setString(0, name);
				List<ScoreBoard> li = q.list();
				tr.commit();
				s.flush();
				s.close();
				return li.get(0);
			}
		});
	}

	@Override
	public List<matchDetails> getMatchDetails() {
		return	h.execute(new HibernateCallback<List<matchDetails>>() {
			@Override
			public List<matchDetails> doInHibernate(Session s) throws HibernateException {
				Transaction tr = s.beginTransaction();
				Query q = s.createQuery("from matchDetails");
				List<matchDetails> li = q.list();
				tr.commit();
				s.flush();
				s.close();
				return li;
			}
		});
	}

	@Override
	public boolean checkUser(String userName, String userPass) {
		return h.execute(new HibernateCallback<Boolean>() {

			@Override
			public Boolean doInHibernate(Session s) throws HibernateException {
				Transaction tr = s.beginTransaction();
				Boolean flag=false;
				Query query2 = s.createQuery("from Admin where userName=? and userPass=?");
				query2.setString(0, userName);
				query2.setString(1, userPass);
				List li = query2.list();
				tr.commit();
				s.flush();
				s.close();
				flag= li.isEmpty();
				return flag;
			}
		});

	}

	@Override
	public String validateUser(String userName, String userEmail) {
		return h.execute(new HibernateCallback<String>() {
			@Override
			public String doInHibernate(Session s) throws HibernateException {
				Transaction tr = s.beginTransaction();
				Query query2 = s.createQuery("from Admin where userName=? and userEmail=?");
				query2.setString(0, userName);
				query2.setString(1, userEmail);
				
				List <Admin>li = query2.list();
		//		System.out.println("(String) li.get(0) "+(String) li.get(0));
				if(!li.isEmpty()) {
					return li.get(0).getUserPass();
				}
				tr.commit();
				s.flush();
				s.close();		
				return null;
			}
		});
	}

	
		
	
}
	
	


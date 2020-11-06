package com.cdac.controller;

import java.io.IOException;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.collections.ManagedConcurrentWeakHashMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cdac.dao.matchDetailsDao;
import com.cdac.dto.Admin;
import com.cdac.dto.Runs;
import com.cdac.dto.ScoreBoard;
import com.cdac.dto.matchDetails;
import com.cdac.dto.playerList;
import com.cdac.service.matchDetailsService;
import com.mysql.cj.Session;

@Controller
public class matchController {

	@Autowired
	matchDetailsService matchserv;
	
	@Autowired
	matchDetailsDao temp;
	
	@Autowired
	private MailSender mailSender;

	
	@RequestMapping("/add")
	public String addDetails(ModelMap map, HttpSession session, HttpServletResponse r) throws IOException {
		matchController.checkSession(session, r);
		map.put("matchDetails", new matchDetails());
		session.setAttribute("matchDetails",new matchDetails());
		return "matchDetails";		
	}
	
	@RequestMapping(value ="/addmatchDetails")
	public String addmatchDetails(matchDetails details,HttpSession session, HttpServletResponse r) throws IOException {
		matchController.checkSession(session, r);
		matchserv.addDeatails(details);
		System.out.println("added!!!");
		return "redirect:PlayerListView";		
	}
	
	@RequestMapping(value = "/PlayerListView")
	public String addPlayerView(ModelMap map,HttpSession session, HttpServletResponse r) throws IOException {
		matchController.checkSession(session, r);
		map.put("playerlist", new playerList());
		return "playerList";		
	}
	
	// Player added to DB
	@RequestMapping("/addPlayer")
	public String addPlayer(playerList list,HttpSession session, HttpServletResponse r) throws IOException {
		matchController.checkSession(session, r);
		matchserv.insertPlayerDetails(list);
		System.out.println("player added!!!");
		return "playerList";	
	}
	
	//showList of players 
	@RequestMapping("/showList")
	public String showListofPlayers(ModelMap map, HttpSession ses, HttpServletResponse r) throws IOException {
		matchController.checkSession(ses, r);
		List<playerList> li = matchserv.displayListofPlayers();
	
		map.put("listofplayer", li);
		ses.setAttribute("listofplayer", li);
		return "listofplayer";	
	}
	
	//deletePlayer
	@RequestMapping("/deletePlayer")
	public String deletePlayerList(@RequestParam("pid") int pid, ModelMap map,HttpSession session, HttpServletResponse r) throws IOException {
		matchController.checkSession(session, r);
		matchserv.removePlayer(pid);
		return "redirect:showList";	
	}
	
	//updatePlayerform
	@RequestMapping("/updatePlayer")
	public String updatePlayerList(@RequestParam("pid") int pid, ModelMap map,HttpSession session, HttpServletResponse r) throws IOException {
		matchController.checkSession(session, r);
		playerList plist = matchserv.searchPlayer(pid);
		map.put("plist", plist);
		return "updateplayerForm";	
	}
	
	@RequestMapping("/updatePlayerDetails")
	public String updatePlayerDetails(playerList list, ModelMap map,HttpSession session, HttpServletResponse r) throws IOException {
		matchController.checkSession(session, r);
		matchserv.modifyPlayerDetails(list);
		return "redirect:showList";	
	}
	
	//tossForm
	@RequestMapping("/tossForm")
	public String tossForm(ModelMap map,HttpSession session, HttpServletResponse r) throws IOException {
		matchController.checkSession(session, r);
		return "tossForm";	
	}
	
	//matchStart
	@RequestMapping("/matchStart")
	public String matchStart(@RequestParam("batball") String batball, @RequestParam("team") String team, ModelMap map,HttpSession ses, HttpServletResponse r) throws IOException {
		matchController.checkSession(ses, r);
		ses.setAttribute("team", team);
		List<playerList> list1 = matchserv.seprateTeamListofPlayers(team);
		map.put("list1", list1);
		List<playerList> ballerlist = matchserv.BallerTeamList(team);
		System.out.println(ballerlist.toString());
		map.put("ballerlist", ballerlist);
		ses.setAttribute("batsman", ballerlist);
		ses.setAttribute("baller", list1);		
		return "matchStartForm";	
	}
	
	//battingSummary
	@RequestMapping("/battingSummary")
	public String BattingSummary(@RequestParam("striker") String striker ,@RequestParam("nonStriker") String nonstriker, @RequestParam("bowler") String bowler,HttpSession session, HttpServletResponse r ,ModelMap map) throws IOException {
		matchController.checkSession(session, r);
		String s = striker;
		String ns =nonstriker;
		String b = bowler;
		System.out.println("==== 00 "+s+" "+ns+" "+b);
		session.setAttribute("s", s);
		session.setAttribute("ns", ns);
		session.setAttribute("b", b);
		 map.put("sb1", new ScoreBoard());
		 map.put("sb2", new ScoreBoard());
		// session.setAttribute("score",0);//session.getAttribute("score")
		return "battingSummary";	
	}
	
	
	//updateRun
	@RequestMapping(value = "/updateRun", method = RequestMethod.POST )
	public String updateRun(@RequestParam("playerName") String playerName,@RequestParam("playerTotalRun") String playerTotalRun, @RequestParam("runType") String runType, @RequestParam("extraRun") String extraRun, ModelMap map, ScoreBoard sboard,HttpSession sess, HttpServletResponse r) throws IOException {		
		//matchController.checkSession(sess, r);
		Runs runs = new Runs();
		int scr2 = runs.getScore();
		int wicket = runs.getWicket();
		int ballsCount = runs.getBalls1(); 
		int w1 =0;
		if(runType.equals("OUT")) {
			++ballsCount;
			++w1;
			sess.setAttribute("w1", w1);
			System.out.println("out ");
			++wicket;
			List <playerList> lis =matchserv.displayListofPlayers();
			map.put("lis", lis);
			List <playerList> lis1 =matchserv.displayListofPlayers();
			map.put("lis1", lis1);
			return "playOutForm";
		}
		if(extraRun.equals("Wide") || extraRun.equals("No ball") || extraRun.equals("Leg-By")) {
				// scr++;
				 scr2++;
				 //sess.setAttribute("score", scr);
			 }
			 else {
					if (matchserv.SearchPlayerByname(playerName)) {	
						ballsCount++;
						System.out.println("New player +++++++++++++++++++++++++");
						int four=0;
						int six=0;
						int balls=0;
						int f=0;
						int s=0;		
						if(runType.equals("Batted")) {
							balls++;
							sboard.setPlayerBalls(balls);
							if(playerTotalRun.equals("4")) {
								four++;
								sboard.setFourRun(four);
								f=4;				
							}
							else if(playerTotalRun.equals("6")) {
								six++;
								sboard.setSixRun(six);
								s=6;
							}
							int rr = s+f;
							map.put("board", new ScoreBoard());
							sboard.setPlayerTotalRun(String.valueOf(rr));
							matchserv.insertScoreBoard(sboard);
							System.out.println("insert succesfully 1 record");
						}
					}
					else {
						++ballsCount;
						System.out.println("OLD player");
						ScoreBoard list = matchserv.searchAllrecordOfPlayerByname(playerName);
						ScoreBoard obj = new ScoreBoard();
						obj.setPlayerName(list.getPlayerName());
						obj.setID(list.getID());
						
						if(playerTotalRun.equals("4")) {
							int fr = list.getFourRun();
							fr++;
							playerTotalRun = "4";
							obj.setFourRun(fr);
						}
						if(playerTotalRun.equals("6")) {
							int sx = list.getSixRun();
							sx++;
							playerTotalRun = "6";
							//s1++;
							obj.setSixRun(sx);
						}
						
						int run = Integer.parseInt(list.getPlayerTotalRun());
						run= run + Integer.parseInt(playerTotalRun);
						obj.setPlayerTotalRun(String.valueOf(run));
						if(runType.equals("Batted")) {
							int b = list.getPlayerBalls();
							b++;
							obj.setPlayerBalls(b);		
						}
						matchserv.modifyScoreOfplayers(obj);
					
					}
					//-------------->
			 }// else end 
			System.out.println("Wickets : "+wicket);
			runs.setWicket(wicket+ runs.getWicket());
			runs.setScore(scr2 + Integer.parseInt(playerTotalRun));
			runs.setBalls1(ballsCount);
			
			// sess.setAttribute("score", scr+ Integer.parseInt(playerTotalRun));
			 System.out.println("== ns "+(String)sess.getAttribute("ns")+ " "+(String)sess.getAttribute("s"));
			 String s =(String)sess.getAttribute("s");	
			// System.out.println("=== prnya ");
			 ScoreBoard sb1 = matchserv.searchAllrecordOfPlayerByname(s);
			// System.out.println("SB 1 "+ sb1.getID() + sb1.getPlayerName());
			 map.put("sb1", sb1);
			 //System.out.println("====== ABHI 1 ");
			 String ns =(String)sess.getAttribute("ns");
			 ScoreBoard sb2 =  matchserv.searchAllrecordOfPlayerByname(ns);
			 System.out.println("SB 2 " +sb2.getPlayerName() +" "+sb2.getPlayerBalls() );
			 System.out.println("=== ABHI 2");
			 System.out.println("SB 2 "+ sb2.getID() + sb2.getPlayerName());
			 map.put("sb2", sb2);
			 
		return "battingSummary";	
	}
	
	//playOutForm
	@RequestMapping("/playOutForm")
	public String playOutForm(HttpSession session, HttpServletResponse r) throws IOException {
		matchController.checkSession(session, r);
		return "matchStartForm";	
	}
	
	//inningOver
	@RequestMapping("/inningOver")
	public String inningOverForm(ModelMap map,HttpSession session, HttpServletResponse r) throws IOException {
		matchController.checkSession(session, r);
		List<ScoreBoard> finalList = matchserv.getAllScoreSummaryOfPlayers();
		map.put("finalList", finalList);
		return "FirstinningScoreBoard";	
	}
	
	//secondInning
	@RequestMapping("/secondInning")
	public String secondInningForm(ModelMap map,HttpSession session, HttpServletResponse r) throws IOException {
		matchController.checkSession(session, r);
		List<playerList> list2  = matchserv.displayListofPlayers(); 
		map.put("list2", list2);
		return "SecondInningForm";	
	}
	//===
	@RequestMapping("/secondInningBattingSummary")
	public String secondInningBattingSummary(@RequestParam("striker1") String striker1 ,@RequestParam("nonStriker1") String nonstriker1, @RequestParam("bowler1") String bowler1,HttpSession session, HttpServletResponse r,ModelMap map) throws IOException {
		matchController.checkSession(session, r);
		String s1 = striker1;
		String ns1 =nonstriker1;
		String b1 = bowler1;
		session.setAttribute("s1", s1);
		session.setAttribute("ns1", ns1);
		session.setAttribute("b1", b1);
		 map.put("sb11", new ScoreBoard());
		 map.put("sb22", new ScoreBoard());
		 session.setAttribute("score1",0);//session.getAttribute("score")
		return "secondInningBattingSummary";	
	}
	
	//updateRun2
		@RequestMapping(value = "/updateRun2", method = RequestMethod.POST )
		public String updateRun2(@RequestParam("playerName") String playerName1,@RequestParam("playerTotalRun") String playerTotalRun1, @RequestParam("runType") String runType1, @RequestParam("extraRun") String extraRun1, ModelMap map, ScoreBoard sboard,HttpSession sess, HttpServletResponse r) throws IOException {		
			matchController.checkSession(sess, r);
			Runs runs = new Runs();
			int scr3 = runs.getScore1();
			int wicket = runs.getWicket1();	
			int ballsCount1 = runs.getBalls2();
			int w2 =0;
			System.out.println("in update 2 --->");
			if(runType1.equals("OUT")) {
				++ballsCount1;
				++wicket;
				++w2;
				sess.setAttribute("w2", w2);
				List <playerList> lis =matchserv.displayListofPlayers();
				map.put("lis", lis);
				List <playerList> lis1 =matchserv.displayListofPlayers();
				map.put("lis1", lis1);
				return "playOutForm2";
			}
			System.out.println("in update 3   --->");
			if(extraRun1.equals("Wide") || extraRun1.equals("No ball") || extraRun1.equals("Leg-By")) {
					 scr3++;
				 }
				 else {
					 ++ballsCount1;
					 System.out.println("in update 4   --->");
						if (matchserv.SearchPlayerByname(playerName1)) {		
							System.out.println("New player update2");
							int four=0;
							int six=0;
							int balls=0;
							int f=0;
							int s=0;		
							if(runType1.equals("Batted")) {
								balls++;
								sboard.setPlayerBalls(balls);
								if(playerTotalRun1.equals("4")) {
									four++;
									sboard.setFourRun(four);
									f=4;				
								}
								else if(playerTotalRun1.equals("6")) {
									six++;
									sboard.setSixRun(six);
									s=6;
								}
								int rr = s+f;
								map.put("board", new ScoreBoard());
								sboard.setPlayerTotalRun(String.valueOf(rr));
								matchserv.insertScoreBoard(sboard);
								System.out.println("insert succesfully 1 record");
							}
						}
						else {
							System.out.println("OLD player");
							ScoreBoard list = matchserv.searchAllrecordOfPlayerByname(playerName1);
							ScoreBoard obj = new ScoreBoard();
							obj.setPlayerName(list.getPlayerName());
							obj.setID(list.getID());
							
							if(playerTotalRun1.equals("4")) {
								int fr = list.getFourRun();
								fr++;
								playerTotalRun1 = "4";
								obj.setFourRun(fr);
							}
							if(playerTotalRun1.equals("6")) {
								int sx = list.getSixRun();
								sx++;
								playerTotalRun1 = "6";
								//s1++;
								obj.setSixRun(sx);
							}
							
							int run = Integer.parseInt(list.getPlayerTotalRun());
							run= run + Integer.parseInt(playerTotalRun1);
							obj.setPlayerTotalRun(String.valueOf(run));
							if(runType1.equals("Batted")) {
								int b = list.getPlayerBalls();
								b++;
								obj.setPlayerBalls(b);		
							}
							System.out.println("into update  5 ");
							matchserv.modifyScoreOfplayers(obj);
						
						}
				 }
				System.out.println("Wickets : "+wicket);
				runs.setWicket1(wicket+ runs.getWicket1());
				runs.setScore1(scr3 + Integer.parseInt(playerTotalRun1));
				sess.setAttribute("ballsCount1", ballsCount1);
				runs.setBalls2(ballsCount1);
				// sess.setAttribute("score", scr+ Integer.parseInt(playerTotalRun));
				// System.out.println("== ns "+(String)session.getAttribute("ns")+ " "+(String)session.getAttribute("s"));
				 String s1 =(String)sess.getAttribute("s1");	 
				 ScoreBoard sb11 = matchserv.searchAllrecordOfPlayerByname(s1);
				 map.put("sb11", sb11);
				 String ns1 =(String)sess.getAttribute("ns1");
				 ScoreBoard sb22 =  matchserv.searchAllrecordOfPlayerByname(ns1);
				 map.put("sb22", sb22);
				 
					System.out.println("into update  6 ");
			return "secondInningBattingSummary";	
		}
	
		
		//endMatch  inningOver
		@RequestMapping("/endMatch")
		public String endMatch(ModelMap map,HttpSession session, HttpServletResponse r) throws IOException {
			matchController.checkSession(session, r);
			List<matchDetails> details = matchserv.getAllMatchDetails();
			List<ScoreBoard> finalList = matchserv.getAllScoreSummaryOfPlayers();
			System.out.println("into the end match  1");
			map.put("finalList1", finalList);
			map.put("details", details);
			System.out.println("into the end match  2");
			return "endMatchForm";	
		}
		
		//logout 
		@RequestMapping("/logout")
		public String logout(ModelMap map, HttpSession session) {
			map.put("admin", new Admin());
			session.invalidate();
			return "Login";	
		}
		
		//forgotPassword
		@RequestMapping("/forgotPassword")
		public String forgotPassword(ModelMap map, HttpSession session) {
			
			return "forgotPassword";	
		}
	
		//Error
		@RequestMapping("/*")
		public String errorkkk() {
			
			return "error404";	
		}

		
		public static void checkSession(HttpSession hs,HttpServletResponse r) throws IOException {
			Object s = (Object) hs.getAttribute("admin");
			if(s == null) {
				r.sendRedirect("./");	
			}
		}
		
}







package test.schedule;

import java.util.TimerTask;

import test.bo.AuctionManager;
import test.exception.AuctionException;
/**
 * @author  yeeku.H.lee kongyeeku@163.com
 * @version  1.0
 * <br>Copyright (C), 2005-2008, yeeku.H.Lee
 * <br>This program is protected by copyright laws.
 * <br>Program Name:
 * <br>Date: 
 */
public class CheckWiner extends TimerTask
{
	private AuctionManager mgr;
	public void setMgr(AuctionManager mgr)
	{
		this.mgr = mgr;
	}

	public void run()
	{
		System.out.println("---------------------");
		try
		{
			mgr.updateWiner();
		}
		catch (AuctionException ae)
		{
			ae.printStackTrace();
		}
	}
}

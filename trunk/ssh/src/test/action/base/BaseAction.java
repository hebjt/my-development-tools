package test.action.base;

import org.apache.commons.logging.Log;

import com.opensymphony.xwork2.ActionSupport;

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

public class BaseAction extends ActionSupport
{
    protected AuctionManager mgr;

    public void setMgr(AuctionManager mgr)
    {
        this.mgr = mgr;
    }
}
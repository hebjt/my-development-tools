package airticket.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import airticket.po.Airorder;
import airticket.po.AirorderId;

/**
 * Data access object (DAO) for domain model class Airorder.
 * @see airticket.po.Airorder
 * @author MyEclipse - Hibernate Tools
 */
public class AirorderDAO extends HibernateDaoSupport {

    private static final Log log = LogFactory.getLog(AirorderDAO.class);

	//property constants
	public static final String PASSENGERTYPE = "passengertype";
	public static final String CREDENTIALSTYPE = "credentialstype";
	public static final String CREDENTIALSID = "credentialsid";
	public static final String PNR = "pnr";
	public static final String AIRTYPE = "airtype";
	public static final String SCOPE = "scope";
	public static final String AIRPALNETYPE1 = "airpalnetype1";
	public static final String AIRNO = "airno";
	public static final String SERT1 = "sert1";
	public static final String FROMCITY1 = "fromcity1";
	public static final String TOCITY1 = "tocity1";
	public static final String FARE1 = "fare1";
	public static final String MYC1 = "myc1";
	public static final String AIRPORTBUILD1 = "airportbuild1";
	public static final String STOP1 = "stop1";
	public static final String FOOD1 = "food1";
	public static final String RMK1 = "rmk1";
	public static final String AIRPALNETYPE2 = "airpalnetype2";
	public static final String AIRNO2 = "airno2";
	public static final String SERT2 = "sert2";
	public static final String FROMCITY2 = "fromcity2";
	public static final String TOCITY2 = "tocity2";
	public static final String FARE2 = "fare2";
	public static final String MYC2 = "myc2";
	public static final String AIRPORTBUILD2 = "airportbuild2";
	public static final String STOP2 = "stop2";
	public static final String FOOD2 = "food2";
	public static final String RMK2 = "rmk2";
	public static final String SCOREPAY = "scorepay";
	public static final String PROMOTIONPAY = "promotionpay";
	public static final String TEL = "tel";
	public static final String NOTE = "note";
	public static final String STATIC_ = "static_";
	public static final String DISCOUNT2 = "discount2";
	public static final String DISCOUNT1 = "discount1";
	public static final String KFARE = "kfare";
	public static final String PROMULGATOR = "promulgator";
	public static final String PAYMENTFORM = "paymentform";
	public static final String PAYORDERID = "payorderid";
	public static final String ET = "et";
	public static final String TKNO = "tkno";
	public static final String ISRR = "isrr";
	public static final String GETADDRESS = "getaddress";
	public static final String SENDADDRESS = "sendaddress";
	public static final String CONTACTPERSON = "contactperson";
	public static final String ORDERER = "orderer";

    
    public void save(Airorder transientInstance) {
        log.debug("saving Airorder instance");
        try {
        	getHibernateTemplate().save(transientInstance);
//            getSession().save(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	public void delete(Airorder persistentInstance) {
        log.debug("deleting Airorder instance");
        try {
            getSession().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    public Airorder findById(AirorderId id) {
        log.debug("getting Airorder instance with id: " + id);
        try {
            Airorder instance = (Airorder) getSession()
                    .get("airticket.po.Airorder", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    public List findByExample(Airorder instance) {
        log.debug("finding Airorder instance by example");
        try {
            List results = getSession()
                    .createCriteria("airticket.po.Airorder")
                    .add(Example.create(instance))
            .list();
            log.debug("find by example successful, result size: " + results.size());
            return results;
        } catch (RuntimeException re) {
            log.error("find by example failed", re);
            throw re;
        }
    }    
    
    public List findByProperty(String propertyName, Object value) {
      log.debug("finding Airorder instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from Airorder as model where model." 
         						+ propertyName + "= ?";
         Query queryObject = getSession().createQuery(queryString);
		 queryObject.setParameter(0, value);
		 return queryObject.list();
      } catch (RuntimeException re) {
         log.error("find by property name failed", re);
         throw re;
      }
	}

	public List findByPassengertype(Object passengertype) {
		return findByProperty(PASSENGERTYPE, passengertype);
	}
	
	public List findByCredentialstype(Object credentialstype) {
		return findByProperty(CREDENTIALSTYPE, credentialstype);
	}
	
	public List findByCredentialsid(Object credentialsid) {
		return findByProperty(CREDENTIALSID, credentialsid);
	}
	
	public List findByPnr(Object pnr) {
		return findByProperty(PNR, pnr);
	}
	
	public List findByAirtype(Object airtype) {
		return findByProperty(AIRTYPE, airtype);
	}
	
	public List findByScope(Object scope) {
		return findByProperty(SCOPE, scope);
	}
	
	public List findByAirpalnetype1(Object airpalnetype1) {
		return findByProperty(AIRPALNETYPE1, airpalnetype1);
	}
	
	public List findByAirno(Object airno) {
		return findByProperty(AIRNO, airno);
	}
	
	public List findBySert1(Object sert1) {
		return findByProperty(SERT1, sert1);
	}
	
	public List findByFromcity1(Object fromcity1) {
		return findByProperty(FROMCITY1, fromcity1);
	}
	
	public List findByTocity1(Object tocity1) {
		return findByProperty(TOCITY1, tocity1);
	}
	
	public List findByFare1(Object fare1) {
		return findByProperty(FARE1, fare1);
	}
	
	public List findByMyc1(Object myc1) {
		return findByProperty(MYC1, myc1);
	}
	
	public List findByAirportbuild1(Object airportbuild1) {
		return findByProperty(AIRPORTBUILD1, airportbuild1);
	}
	
	public List findByStop1(Object stop1) {
		return findByProperty(STOP1, stop1);
	}
	
	public List findByFood1(Object food1) {
		return findByProperty(FOOD1, food1);
	}
	
	public List findByRmk1(Object rmk1) {
		return findByProperty(RMK1, rmk1);
	}
	
	public List findByAirpalnetype2(Object airpalnetype2) {
		return findByProperty(AIRPALNETYPE2, airpalnetype2);
	}
	
	public List findByAirno2(Object airno2) {
		return findByProperty(AIRNO2, airno2);
	}
	
	public List findBySert2(Object sert2) {
		return findByProperty(SERT2, sert2);
	}
	
	public List findByFromcity2(Object fromcity2) {
		return findByProperty(FROMCITY2, fromcity2);
	}
	
	public List findByTocity2(Object tocity2) {
		return findByProperty(TOCITY2, tocity2);
	}
	
	public List findByFare2(Object fare2) {
		return findByProperty(FARE2, fare2);
	}
	
	public List findByMyc2(Object myc2) {
		return findByProperty(MYC2, myc2);
	}
	
	public List findByAirportbuild2(Object airportbuild2) {
		return findByProperty(AIRPORTBUILD2, airportbuild2);
	}
	
	public List findByStop2(Object stop2) {
		return findByProperty(STOP2, stop2);
	}
	
	public List findByFood2(Object food2) {
		return findByProperty(FOOD2, food2);
	}
	
	public List findByRmk2(Object rmk2) {
		return findByProperty(RMK2, rmk2);
	}
	
	public List findByScorepay(Object scorepay) {
		return findByProperty(SCOREPAY, scorepay);
	}
	
	public List findByPromotionpay(Object promotionpay) {
		return findByProperty(PROMOTIONPAY, promotionpay);
	}
	
	public List findByTel(Object tel) {
		return findByProperty(TEL, tel);
	}
	
	public List findByNote(Object note) {
		return findByProperty(NOTE, note);
	}
	
	public List findByStatic_(Object static_) {
		return findByProperty(STATIC_, static_);
	}
	
	public List findByDiscount2(Object discount2) {
		return findByProperty(DISCOUNT2, discount2);
	}
	
	public List findByDiscount1(Object discount1) {
		return findByProperty(DISCOUNT1, discount1);
	}
	
	public List findByKfare(Object kfare) {
		return findByProperty(KFARE, kfare);
	}
	
	public List findByPromulgator(Object promulgator) {
		return findByProperty(PROMULGATOR, promulgator);
	}
	
	public List findByPaymentform(Object paymentform) {
		return findByProperty(PAYMENTFORM, paymentform);
	}
	
	public List findByPayorderid(Object payorderid) {
		return findByProperty(PAYORDERID, payorderid);
	}
	
	public List findByEt(Object et) {
		return findByProperty(ET, et);
	}
	
	public List findByTkno(Object tkno) {
		return findByProperty(TKNO, tkno);
	}
	
	public List findByIsrr(Object isrr) {
		return findByProperty(ISRR, isrr);
	}
	
	public List findByGetaddress(Object getaddress) {
		return findByProperty(GETADDRESS, getaddress);
	}
	
	public List findBySendaddress(Object sendaddress) {
		return findByProperty(SENDADDRESS, sendaddress);
	}
	
	public List findByContactperson(Object contactperson) {
		return findByProperty(CONTACTPERSON, contactperson);
	}
	
	public List findByOrderer(Object orderer) {
		return findByProperty(ORDERER, orderer);
	}
	
    public Airorder merge(Airorder detachedInstance) {
        log.debug("merging Airorder instance");
        try {
            Airorder result = (Airorder) getSession()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(Airorder instance) {
        log.debug("attaching dirty Airorder instance");
        try {
            getSession().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(Airorder instance) {
        log.debug("attaching clean Airorder instance");
        try {
            getSession().lock(instance, LockMode.NONE);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    
    //=========================================
//    public void save(Userinfo transientInstance) {
//        log.debug("saving Userinfo instance");
//        try {
//            getSession().save(transientInstance);
//            getSession().flush();
////            getSession().beginTransaction().commit();
////            getSession().close();
//            log.debug("save successful");
//        } catch (RuntimeException re) {
//            log.error("save failed", re);
//            throw re;
//        }
//    }
}
package airticket.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import airticket.po.Userscore;

/**
 * Data access object (DAO) for domain model class Userscore.
 * @see airticket.po.Userscore
 * @author MyEclipse - Hibernate Tools
 */
public class UserscoreDAO extends HibernateDaoSupport {

    private static final Log log = LogFactory.getLog(UserscoreDAO.class);

	//property constants
	public static final String USERNAME = "username";
	public static final String OBTAINSCORE = "obtainscore";
	public static final String COSTSCORE = "costscore";
	public static final String ORDERID = "orderid";
	public static final String EVENTID = "eventid";

    
    public void save(Userscore transientInstance) {
        log.debug("saving Userscore instance");
        try {
        	getHibernateTemplate().save(transientInstance);
//            getSession().save(transientInstance);
//            getSession().beginTransaction().commit();
//            getSession().close();
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	public void delete(Userscore persistentInstance) {
        log.debug("deleting Userscore instance");
        try {
            getSession().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    public Userscore findById( java.lang.String id) {
        log.debug("getting Userscore instance with id: " + id);
        try {
            Userscore instance = (Userscore) getSession()
                    .get("airticket.po.Userscore", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    public List findByExample(Userscore instance) {
        log.debug("finding Userscore instance by example");
        try {
            List results = getSession()
                    .createCriteria("airticket.po.Userscore")
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
      log.debug("finding Userscore instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from Userscore as model where model." 
         						+ propertyName + "= ?";
         Query queryObject = getSession().createQuery(queryString);
		 queryObject.setParameter(0, value);
		 return queryObject.list();
      } catch (RuntimeException re) {
         log.error("find by property name failed", re);
         throw re;
      }
	}

	public List findByUsername(Object username) {
		return findByProperty(USERNAME, username);
	}
	
	public List findByObtainscore(Object obtainscore) {
		return findByProperty(OBTAINSCORE, obtainscore);
	}
	
	public List findByCostscore(Object costscore) {
		return findByProperty(COSTSCORE, costscore);
	}
	
	public List findByOrderid(Object orderid) {
		return findByProperty(ORDERID, orderid);
	}
	
	public List findByEventid(Object eventid) {
		return findByProperty(EVENTID, eventid);
	}
	
    public Userscore merge(Userscore detachedInstance) {
        log.debug("merging Userscore instance");
        try {
            Userscore result = (Userscore) getSession()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(Userscore instance) {
        log.debug("attaching dirty Userscore instance");
        try {
            getSession().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(Userscore instance) {
        log.debug("attaching clean Userscore instance");
        try {
            getSession().lock(instance, LockMode.NONE);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
}
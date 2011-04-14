package airticket.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import airticket.po.DromeCode;
import airticket.po.DromeCodeId;

/**
 * Data access object (DAO) for domain model class Dromecode.
 * @see airorder.Dromecode
 * @author MyEclipse - Hibernate Tools
 */
public class DromeCodeDAO extends HibernateDaoSupport {

    private static final Log log = LogFactory.getLog(DromeCodeDAO.class);

	//property constants

    
    public void save(DromeCode transientInstance) {
        log.debug("saving Dromecode instance");
        try {
            getHibernateTemplate().save(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	public void delete(DromeCode persistentInstance) {
        log.debug("deleting Dromecode instance");
        try {
            getHibernateTemplate().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
	public List findAll() {
		List list = null;
		try {
//			getHibernateTemplate().find(arg0)
//			Session session = getSession();
			String hql = "from DromeCode";
//			Query queryObject = getSession().createQuery(queryString);
			list = getHibernateTemplate().find(hql);
//			Query queryObject = session.createQuery(queryString);
//			dromeCodeList = (ArrayList<DromeCode>)queryObject.list();
//			log.info("before session.close() , session = "+session);
//			session.close();
//			log.info("after session.close() , session = "+session);
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
		return list;
	}
	
    public DromeCode findById( DromeCodeId id) {
        log.debug("getting Dromecode instance with id: " + id);
        try {
        	DromeCode instance = (DromeCode) getSession()
                    .get("airticket.po.Dromecode", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    public List findByExample(DromeCode instance) {
        log.debug("finding Dromecode instance by example");
        try {
            List results = getSession()
                    .createCriteria("airorder.Dromecode")
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
      log.debug("finding Dromecode instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from Dromecode as model where model." 
         						+ propertyName + "= ?";
         Query queryObject = getSession().createQuery(queryString);
		 queryObject.setParameter(0, value);
		 return queryObject.list();
      } catch (RuntimeException re) {
         log.error("find by property name failed", re);
         throw re;
      }
	}

    public DromeCode merge(DromeCode detachedInstance) {
        log.debug("merging Dromecode instance");
        try {
        	DromeCode result = (DromeCode) getSession()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(DromeCode instance) {
        log.debug("attaching dirty Dromecode instance");
        try {
            getSession().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(DromeCode instance) {
        log.debug("attaching clean Dromecode instance");
        try {
            getSession().lock(instance, LockMode.NONE);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
}
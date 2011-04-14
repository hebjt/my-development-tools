package airticket.dao;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.HibernateException;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Example;

import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import airticket.po.Userinfo;

/**
 * Data access object (DAO) for domain model class Userinfo.
 * 
 * @see airticket.po.Userinfo
 * @author MyEclipse - Hibernate Tools
 */
public class UserinfoDAO extends HibernateDaoSupport {

	private static final Log log = LogFactory.getLog(UserinfoDAO.class);

	// property constants
	public static final String USERNAME = "username";

	public static final String PASWORD = "pasword";

	public static final String PHONE = "phone";

	public static final String TEL = "tel";

	public static final String FAX = "fax";

	public static final String EMAIL = "email";

	public static final String TRUENAME = "truename";

	public static final String CREDENTIALSID = "credentialsid";

	public static final String CREDENTIALSTYPE = "credentialstype";

	public static final String SEX = "sex";

	public static final String COUNTRY = "country";

	public static final String PROVINCE = "province";

	public static final String ADDRESS = "address";

	public static final String POSTCODE = "postcode";

	public static final String STATUS = "status";

	public static final String USABLE = "usable";

	public static final String AIRSCORE = "airscore";

	public static final String AIRCOST = "aircost";

	public static final String FOREIGNAIRSCORE = "foreignairscore";

	public static final String FOREIGNAIRCOSTS = "foreignaircosts";

	public static final String HOTELSCORE = "hotelscore";

	public static final String HOTELCOST = "hotelcost";

	public static final String TRAVELSCORE = "travelscore";

	public static final String TRAVELCOST = "travelcost";

	public void save(Userinfo transientInstance) {
		log.debug("saving Userinfo instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	// 获得用户ID,用户ID暂时100000L开始，待规则制定，再行更改
	public Long findUserId() {
		Long userId = 100000L;
		try {
			log.debug("getUserId successful");

			List list = (List) getHibernateTemplate().executeFind(
					new HibernateCallback() {

						public Object doInHibernate(Session session)
								throws HibernateException, SQLException {
							// TODO 自动生成方法存根
							return session
									.createQuery(
											"SELECT MAX(user.userid) FROM Userinfo AS user")
									.list();
						}

					});
			if (list != null) {
				Iterator iterator = list.iterator();
				// 只有一个元素
				if (iterator.hasNext()) {
					Object results = (Object) iterator.next();
					if (results != null)
						userId = (Long) results + 1;
				}
			}
		} catch (RuntimeException re) {
			log.error("getUserId failed", re);
			throw re;
		}
		return userId;
	}

	public void delete(Userinfo persistentInstance) {
		log.debug("deleting Userinfo instance");
		try {
			getSession().delete(persistentInstance);
			getSession().beginTransaction().commit();
			getSession().close();
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Userinfo findById(java.lang.Long id) {
		log.debug("getting Userinfo instance with id: " + id);
		try {
			Userinfo instance = (Userinfo) getSession().get(
					"airticket.po.Userinfo", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(final Userinfo instance) {
		log.debug("finding Userinfo instance by example");
		List results;
		try {
			results = getHibernateTemplate().executeFind(
					new HibernateCallback() {

						public Object doInHibernate(Session session)
								throws HibernateException, SQLException {
							// TODO 自动生成方法存根
							return session.createCriteria(
									"airticket.po.Userinfo").add(
									Example.create(instance)).list();
						}

					});

			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Userinfo instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Userinfo as model where model."
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

	public List findByPasword(Object pasword) {
		return findByProperty(PASWORD, pasword);
	}

	public List findByPhone(Object phone) {
		return findByProperty(PHONE, phone);
	}

	public List findByTel(Object tel) {
		return findByProperty(TEL, tel);
	}

	public List findByFax(Object fax) {
		return findByProperty(FAX, fax);
	}

	public List findByEmail(Object email) {
		return findByProperty(EMAIL, email);
	}

	public List findByTruename(Object truename) {
		return findByProperty(TRUENAME, truename);
	}

	public List findByCredentialsid(Object credentialsid) {
		return findByProperty(CREDENTIALSID, credentialsid);
	}

	public List findByCredentialstype(Object credentialstype) {
		return findByProperty(CREDENTIALSTYPE, credentialstype);
	}

	public List findBySex(Object sex) {
		return findByProperty(SEX, sex);
	}

	public List findByCountry(Object country) {
		return findByProperty(COUNTRY, country);
	}

	public List findByProvince(Object province) {
		return findByProperty(PROVINCE, province);
	}

	public List findByAddress(Object address) {
		return findByProperty(ADDRESS, address);
	}

	public List findByPostcode(Object postcode) {
		return findByProperty(POSTCODE, postcode);
	}

	public List findByStatus(Object status) {
		return findByProperty(STATUS, status);
	}

	public List findByUsable(Object usable) {
		return findByProperty(USABLE, usable);
	}

	public List findByAirscore(Object airscore) {
		return findByProperty(AIRSCORE, airscore);
	}

	public List findByAircost(Object aircost) {
		return findByProperty(AIRCOST, aircost);
	}

	public List findByForeignairscore(Object foreignairscore) {
		return findByProperty(FOREIGNAIRSCORE, foreignairscore);
	}

	public List findByForeignaircosts(Object foreignaircosts) {
		return findByProperty(FOREIGNAIRCOSTS, foreignaircosts);
	}

	public List findByHotelscore(Object hotelscore) {
		return findByProperty(HOTELSCORE, hotelscore);
	}

	public List findByHotelcost(Object hotelcost) {
		return findByProperty(HOTELCOST, hotelcost);
	}

	public List findByTravelscore(Object travelscore) {
		return findByProperty(TRAVELSCORE, travelscore);
	}

	public List findByTravelcost(Object travelcost) {
		return findByProperty(TRAVELCOST, travelcost);
	}

	public Userinfo merge(Userinfo detachedInstance) {
		log.debug("merging Userinfo instance");
		try {
			Userinfo result = (Userinfo) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Userinfo instance) {
		log.debug("attaching dirty Userinfo instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Userinfo instance) {
		log.debug("attaching clean Userinfo instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}
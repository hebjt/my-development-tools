package cuijingtao.grid.dao;

import com.ibatis.common.jdbc.ScriptRunner;
import com.ibatis.common.resources.Resources;
import com.ibatis.dao.client.DaoManager;
import com.ibatis.dao.client.DaoManagerBuilder;



import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.Reader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

@SuppressWarnings("unused")
public class UserDaoConfig {

	private final static Log logger = LogFactory.getLog(UserDaoConfig.class);

	private static final String resource = "cuijingtao/grid/dao/user_dao.xml";
	private static final DaoManager daoManager;

	static {
		try {
			Properties props = new Properties();
			try {
				props.load(new FileInputStream(System.getProperty("configPath")
						+File.separator+ "jsondatabase.properties"));
			} catch (FileNotFoundException e) {
				logger.error("database.properties file not found");
			} catch (IOException e) {
				logger.error("read database.properties file failure");
			}
			daoManager = newDaoManager(props);

		} catch (Exception e) {
			throw new RuntimeException("Description.  Cause: " + e, e);
		}

	}
	
	/*
	static {
	    try {
	      daoManager = newDaoManager(null);
	      Properties props = Resources.getResourceAsProperties("com/kdt/fsgt/properties/database.properties");
	     
	    } catch (Exception e) {
	      throw new RuntimeException("Description.  Cause: " + e, e);
	    }

	  }
	  */

	  public static DaoManager getDaoManager() {
	    return daoManager;
	  }

	  public static DaoManager newDaoManager(Properties props) {
	    try {
	      Reader reader = Resources.getResourceAsReader(resource);
	      return DaoManagerBuilder.buildDaoManager(reader, props);
	    } catch (Exception e) {
	      throw new RuntimeException("Could not initialize DaoConfig.  Cause: " + e, e);
	    }
	  }

}

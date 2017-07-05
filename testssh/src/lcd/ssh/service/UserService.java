package lcd.ssh.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import lcd.ssh.dao.BaseDao;
import lcd.ssh.pojo.User;

@Service
public class UserService {
    @Resource
    private BaseDao<User> dao;

    public User findUserByUidAndPwd(String uid, String password) {  
        return dao.get(" from User u where u.uid = ? and u.password = ? ", new Object[] { uid, password });  
    }  
}

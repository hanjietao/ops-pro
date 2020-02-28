package com.pepper.project.sm.user.service;

import com.pepper.common.utils.security.ShiroUtils;
import com.pepper.common.utils.text.Convert;
import com.pepper.project.sm.user.domain.ClientUser;
import com.pepper.project.sm.user.mapper.ClientUserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClientUserServiceImpl implements IClientUserService {

    @Autowired
    private ClientUserMapper clientUserDao;


    @Override
    public List<ClientUser> selectClientUserList(ClientUser clientUser) {
        List<ClientUser> list = clientUserDao.selectClientUserList(clientUser);
        return list;
    }

    @Override
    public int insertClientUser(ClientUser clientUser) {
        clientUser.setCreateBy(ShiroUtils.getLoginName());
        clientUser.setUpdateBy(ShiroUtils.getLoginName());
        return clientUserDao.insertClientUser(clientUser);
    }

    @Override
    public int deleteClientUserByIds(String ids) {
        return clientUserDao.deleteClientUserByIds(Convert.toStrArray(ids));
    }

    @Override
    public ClientUser selectClientUserById(Long id) {
        return clientUserDao.selectClientUserById(id);
    }

    @Override
    public int updateClientUser(ClientUser clientUser) {
        clientUser.setUpdateBy(ShiroUtils.getLoginName());
        return clientUserDao.updateClientUser(clientUser);
    }
}

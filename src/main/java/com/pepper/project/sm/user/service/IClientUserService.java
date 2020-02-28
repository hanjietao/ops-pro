package com.pepper.project.sm.user.service;


import com.pepper.project.sm.user.domain.ClientUser;

import java.util.List;

public interface IClientUserService {

    List<ClientUser> selectClientUserList(ClientUser activity);
    int insertClientUser(ClientUser clientUser);

    int deleteClientUserByIds(String ids);

    ClientUser selectClientUserById(Long userId);

    int updateClientUser(ClientUser activity);

}

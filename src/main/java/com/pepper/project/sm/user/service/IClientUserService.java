package com.pepper.project.sm.user.service;


import com.pepper.project.sm.user.domain.ClientUser;

import java.util.List;

public interface IClientUserService {

    List<ClientUser> selectClientUserList(ClientUser clientUser);
    int insertClientUser(ClientUser clientUser);

    int deleteClientUserByIds(String ids);

    ClientUser selectClientUserById(Long userId);

    int updateClientUser(ClientUser clientUser);

    int addClientUserPoint(ClientUser clientUser);
    int deductClientUserPoint(ClientUser clientUser);
}

package com.pepper.project.sm.user.mapper;

import com.pepper.project.sm.user.domain.ClientUser;

import java.util.List;

public interface ClientUserMapper {
    public int updateClientUser(ClientUser clientUser);

    public int deleteClientUserByIds(String[] toStrArray);

    public ClientUser selectClientUserById(Long id);

    public int insertClientUser(ClientUser clientUser);

    public List<ClientUser> selectClientUserList(ClientUser clientUser);
}

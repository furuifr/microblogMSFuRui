package com.info_system.service;

import com.info_system.dao.MessageDao;
import com.info_system.entity.Follow;
import com.info_system.entity.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MessageService {
    @Autowired
    private MessageDao messageDao;

    public List<Message> listMessage(int userId) {
        System.out.println("listMessage in MessageService");
        return messageDao.listMessage(userId);
    }
    public void addMessage(Message message) {
        System.out.println("addMessage in MessageService");
        messageDao.addMessage(message);
    }

}

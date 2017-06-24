package com.zeeb.repository;

import com.zeeb.model.MessageEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by cain on 2017/6/24.
 */
@Repository
public interface MessageRepository extends JpaRepository<MessageEntity, Integer> {


}
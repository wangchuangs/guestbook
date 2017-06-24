package com.zeeb.repository;

import com.zeeb.model.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by cain on 17/6/24.
 */
public interface UserRepository extends JpaRepository<UserEntity,Integer> {

}

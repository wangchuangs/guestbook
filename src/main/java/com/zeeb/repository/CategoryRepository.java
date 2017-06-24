package com.zeeb.repository;

import com.zeeb.model.CategoryEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by cain on 17/6/24.
 */
@Repository
public interface CategoryRepository extends JpaRepository<CategoryEntity, Integer> {

}
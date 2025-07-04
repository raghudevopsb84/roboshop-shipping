package com.instana.robotshop.shipping;

import java.util.List;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.jpa.repository.Query;

public interface CityRepository extends CrudRepository<City, Long> {
    @Cacheable("cities")
    List<City> findByCode(String code);

    @Cacheable("matches")
    @Query(
        value = "select c from City c where c.code = ?1 and c.city like ?2%"
    )
    List<City> match(String code, String text);

    @Cacheable("city")
    City findById(long id);
}

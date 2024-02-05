package com.park.utmstack.repository.incident_response;

import com.park.utmstack.domain.incident_response.UtmIncidentAction;
import com.park.utmstack.domain.incident_response.UtmIncidentVariable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;


/**
 * Spring Data  repository for the UtmIncidentAction entity.
 */
@SuppressWarnings("unused")
@Repository
public interface UtmIncidentVariableRepository extends JpaRepository<UtmIncidentVariable, Long>, JpaSpecificationExecutor<UtmIncidentVariable> {

}

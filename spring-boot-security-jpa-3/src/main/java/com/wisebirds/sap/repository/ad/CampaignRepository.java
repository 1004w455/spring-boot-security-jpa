package com.wisebirds.sap.repository.ad;



import org.springframework.data.jpa.repository.JpaRepository;

import com.wisebirds.sap.domain.ad.AdCampaign;



public interface CampaignRepository extends JpaRepository<AdCampaign, Long>{
}

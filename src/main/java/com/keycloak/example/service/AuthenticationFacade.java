package com.keycloak.example.service;

import org.keycloak.representations.AccessToken;
import org.springframework.security.core.Authentication;

public interface AuthenticationFacade {

	Authentication getAuthentication();
	
	AccessToken getAccessToken();
}

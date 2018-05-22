package com.keycloak.example.controller;

import org.keycloak.representations.AccessToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.keycloak.example.service.AuthenticationFacade;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;

@RestController
@RequestMapping(path = "/api/user")
@Api(value = "/api/user", description = "this endoint allows get user information")
public class UserController {

	@Autowired
	private AuthenticationFacade auth;

	@ApiOperation(value = "Get user access token", notes = "Get user access token", response = AccessToken.class, responseContainer = "AccessToken")
	@ApiResponses(value = { @ApiResponse(code = 200, message = "200"),
			@ApiResponse(code = 400, message = "400"),
			@ApiResponse(code = 500, message = "500") })
	@RequestMapping(path = "/", method = RequestMethod.GET, produces = {
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<AccessToken> getAccessToken() {

		return ResponseEntity.ok(auth.getAccessToken());
	}

}
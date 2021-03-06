package com.wisebirds.sap.service.account;

import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.wisebirds.sap.domain.account.Account;
import com.wisebirds.sap.domain.form.AccountCreateForm;
import com.wisebirds.sap.domain.form.AccountDeleteForm;

public interface AccountUserService {

	Optional<Account> getByEmail(String email);

	ModelAndView create(AccountCreateForm form);

	ModelAndView update(AccountCreateForm form);

	String delete(HttpServletRequest request, AccountDeleteForm form);

	String getUserList(HttpServletRequest request);

	ModelAndView accountList(HttpServletRequest request);

}

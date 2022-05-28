package com.Security;

import java.io.IOException;
import java.util.Base64;
import java.util.Collection;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

@WebFilter("/*")
public class AuthHeader extends HttpFilter implements Filter {

	private static final long serialVersionUID = 1L;

	public AuthHeader() {
		super();
	}

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		HttpServletResponse httpServletResponse = (HttpServletResponse) response;
		Cookie[] cookies = httpServletRequest.getCookies();
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				Cookie cookie = cookies[i];
				cookie.setSecure(true);
				cookie.setHttpOnly(true);
				httpServletResponse.addCookie(cookie);
			}
		}
		addSrcToken((HttpServletResponse) response, (HttpServletRequest) request);
		addCSRFToken((HttpServletResponse) response, (HttpServletRequest) request);
		HttpSession session = ((HttpServletRequest) request).getSession();
		String token = (String) session.getAttribute("src_token");
		addSameSiteAttribute((HttpServletResponse) response); // add SameSite=strict cookie attribute
		((HttpServletResponse) response).addHeader("X-Frame-Options", "DENY");
		((HttpServletResponse) response).addHeader("Content-Security-Policy",
				"object-src 'self'; "
				+ "frame-ancestors 'none'; "
				+ "script-src 'self' 'nonce-" + token
				+ "' https://cdn.jsdelivr.net/emojione/2.2.7/lib/js/emojione.min.js https://embed.tawk.to/ https://cdn.jsdelivr.net");
		((HttpServletResponse) response).addHeader("X-Content-Type-Options", "nosniff");
		chain.doFilter(request, response);

	}

	private void addSrcToken(HttpServletResponse response, HttpServletRequest request) {
		String getPath = request.getServletPath();
		if (!getPath.contains("css") && !getPath.contains("js") && !getPath.contains(".")) {
			HttpSession session = request.getSession();
			SecureRandom secureRandom;
			try {
				secureRandom = SecureRandom.getInstance("SHA1PRNG");
				byte[] data = new byte[16];
				secureRandom.nextBytes(data);
				session.setAttribute("src_token", Base64.getEncoder().encodeToString(data));
			} catch (NoSuchAlgorithmException e1) {
				e1.printStackTrace();
			}
		}
	}

	private void addSameSiteAttribute(HttpServletResponse response) {
		Collection<String> headers = response.getHeaders("Set-Cookie");
		boolean firstHeader = true;
		for (String header : headers) {
			if (firstHeader) {
				response.setHeader("Set-Cookie", String.format("%s; %s", header, "SameSite=Strict"));
				firstHeader = false;
				continue;
			}
			response.addHeader("Set-Cookie", String.format("%s; %s", header, "SameSite=Strict"));
		}
	}

	public void addCSRFToken(HttpServletResponse response, HttpServletRequest request) {
		String getPath = request.getServletPath();
		if (!getPath.contains("css") && !getPath.contains("js") && !getPath.contains(".")) {
			HttpSession session = request.getSession();
			String csrf = (String) session.getAttribute("new_csrf");
			session.setAttribute("csrf", csrf);
			SecureRandom secureRandom;
			try {
				secureRandom = SecureRandom.getInstance("SHA1PRNG");
				byte[] data = new byte[16];
				secureRandom.nextBytes(data);
				session.setAttribute("new_csrf", Base64.getEncoder().encodeToString(data));
			} catch (NoSuchAlgorithmException e1) {
				e1.printStackTrace();
			}
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}

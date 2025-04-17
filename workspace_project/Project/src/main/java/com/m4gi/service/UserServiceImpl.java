package com.m4gi.service;

import com.m4gi.domain.Products;
import com.m4gi.domain.User;
import com.m4gi.dto.SiteUser;
import com.m4gi.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService{

    @Autowired
    private UserMapper userMapper;

    /**
     * 회원가입 기능: SiteUser → User 변환 후 DB 저장
     */
    public void register(SiteUser siteUser) {
        User user = new User();

        // 기본 정보
        user.setUsername(siteUser.getUsername());
        user.setUserPw(siteUser.getPassword());
        user.setNickname(siteUser.getNickname());
        user.setEmail(siteUser.getEmail());

        // 연락처 조합
        String phone = siteUser.getPhone1() + "-" + siteUser.getPhone2() + "-" + siteUser.getPhone3();
        user.setPhone(phone);

        // 사업자등록번호 조합
        String bizNum = siteUser.getBizNum1() + "-" + siteUser.getBizNum2() + "-" + siteUser.getBizNum3();
        user.setBregNum(bizNum);

        // 대표 전화 조합
        String companyPhone = siteUser.getCompanyPhone1() + "-" + siteUser.getCompanyPhone2() + "-" + siteUser.getCompanyPhone3();
        user.setCompanyPhone(companyPhone);

        // 회사 정보
        user.setCompanyName(siteUser.getCompanyName());
        user.setMasterName(siteUser.getCeoName());
        user.setCompanyAddr(siteUser.getAddress() + " " + siteUser.getAddressDetail());
        user.setProductCategory(siteUser.getCategory());
        userMapper.insertUser(user);
        System.out.println("✅ 회원가입 성공! DB 저장 완료됨!");
    }

    // 로그인 로직
    public boolean login(String username, String password) {
        User user = userMapper.checkUsername(username);
        return user != null && password.equals(user.getUserPw());
    }

	@Override
	public int isDuplicateUsername(String username) {
		return userMapper.isDuplicateUsername(username);
	}

    @Override
    public User checkUsername(String username) {
        return userMapper.checkUsername(username);
    }

    @Override
    public User findByEmail(String email) { return userMapper.findByEmail(email); }

    @Override
    public int isExistEmail(String email) { return userMapper.isExistEmail(email); }

    @Override
    public List<Products> getProductsByUser(User user) {
        return userMapper.showProductList(user);
    }
}


    
    // 마이페이지에 정보 가져오기
    User getUserById(int UserId);
    
    // 마이페이지에서 사용자 정보 수정하기
    int updateUserInfo(User user);

    int updatePassword(@Param("username") String username, @Param("newPassword") String newPassword);

    int insertProduct(Products product);

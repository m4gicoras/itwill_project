
    
    // 마이페이지에 정보 가져오기
    public User getUserById(int user_id);
    
    // 마이페이지에서 사용자 정보 수정하기 : 성공 혹은 실패(0) 
    public boolean updateUserInfo(User user);


    public boolean resetPassword(String username, String password);

    public int insertProduct(Products product);



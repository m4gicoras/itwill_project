
    
    @Override
    public User getUserById(int user_id) {
    	System.out.println("★★★★★★★userid:" + user_id);
    	User user = userMapper.getUserById(user_id);
    	System.out.println("★★★★★★★user:" + user);
    	
    	if (user != null) {
    	    String category = user.getProductCategory();

    	    if (category != null) {
    	        String categoryName;

    	        switch (category) {
    	            case "digital":
    	                categoryName = "가전/디지털";
    	                break;
    	            case "fashion":
    	                categoryName = "패션";
    	                break;
    	            case "food":
    	                categoryName = "식품";
    	                break;
    	            case "etc":
    	                categoryName = "기타";
    	                break;
    	            default:
    	                categoryName = category;
    	        }

    	        user.setProductCategory(categoryName);
    	    } else {
    	        user.setProductCategory("미지정"); // 기본값 지정
    	    }
    	}
    	
    	return user;
    }
    
    @Override
    public boolean updateUserInfo(User user) {
    	return userMapper.updateUserInfo(user) > 0;


    @Override
    public boolean resetPassword(String username, String password) {
        return userMapper.updatePassword(username, password) == 1;
    }

    @Override
    public int insertProduct(Products product) {
        return userMapper.insertProduct(product);


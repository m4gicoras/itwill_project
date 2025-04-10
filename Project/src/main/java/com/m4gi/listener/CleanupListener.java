package com.m4gi.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import com.mysql.cj.jdbc.AbandonedConnectionCleanupThread;

public class CleanupListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        // 초기화 시 할 작업 없음
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        AbandonedConnectionCleanupThread.checkedShutdown();
		System.out.println("✅ MySQL cleanup thread 종료 완료");
    }
}

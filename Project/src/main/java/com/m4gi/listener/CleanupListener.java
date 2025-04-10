package com.m4gi.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import com.mysql.cj.jdbc.AbandonedConnectionCleanupThread;

/*
 * 톰캣(WAS) 메모리 누수 처리.
 * sqlConnect가 8.0.33버전이라 try-catch처리 안했어요(throw안해서 필요없음)
 *  */
public class CleanupListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        AbandonedConnectionCleanupThread.checkedShutdown();
        System.out.println("MySQL cleanup thread 종료 완료");
    }

}

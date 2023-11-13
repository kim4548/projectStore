package com.projectStore.store.dao;


import com.projectStore.store.domain.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.security.Principal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

@Repository
public class UserDaoImpl implements UserDao {
    @Autowired
    DataSource ds;


    @Override
    public int insertUser(User user) throws Exception {
        int rowCnt = 0;
        String sql = "INSERT INTO springbasic.user values (?, ?, ?, ?, ?, ?)";
        try
                (
                        Connection conn = ds.getConnection();
                        PreparedStatement pstmt = conn.prepareStatement(sql);

                ) {
            pstmt.setString(1, user.getId());
            pstmt.setString(2, user.getPwd());
            pstmt.setString(3, user.getEmail());
            pstmt.setString(4, user.getName());
            pstmt.setString(5, user.getPhoneNum());
            pstmt.setString(6, user.getSsn());
            return pstmt.executeUpdate();

        }


    }

    @Override
    public int updateUser(User user) throws Exception {
        int rowCnt = 0;
        String sql = "update springbaic.user" +
                "set pwd =? , email=? , name = ? , phoneNum=? , ssn=?" +
                "where id= ? ";
        try (
                Connection conn = ds.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);
        ) {
            pstmt.setString(1, user.getPwd());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getName());
            pstmt.setString(4, user.getPhoneNum());
            pstmt.setString(5, user.getSsn());
            rowCnt = pstmt.executeUpdate();
        }
        return rowCnt;
    }

    @Override
    public int deleteUser(String id) throws Exception {
        int rowCnt = 0;
        String sql = "DELETE FROM springbasic.user WHERE id=? ";
        try (
                Connection conn = ds.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);
        ) {
            pstmt.setString(1, id);
            return pstmt.executeUpdate();
        }
    }

    @Override
    public User selectUser(String id) throws Exception {
        User user = null;
        String sql = "SELECT * FROM springbasic.user WHERE id=?";

        try (
                Connection conn = ds.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);
        ) {
            pstmt.setString(1, id);

            try (ResultSet set = pstmt.executeQuery()) {
                if (set.next()) {
                    user = new User();
                    user.setId(set.getString("id")); // 열 인덱스 대신 컬럼 이름 사용
                    user.setPwd(set.getString("pwd"));
                    user.setName(set.getString("name"));
                    user.setEmail(set.getString("email"));
                    user.setPhoneNum(set.getString("phoneNum"));
                    user.setSsn(set.getString("ssn"));
                }
            }
        }

        return user;
    }

    @Override
    public int count() throws Exception {
        String sql = "SELECT count(*) FROM springbasic.user ";

        try
                (Connection conn = ds.getConnection();
                 PreparedStatement pstmt = conn.prepareStatement(sql);
                 ResultSet rs = pstmt.executeQuery();
                ) {
            rs.next();
            int result = rs.getInt(1);
            return result;
        }
    }

    @Override
    public void deleteAll() throws Exception {
        String sql = "DELETE FROM springbasic.user";
        try
                (Connection conn = ds.getConnection();
                 PreparedStatement pstmt = conn.prepareStatement(sql);
                ) {
            pstmt.executeUpdate();
        }


    }

    @Override
    public int idCheck(String id) throws Exception {
        String sql = "SELECT count(*) FROM springbasic.user WHERE id=?";

        try (
                Connection conn = ds.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);
        ) {
            pstmt.setString(1, id);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    int rowCnt= rs.getInt(1);
                    return rowCnt >0? 1: 0 ; // 아이디가 중복되면 1 , 아니면 0
                }
            }
        }

        return 0; // 에러가 발생하거나 결과가 없는 경우 0을 반환
    }
}


package com.projectStore.store.dao;

import com.projectStore.store.dto.CartDto;
import com.projectStore.store.dto.SellDto;
import org.springframework.beans.factory.annotation.Autowired;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class SellDaoImpl  implements  SellDao{
    @Autowired
    DataSource ds;
    @Autowired
    SellDto sellDto;

    @Override
    public int insertSell(CartDto cartDto) throws Exception {
        String sql = "INSERT INTO  springbasic.sell VALUES (?,?,?,?,?,?,now(),now());";
        int result = 0;
        try (
                Connection conn = ds.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);
        ) {
            pstmt.setInt(1, sellDto.getSellId());
            pstmt.setString(2, sellDto.getSellName());
            pstmt.setInt(3, sellDto.getSellPrice());
            pstmt.setInt(4, sellDto.getSellCount());
            pstmt.setString(5, sellDto.getSellIntro());
            pstmt.setString(6, sellDto.getSellContents());
          result=  pstmt.executeUpdate();
        }

        return result;

    }

    @Override
    public int deleteSell(String id) throws Exception {
        String sql = "DELETE FROM sell WHERE id=?;";
        int result = 0;
        try
                (
                        Connection conn = ds.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);
                        )
        {
            pstmt.setString(1,sellDto.getSellName());
        result= pstmt.executeUpdate();
        }
        return result;
    }

    @Override
    public SellDto selectSell(String id) throws Exception {
        String sql = "SELECT *FROM  springbasic.sell WHERE ID=?";

        try
                (Connection conn = ds.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);
                ) {
            pstmt.setString(1, sellDto.getSellName());
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    sellDto.setSellId(rs.getInt("sellId"));
                    sellDto.setSellName(rs.getString("sellName"));
                    sellDto.setSellPrice(rs.getInt("sellPrice"));
                    sellDto.setSellCount(rs.getInt("sellCount"));
                    sellDto.setSellIntro(rs.getString("sellIntro"));
                    sellDto.setSellContents(rs.getString("sellContents"));


                }
            }
        }
return sellDto;

    }

    @Override
    public int updateSell(String id) throws Exception {
        return 0;
    }
}

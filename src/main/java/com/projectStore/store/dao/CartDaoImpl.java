package com.projectStore.store.dao;

import com.projectStore.store.dto.CartDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


@Repository
public class CartDaoImpl implements CartDao {
    @Autowired
    DataSource ds;



    @Override
    public int insertCart(CartDto cartDto) {
        String sql = "INSERT INTO cart values (?,?,?,?,?,?,?)";
        int result = 0;

        try
                (Connection conn = ds.getConnection();
                 PreparedStatement pstmt = conn.prepareStatement(sql);
                ) {
            pstmt.setString(1, cartDto.getId());
            pstmt.setInt(2, cartDto.getSellId());
            pstmt.setInt(3, cartDto.getSellCount());
            pstmt.setString(4, cartDto.getSellName());
            pstmt.setInt(5, cartDto.getSellPrice());
            pstmt.setInt(6, cartDto.getTotalPrice());
            pstmt.setInt(7,cartDto.getCartId());
            result = pstmt.executeUpdate();

        }catch (Exception e){
            e.printStackTrace();
        }
        return result;

    }

    @Override
    public int deleteCart(CartDto cartDto) throws Exception {
        String sql = "DELETE FROM springbasic.cart WHERE id=? ";
        int result = 0;
        try
                (Connection conn = ds.getConnection();
                 PreparedStatement pstmt = conn.prepareStatement(sql);
                ) {
            pstmt.setString(1, cartDto.getId());
            result = pstmt.executeUpdate();
        }
        return result;
    }

    @Override
    public int updateCart(CartDto cartDto) throws Exception {
        int rowCnt = 0;
        String sql = "UPDATE springbaic.cart SET sellId=? ,sellCount =? ,sellName=? , sellPrice=? ,salePrice=? ,totalPrice=? WHERE id=? ";
        try (
                Connection conn = ds.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);
        ) {
            pstmt.setInt(1, cartDto.getSellId());
            pstmt.setInt(2, cartDto.getSellCount());
            pstmt.setString(3, cartDto.getSellName());
            pstmt.setInt(4, cartDto.getSellPrice());
            pstmt.setInt(5, cartDto.getTotalPrice());
            rowCnt = pstmt.executeUpdate();
        }
        return rowCnt;
    }

    @Override
    public List<CartDto> getCart(String id) throws Exception {
      return null;
    }

    @Override
    public CartDto selectCart(String id) throws Exception {
        CartDto cartDto = null; // CartDto 객체를 null로 초기화

        String sql = "SELECT sellId, sellCount, sellName, sellPrice, totalPrice FROM springbasic.cart WHERE id = ?";

        try (Connection conn = ds.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, id); // 매개변수로 받은 id를 사용하여 PreparedStatement에 값 설정

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    cartDto = new CartDto(); // 새로운 CartDto 객체 생성
                    cartDto.setId(id); // CartDto 객체에 id 설정
                    cartDto.setSellId(rs.getInt("sellId"));
                    cartDto.setSellCount(rs.getInt("sellCount"));
                    cartDto.setSellName(rs.getString("sellName"));
                    cartDto.setSellPrice(rs.getInt("sellPrice"));
                    cartDto.setTotalPrice(rs.getInt("totalPrice"));
                }
            }
        }

        return cartDto;
    }

    @Override
    public int count() throws Exception {
        String sql = "SELECT count(*) FROM springbasic.cart ";

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
}

package models;

import config.Koneksi;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {

    /* =========================================================
       1. Ambil SEMUA pesanan (untuk halaman index admin)
       ========================================================= */
    public List<Order> getAllOrders() {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT * FROM orders ORDER BY created_at DESC";

        try (
            Connection con = Koneksi.configDB();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery()
        ) {
            while (rs.next()) {
                Order o = new Order();
                o.setId(rs.getInt("id"));
                o.setCustomerName(rs.getString("customer_name"));
                o.setTotalAmount(rs.getLong("total_amount"));
                o.setPaymentMethod(rs.getString("payment_method"));
                o.setStatus(rs.getString("status"));
                o.setCreatedAt(rs.getTimestamp("created_at"));

                list.add(o);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    /* =========================================================
       2. Ambil SATU pesanan + DETAIL ITEM (halaman detail admin)
       ========================================================= */
    public Order getOrderById(int id) {
        Order o = null;

        String sqlOrder   = "SELECT * FROM orders WHERE id = ?";
        String sqlDetails = "SELECT * FROM order_details WHERE order_id = ?";

        try (Connection con = Koneksi.configDB()) {

            // Ambil data order utama
            try (PreparedStatement psOrder = con.prepareStatement(sqlOrder)) {
                psOrder.setInt(1, id);

                try (ResultSet rsOrder = psOrder.executeQuery()) {
                    if (rsOrder.next()) {
                        o = new Order();
                        o.setId(rsOrder.getInt("id"));
                        o.setCustomerName(rsOrder.getString("customer_name"));
                        o.setCustomerPhone(rsOrder.getString("customer_phone"));
                        o.setCustomerAddress(rsOrder.getString("customer_address"));
                        o.setNotes(rsOrder.getString("notes"));
                        o.setPaymentMethod(rsOrder.getString("payment_method"));
                        o.setSubtotal(rsOrder.getLong("subtotal"));
                        o.setPpnAmount(rsOrder.getLong("ppn_amount"));
                        o.setShippingFee(rsOrder.getLong("shipping_fee"));
                        o.setTotalAmount(rsOrder.getLong("total_amount"));
                        o.setPaymentProofPath(rsOrder.getString("payment_proof_path"));
                        o.setStatus(rsOrder.getString("status"));
                        o.setCreatedAt(rsOrder.getTimestamp("created_at"));

                        // Ambil detail item
                        List<OrderDetail> details = new ArrayList<>();

                        try (PreparedStatement psDetails = con.prepareStatement(sqlDetails)) {
                            psDetails.setInt(1, id);

                            try (ResultSet rsDetails = psDetails.executeQuery()) {
                                while (rsDetails.next()) {
                                    OrderDetail od = new OrderDetail();
                                    od.setProductName(rsDetails.getString("product_name"));
                                    od.setQuantity(rsDetails.getInt("quantity"));
                                    od.setPricePerUnit(rsDetails.getLong("price_per_unit"));
                                    od.setTotalPrice(rsDetails.getLong("total_price"));

                                    details.add(od);
                                }
                            }
                        }

                        o.setDetails(details);
                    }
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return o;
    }

    /* =========================================================
       3. Update status pesanan (admin)
       ========================================================= */
    public boolean updateStatus(int id, String status) {
        String sql = "UPDATE orders SET status = ? WHERE id = ?";

        try (
            Connection con = Koneksi.configDB();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {
            ps.setString(1, status);
            ps.setInt(2, id);

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /* =========================================================
       4. Ambil 5 pesanan terbaru user (notifikasi navbar)
       ========================================================= */
    public List<Order> getLatestOrdersByUserId(long userId) {
        List<Order> list = new ArrayList<>();

        String sql = """
            SELECT id, status, created_at
            FROM orders
            WHERE user_id = ?
            ORDER BY created_at DESC
            LIMIT 5
        """;

        try (
            Connection con = Koneksi.configDB();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {
            ps.setLong(1, userId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Order o = new Order();
                    o.setId(rs.getInt("id"));
                    o.setStatus(rs.getString("status"));
                    o.setCreatedAt(rs.getTimestamp("created_at"));

                    list.add(o);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
}

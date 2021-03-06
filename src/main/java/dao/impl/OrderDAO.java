package dao.impl;

import dao.IOrderDAO;
import mapper.OrderMapper;
import model.Order;
import model.Product;

import java.util.List;

public class OrderDAO extends AbstractDAO<Order> implements IOrderDAO {
    @Override
    public Integer save(Order order) {
        String sql = "INSERT INTO orders (customer_id, order_date) VALUES (?, ?)";
        Integer orderId = insert(sql, order.getCustomerId(), order.getOrderDate());
        String orderDetailSql = "INSERT INTO order_details (product_id, order_id, quantity, price) VALUES (?, ?, ?, ?)";
        for (Product product: order.getOrderList()) {
            insert(orderDetailSql, product.getId(), orderId, product.getQuantity(), product.getPrice());
        }
        return orderId;
    }

    @Override
    public List<Order> findAllByCustomerId(Integer customerId) {
        String sql = "SELECT * FROM orders WHERE customer_id = ?";
        return query(sql, new OrderMapper(), customerId);
    }

    @Override
    public Order findOne(Integer orderId) {
        String sql = "SELECT * FROM orders WHERE id = ?";
        List<Order> list = query(sql, new OrderMapper(), orderId);
        return list.isEmpty() ? null : list.get(0);
    }

    public Integer save(Order order, String username) {
        String sql = "INSERT INTO orders (customer_id, order_date) VALUES (?, ?)";
        Integer orderId = insert(sql, order.getCustomerId(), order.getOrderDate());
        String orderDetailSql = "INSERT INTO order_detail (product_id, username, price, quantity) VALUES (?, ?, ?, ?)";
        for (Product product: order.getOrderList()) {
            insert(orderDetailSql, product.getId(), orderId, product.getQuantity(), product.getPrice());
        }
        return orderId;
    }
}

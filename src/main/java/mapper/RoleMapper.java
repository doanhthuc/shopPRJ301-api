package mapper;

import model.Role;

import java.sql.ResultSet;
import java.sql.SQLException;

public class RoleMapper implements RowMapper<Role> {
    @Override
    public Role mapRow(ResultSet resultSet) {
        try {
            Role role = new Role();
            role.setId(resultSet.getInt("id"));
            role.setName(resultSet.getString("name"));
            return role;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}

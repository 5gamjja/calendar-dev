package com.mycompany.myapp.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.mycompany.myapp.domain.UserRole;

@Repository("userRole")
public class UserRoleDaoJdbc implements UserRoleDao {
	private JdbcTemplate jdbcTemplate;

	private RowMapper<UserRole> userRoleMapper = new RowMapper<UserRole>() {
		public UserRole mapRow(ResultSet rs, int rowNum) throws SQLException {
			UserRole userRole = new UserRole();
			userRole.setId(rs.getInt("id"));
			userRole.setUserId(rs.getString("user_id"));
			userRole.setRole(rs.getString("role"));
			return userRole;
		}
	};

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public void add(UserRole userRole) {
		this.jdbcTemplate.update("insert into user_roles(email, role) "
				+ "values(?,?)", userRole.getUserId(), userRole.getRole());
	}

	@Override
	public void update(UserRole userRole) {
		this.jdbcTemplate.update(
				"update user_roles set role = ? where email = ? ",
				userRole.getRole(), userRole.getUserId());
	}

	public UserRole get(String userId) {
		return this.jdbcTemplate.queryForObject(
				"select * from user_roles where email = ?",
				new Object[] { userId }, this.userRoleMapper);
	}
}
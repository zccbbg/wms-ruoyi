package com.cyl.demo.pojo.example;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.time.LocalDate;
import java.time.LocalDateTime;

public class TaskExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public TaskExample() {
        oredCriteria = new ArrayList<>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        protected void addCriterionForJDBCDate(String condition, Date value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value.getTime()), property);
        }

        protected void addCriterionForJDBCDate(String condition, List<Date> values, String property) {
            if (values == null || values.size() == 0) {
                throw new RuntimeException("Value list for " + property + " cannot be null or empty");
            }
            List<java.sql.Date> dateList = new ArrayList<>();
            Iterator<Date> iter = values.iterator();
            while (iter.hasNext()) {
                dateList.add(new java.sql.Date(iter.next().getTime()));
            }
            addCriterion(condition, dateList, property);
        }

        protected void addCriterionForJDBCDate(String condition, Date value1, Date value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value1.getTime()), new java.sql.Date(value2.getTime()), property);
        }
        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Long value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Long value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Long value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Long value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Long value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Long value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }
        public Criteria andIdIn(List<Long> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Long> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Long value1, Long value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Long value1, Long value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }
        public Criteria andTaskNoIsNull() {
            addCriterion("task_no is null");
            return (Criteria) this;
        }

        public Criteria andTaskNoIsNotNull() {
            addCriterion("task_no is not null");
            return (Criteria) this;
        }

        public Criteria andTaskNoEqualTo(String value) {
            addCriterion("task_no =", value, "taskNo");
            return (Criteria) this;
        }

        public Criteria andTaskNoNotEqualTo(String value) {
            addCriterion("task_no <>", value, "taskNo");
            return (Criteria) this;
        }

        public Criteria andTaskNoGreaterThan(String value) {
            addCriterion("task_no >", value, "taskNo");
            return (Criteria) this;
        }

        public Criteria andTaskNoGreaterThanOrEqualTo(String value) {
            addCriterion("task_no >=", value, "taskNo");
            return (Criteria) this;
        }

        public Criteria andTaskNoLessThan(String value) {
            addCriterion("task_no <", value, "taskNo");
            return (Criteria) this;
        }

        public Criteria andTaskNoLessThanOrEqualTo(String value) {
            addCriterion("task_no <=", value, "taskNo");
            return (Criteria) this;
        }

        public Criteria andTaskNoLike(String value) {
            addCriterion("task_no  like", value, "taskNo");
            return (Criteria) this;
        }

        public Criteria andTaskNoNotLike(String value) {
            addCriterion("task_no  not like", value, "taskNo");
            return (Criteria) this;
        }

        public Criteria andTaskNoIn(List<String> values) {
            addCriterion("task_no in", values, "taskNo");
            return (Criteria) this;
        }

        public Criteria andTaskNoNotIn(List<String> values) {
            addCriterion("task_no not in", values, "taskNo");
            return (Criteria) this;
        }

        public Criteria andTaskNoBetween(String value1, String value2) {
            addCriterion("task_no between", value1, value2, "taskNo");
            return (Criteria) this;
        }

        public Criteria andTaskNoNotBetween(String value1, String value2) {
            addCriterion("task_no not between", value1, value2, "taskNo");
            return (Criteria) this;
        }
        public Criteria andTaskNameIsNull() {
            addCriterion("task_name is null");
            return (Criteria) this;
        }

        public Criteria andTaskNameIsNotNull() {
            addCriterion("task_name is not null");
            return (Criteria) this;
        }

        public Criteria andTaskNameEqualTo(String value) {
            addCriterion("task_name =", value, "taskName");
            return (Criteria) this;
        }

        public Criteria andTaskNameNotEqualTo(String value) {
            addCriterion("task_name <>", value, "taskName");
            return (Criteria) this;
        }

        public Criteria andTaskNameGreaterThan(String value) {
            addCriterion("task_name >", value, "taskName");
            return (Criteria) this;
        }

        public Criteria andTaskNameGreaterThanOrEqualTo(String value) {
            addCriterion("task_name >=", value, "taskName");
            return (Criteria) this;
        }

        public Criteria andTaskNameLessThan(String value) {
            addCriterion("task_name <", value, "taskName");
            return (Criteria) this;
        }

        public Criteria andTaskNameLessThanOrEqualTo(String value) {
            addCriterion("task_name <=", value, "taskName");
            return (Criteria) this;
        }

        public Criteria andTaskNameLike(String value) {
            addCriterion("task_name  like", value, "taskName");
            return (Criteria) this;
        }

        public Criteria andTaskNameNotLike(String value) {
            addCriterion("task_name  not like", value, "taskName");
            return (Criteria) this;
        }

        public Criteria andTaskNameIn(List<String> values) {
            addCriterion("task_name in", values, "taskName");
            return (Criteria) this;
        }

        public Criteria andTaskNameNotIn(List<String> values) {
            addCriterion("task_name not in", values, "taskName");
            return (Criteria) this;
        }

        public Criteria andTaskNameBetween(String value1, String value2) {
            addCriterion("task_name between", value1, value2, "taskName");
            return (Criteria) this;
        }

        public Criteria andTaskNameNotBetween(String value1, String value2) {
            addCriterion("task_name not between", value1, value2, "taskName");
            return (Criteria) this;
        }
        public Criteria andTaskAddressIsNull() {
            addCriterion("task_address is null");
            return (Criteria) this;
        }

        public Criteria andTaskAddressIsNotNull() {
            addCriterion("task_address is not null");
            return (Criteria) this;
        }

        public Criteria andTaskAddressEqualTo(String value) {
            addCriterion("task_address =", value, "taskAddress");
            return (Criteria) this;
        }

        public Criteria andTaskAddressNotEqualTo(String value) {
            addCriterion("task_address <>", value, "taskAddress");
            return (Criteria) this;
        }

        public Criteria andTaskAddressGreaterThan(String value) {
            addCriterion("task_address >", value, "taskAddress");
            return (Criteria) this;
        }

        public Criteria andTaskAddressGreaterThanOrEqualTo(String value) {
            addCriterion("task_address >=", value, "taskAddress");
            return (Criteria) this;
        }

        public Criteria andTaskAddressLessThan(String value) {
            addCriterion("task_address <", value, "taskAddress");
            return (Criteria) this;
        }

        public Criteria andTaskAddressLessThanOrEqualTo(String value) {
            addCriterion("task_address <=", value, "taskAddress");
            return (Criteria) this;
        }

        public Criteria andTaskAddressLike(String value) {
            addCriterion("task_address  like", value, "taskAddress");
            return (Criteria) this;
        }

        public Criteria andTaskAddressNotLike(String value) {
            addCriterion("task_address  not like", value, "taskAddress");
            return (Criteria) this;
        }

        public Criteria andTaskAddressIn(List<String> values) {
            addCriterion("task_address in", values, "taskAddress");
            return (Criteria) this;
        }

        public Criteria andTaskAddressNotIn(List<String> values) {
            addCriterion("task_address not in", values, "taskAddress");
            return (Criteria) this;
        }

        public Criteria andTaskAddressBetween(String value1, String value2) {
            addCriterion("task_address between", value1, value2, "taskAddress");
            return (Criteria) this;
        }

        public Criteria andTaskAddressNotBetween(String value1, String value2) {
            addCriterion("task_address not between", value1, value2, "taskAddress");
            return (Criteria) this;
        }
        public Criteria andIncidentTimeIsNull() {
            addCriterion("incident_time is null");
            return (Criteria) this;
        }

        public Criteria andIncidentTimeIsNotNull() {
            addCriterion("incident_time is not null");
            return (Criteria) this;
        }

        public Criteria andIncidentTimeEqualTo(LocalDateTime value) {
            addCriterion("incident_time =", value, "incidentTime");
            return (Criteria) this;
        }

        public Criteria andIncidentTimeNotEqualTo(LocalDateTime value) {
            addCriterion("incident_time <>", value, "incidentTime");
            return (Criteria) this;
        }

        public Criteria andIncidentTimeGreaterThan(LocalDateTime value) {
            addCriterion("incident_time >", value, "incidentTime");
            return (Criteria) this;
        }

        public Criteria andIncidentTimeGreaterThanOrEqualTo(LocalDateTime value) {
            addCriterion("incident_time >=", value, "incidentTime");
            return (Criteria) this;
        }

        public Criteria andIncidentTimeLessThan(LocalDateTime value) {
            addCriterion("incident_time <", value, "incidentTime");
            return (Criteria) this;
        }

        public Criteria andIncidentTimeLessThanOrEqualTo(LocalDateTime value) {
            addCriterion("incident_time <=", value, "incidentTime");
            return (Criteria) this;
        }
        public Criteria andIncidentTimeIn(List<LocalDateTime> values) {
            addCriterion("incident_time in", values, "incidentTime");
            return (Criteria) this;
        }

        public Criteria andIncidentTimeNotIn(List<LocalDateTime> values) {
            addCriterion("incident_time not in", values, "incidentTime");
            return (Criteria) this;
        }

        public Criteria andIncidentTimeBetween(LocalDateTime value1, LocalDateTime value2) {
            addCriterion("incident_time between", value1, value2, "incidentTime");
            return (Criteria) this;
        }

        public Criteria andIncidentTimeNotBetween(LocalDateTime value1, LocalDateTime value2) {
            addCriterion("incident_time not between", value1, value2, "incidentTime");
            return (Criteria) this;
        }
        public Criteria andNumberOfCasesIsNull() {
            addCriterion("number_of_cases is null");
            return (Criteria) this;
        }

        public Criteria andNumberOfCasesIsNotNull() {
            addCriterion("number_of_cases is not null");
            return (Criteria) this;
        }

        public Criteria andNumberOfCasesEqualTo(Integer value) {
            addCriterion("number_of_cases =", value, "numberOfCases");
            return (Criteria) this;
        }

        public Criteria andNumberOfCasesNotEqualTo(Integer value) {
            addCriterion("number_of_cases <>", value, "numberOfCases");
            return (Criteria) this;
        }

        public Criteria andNumberOfCasesGreaterThan(Integer value) {
            addCriterion("number_of_cases >", value, "numberOfCases");
            return (Criteria) this;
        }

        public Criteria andNumberOfCasesGreaterThanOrEqualTo(Integer value) {
            addCriterion("number_of_cases >=", value, "numberOfCases");
            return (Criteria) this;
        }

        public Criteria andNumberOfCasesLessThan(Integer value) {
            addCriterion("number_of_cases <", value, "numberOfCases");
            return (Criteria) this;
        }

        public Criteria andNumberOfCasesLessThanOrEqualTo(Integer value) {
            addCriterion("number_of_cases <=", value, "numberOfCases");
            return (Criteria) this;
        }
        public Criteria andNumberOfCasesIn(List<Integer> values) {
            addCriterion("number_of_cases in", values, "numberOfCases");
            return (Criteria) this;
        }

        public Criteria andNumberOfCasesNotIn(List<Integer> values) {
            addCriterion("number_of_cases not in", values, "numberOfCases");
            return (Criteria) this;
        }

        public Criteria andNumberOfCasesBetween(Integer value1, Integer value2) {
            addCriterion("number_of_cases between", value1, value2, "numberOfCases");
            return (Criteria) this;
        }

        public Criteria andNumberOfCasesNotBetween(Integer value1, Integer value2) {
            addCriterion("number_of_cases not between", value1, value2, "numberOfCases");
            return (Criteria) this;
        }
        public Criteria andReceiveDepartmentIdIsNull() {
            addCriterion("receive_department_id is null");
            return (Criteria) this;
        }

        public Criteria andReceiveDepartmentIdIsNotNull() {
            addCriterion("receive_department_id is not null");
            return (Criteria) this;
        }

        public Criteria andReceiveDepartmentIdEqualTo(Long value) {
            addCriterion("receive_department_id =", value, "receiveDepartmentId");
            return (Criteria) this;
        }

        public Criteria andReceiveDepartmentIdNotEqualTo(Long value) {
            addCriterion("receive_department_id <>", value, "receiveDepartmentId");
            return (Criteria) this;
        }

        public Criteria andReceiveDepartmentIdGreaterThan(Long value) {
            addCriterion("receive_department_id >", value, "receiveDepartmentId");
            return (Criteria) this;
        }

        public Criteria andReceiveDepartmentIdGreaterThanOrEqualTo(Long value) {
            addCriterion("receive_department_id >=", value, "receiveDepartmentId");
            return (Criteria) this;
        }

        public Criteria andReceiveDepartmentIdLessThan(Long value) {
            addCriterion("receive_department_id <", value, "receiveDepartmentId");
            return (Criteria) this;
        }

        public Criteria andReceiveDepartmentIdLessThanOrEqualTo(Long value) {
            addCriterion("receive_department_id <=", value, "receiveDepartmentId");
            return (Criteria) this;
        }
        public Criteria andReceiveDepartmentIdIn(List<Long> values) {
            addCriterion("receive_department_id in", values, "receiveDepartmentId");
            return (Criteria) this;
        }

        public Criteria andReceiveDepartmentIdNotIn(List<Long> values) {
            addCriterion("receive_department_id not in", values, "receiveDepartmentId");
            return (Criteria) this;
        }

        public Criteria andReceiveDepartmentIdBetween(Long value1, Long value2) {
            addCriterion("receive_department_id between", value1, value2, "receiveDepartmentId");
            return (Criteria) this;
        }

        public Criteria andReceiveDepartmentIdNotBetween(Long value1, Long value2) {
            addCriterion("receive_department_id not between", value1, value2, "receiveDepartmentId");
            return (Criteria) this;
        }
        public Criteria andReportDepartmentIdIsNull() {
            addCriterion("report_department_id is null");
            return (Criteria) this;
        }

        public Criteria andReportDepartmentIdIsNotNull() {
            addCriterion("report_department_id is not null");
            return (Criteria) this;
        }

        public Criteria andReportDepartmentIdEqualTo(Long value) {
            addCriterion("report_department_id =", value, "reportDepartmentId");
            return (Criteria) this;
        }

        public Criteria andReportDepartmentIdNotEqualTo(Long value) {
            addCriterion("report_department_id <>", value, "reportDepartmentId");
            return (Criteria) this;
        }

        public Criteria andReportDepartmentIdGreaterThan(Long value) {
            addCriterion("report_department_id >", value, "reportDepartmentId");
            return (Criteria) this;
        }

        public Criteria andReportDepartmentIdGreaterThanOrEqualTo(Long value) {
            addCriterion("report_department_id >=", value, "reportDepartmentId");
            return (Criteria) this;
        }

        public Criteria andReportDepartmentIdLessThan(Long value) {
            addCriterion("report_department_id <", value, "reportDepartmentId");
            return (Criteria) this;
        }

        public Criteria andReportDepartmentIdLessThanOrEqualTo(Long value) {
            addCriterion("report_department_id <=", value, "reportDepartmentId");
            return (Criteria) this;
        }
        public Criteria andReportDepartmentIdIn(List<Long> values) {
            addCriterion("report_department_id in", values, "reportDepartmentId");
            return (Criteria) this;
        }

        public Criteria andReportDepartmentIdNotIn(List<Long> values) {
            addCriterion("report_department_id not in", values, "reportDepartmentId");
            return (Criteria) this;
        }

        public Criteria andReportDepartmentIdBetween(Long value1, Long value2) {
            addCriterion("report_department_id between", value1, value2, "reportDepartmentId");
            return (Criteria) this;
        }

        public Criteria andReportDepartmentIdNotBetween(Long value1, Long value2) {
            addCriterion("report_department_id not between", value1, value2, "reportDepartmentId");
            return (Criteria) this;
        }
        public Criteria andReceiveUserIdIsNull() {
            addCriterion("receive_user_id is null");
            return (Criteria) this;
        }

        public Criteria andReceiveUserIdIsNotNull() {
            addCriterion("receive_user_id is not null");
            return (Criteria) this;
        }

        public Criteria andReceiveUserIdEqualTo(Long value) {
            addCriterion("receive_user_id =", value, "receiveUserId");
            return (Criteria) this;
        }

        public Criteria andReceiveUserIdNotEqualTo(Long value) {
            addCriterion("receive_user_id <>", value, "receiveUserId");
            return (Criteria) this;
        }

        public Criteria andReceiveUserIdGreaterThan(Long value) {
            addCriterion("receive_user_id >", value, "receiveUserId");
            return (Criteria) this;
        }

        public Criteria andReceiveUserIdGreaterThanOrEqualTo(Long value) {
            addCriterion("receive_user_id >=", value, "receiveUserId");
            return (Criteria) this;
        }

        public Criteria andReceiveUserIdLessThan(Long value) {
            addCriterion("receive_user_id <", value, "receiveUserId");
            return (Criteria) this;
        }

        public Criteria andReceiveUserIdLessThanOrEqualTo(Long value) {
            addCriterion("receive_user_id <=", value, "receiveUserId");
            return (Criteria) this;
        }
        public Criteria andReceiveUserIdIn(List<Long> values) {
            addCriterion("receive_user_id in", values, "receiveUserId");
            return (Criteria) this;
        }

        public Criteria andReceiveUserIdNotIn(List<Long> values) {
            addCriterion("receive_user_id not in", values, "receiveUserId");
            return (Criteria) this;
        }

        public Criteria andReceiveUserIdBetween(Long value1, Long value2) {
            addCriterion("receive_user_id between", value1, value2, "receiveUserId");
            return (Criteria) this;
        }

        public Criteria andReceiveUserIdNotBetween(Long value1, Long value2) {
            addCriterion("receive_user_id not between", value1, value2, "receiveUserId");
            return (Criteria) this;
        }
        public Criteria andReportUserIdIsNull() {
            addCriterion("report_user_id is null");
            return (Criteria) this;
        }

        public Criteria andReportUserIdIsNotNull() {
            addCriterion("report_user_id is not null");
            return (Criteria) this;
        }

        public Criteria andReportUserIdEqualTo(Long value) {
            addCriterion("report_user_id =", value, "reportUserId");
            return (Criteria) this;
        }

        public Criteria andReportUserIdNotEqualTo(Long value) {
            addCriterion("report_user_id <>", value, "reportUserId");
            return (Criteria) this;
        }

        public Criteria andReportUserIdGreaterThan(Long value) {
            addCriterion("report_user_id >", value, "reportUserId");
            return (Criteria) this;
        }

        public Criteria andReportUserIdGreaterThanOrEqualTo(Long value) {
            addCriterion("report_user_id >=", value, "reportUserId");
            return (Criteria) this;
        }

        public Criteria andReportUserIdLessThan(Long value) {
            addCriterion("report_user_id <", value, "reportUserId");
            return (Criteria) this;
        }

        public Criteria andReportUserIdLessThanOrEqualTo(Long value) {
            addCriterion("report_user_id <=", value, "reportUserId");
            return (Criteria) this;
        }
        public Criteria andReportUserIdIn(List<Long> values) {
            addCriterion("report_user_id in", values, "reportUserId");
            return (Criteria) this;
        }

        public Criteria andReportUserIdNotIn(List<Long> values) {
            addCriterion("report_user_id not in", values, "reportUserId");
            return (Criteria) this;
        }

        public Criteria andReportUserIdBetween(Long value1, Long value2) {
            addCriterion("report_user_id between", value1, value2, "reportUserId");
            return (Criteria) this;
        }

        public Criteria andReportUserIdNotBetween(Long value1, Long value2) {
            addCriterion("report_user_id not between", value1, value2, "reportUserId");
            return (Criteria) this;
        }
        public Criteria andTaskSourceIsNull() {
            addCriterion("task_source is null");
            return (Criteria) this;
        }

        public Criteria andTaskSourceIsNotNull() {
            addCriterion("task_source is not null");
            return (Criteria) this;
        }

        public Criteria andTaskSourceEqualTo(Integer value) {
            addCriterion("task_source =", value, "taskSource");
            return (Criteria) this;
        }

        public Criteria andTaskSourceNotEqualTo(Integer value) {
            addCriterion("task_source <>", value, "taskSource");
            return (Criteria) this;
        }

        public Criteria andTaskSourceGreaterThan(Integer value) {
            addCriterion("task_source >", value, "taskSource");
            return (Criteria) this;
        }

        public Criteria andTaskSourceGreaterThanOrEqualTo(Integer value) {
            addCriterion("task_source >=", value, "taskSource");
            return (Criteria) this;
        }

        public Criteria andTaskSourceLessThan(Integer value) {
            addCriterion("task_source <", value, "taskSource");
            return (Criteria) this;
        }

        public Criteria andTaskSourceLessThanOrEqualTo(Integer value) {
            addCriterion("task_source <=", value, "taskSource");
            return (Criteria) this;
        }
        public Criteria andTaskSourceIn(List<Integer> values) {
            addCriterion("task_source in", values, "taskSource");
            return (Criteria) this;
        }

        public Criteria andTaskSourceNotIn(List<Integer> values) {
            addCriterion("task_source not in", values, "taskSource");
            return (Criteria) this;
        }

        public Criteria andTaskSourceBetween(Integer value1, Integer value2) {
            addCriterion("task_source between", value1, value2, "taskSource");
            return (Criteria) this;
        }

        public Criteria andTaskSourceNotBetween(Integer value1, Integer value2) {
            addCriterion("task_source not between", value1, value2, "taskSource");
            return (Criteria) this;
        }
        public Criteria andPhoneIsNull() {
            addCriterion("phone is null");
            return (Criteria) this;
        }

        public Criteria andPhoneIsNotNull() {
            addCriterion("phone is not null");
            return (Criteria) this;
        }

        public Criteria andPhoneEqualTo(String value) {
            addCriterion("phone =", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneNotEqualTo(String value) {
            addCriterion("phone <>", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneGreaterThan(String value) {
            addCriterion("phone >", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneGreaterThanOrEqualTo(String value) {
            addCriterion("phone >=", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneLessThan(String value) {
            addCriterion("phone <", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneLessThanOrEqualTo(String value) {
            addCriterion("phone <=", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneLike(String value) {
            addCriterion("phone  like", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneNotLike(String value) {
            addCriterion("phone  not like", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneIn(List<String> values) {
            addCriterion("phone in", values, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneNotIn(List<String> values) {
            addCriterion("phone not in", values, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneBetween(String value1, String value2) {
            addCriterion("phone between", value1, value2, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneNotBetween(String value1, String value2) {
            addCriterion("phone not between", value1, value2, "phone");
            return (Criteria) this;
        }
        public Criteria andReceiveTimeIsNull() {
            addCriterion("receive_time is null");
            return (Criteria) this;
        }

        public Criteria andReceiveTimeIsNotNull() {
            addCriterion("receive_time is not null");
            return (Criteria) this;
        }

        public Criteria andReceiveTimeEqualTo(LocalDateTime value) {
            addCriterion("receive_time =", value, "receiveTime");
            return (Criteria) this;
        }

        public Criteria andReceiveTimeNotEqualTo(LocalDateTime value) {
            addCriterion("receive_time <>", value, "receiveTime");
            return (Criteria) this;
        }

        public Criteria andReceiveTimeGreaterThan(LocalDateTime value) {
            addCriterion("receive_time >", value, "receiveTime");
            return (Criteria) this;
        }

        public Criteria andReceiveTimeGreaterThanOrEqualTo(LocalDateTime value) {
            addCriterion("receive_time >=", value, "receiveTime");
            return (Criteria) this;
        }

        public Criteria andReceiveTimeLessThan(LocalDateTime value) {
            addCriterion("receive_time <", value, "receiveTime");
            return (Criteria) this;
        }

        public Criteria andReceiveTimeLessThanOrEqualTo(LocalDateTime value) {
            addCriterion("receive_time <=", value, "receiveTime");
            return (Criteria) this;
        }
        public Criteria andReceiveTimeIn(List<LocalDateTime> values) {
            addCriterion("receive_time in", values, "receiveTime");
            return (Criteria) this;
        }

        public Criteria andReceiveTimeNotIn(List<LocalDateTime> values) {
            addCriterion("receive_time not in", values, "receiveTime");
            return (Criteria) this;
        }

        public Criteria andReceiveTimeBetween(LocalDateTime value1, LocalDateTime value2) {
            addCriterion("receive_time between", value1, value2, "receiveTime");
            return (Criteria) this;
        }

        public Criteria andReceiveTimeNotBetween(LocalDateTime value1, LocalDateTime value2) {
            addCriterion("receive_time not between", value1, value2, "receiveTime");
            return (Criteria) this;
        }
        public Criteria andRemarkIsNull() {
            addCriterion("remark is null");
            return (Criteria) this;
        }

        public Criteria andRemarkIsNotNull() {
            addCriterion("remark is not null");
            return (Criteria) this;
        }

        public Criteria andRemarkEqualTo(String value) {
            addCriterion("remark =", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkNotEqualTo(String value) {
            addCriterion("remark <>", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkGreaterThan(String value) {
            addCriterion("remark >", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkGreaterThanOrEqualTo(String value) {
            addCriterion("remark >=", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkLessThan(String value) {
            addCriterion("remark <", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkLessThanOrEqualTo(String value) {
            addCriterion("remark <=", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkLike(String value) {
            addCriterion("remark  like", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkNotLike(String value) {
            addCriterion("remark  not like", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkIn(List<String> values) {
            addCriterion("remark in", values, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkNotIn(List<String> values) {
            addCriterion("remark not in", values, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkBetween(String value1, String value2) {
            addCriterion("remark between", value1, value2, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkNotBetween(String value1, String value2) {
            addCriterion("remark not between", value1, value2, "remark");
            return (Criteria) this;
        }
        public Criteria andTaskStatusIsNull() {
            addCriterion("task_status is null");
            return (Criteria) this;
        }

        public Criteria andTaskStatusIsNotNull() {
            addCriterion("task_status is not null");
            return (Criteria) this;
        }

        public Criteria andTaskStatusEqualTo(Integer value) {
            addCriterion("task_status =", value, "taskStatus");
            return (Criteria) this;
        }

        public Criteria andTaskStatusNotEqualTo(Integer value) {
            addCriterion("task_status <>", value, "taskStatus");
            return (Criteria) this;
        }

        public Criteria andTaskStatusGreaterThan(Integer value) {
            addCriterion("task_status >", value, "taskStatus");
            return (Criteria) this;
        }

        public Criteria andTaskStatusGreaterThanOrEqualTo(Integer value) {
            addCriterion("task_status >=", value, "taskStatus");
            return (Criteria) this;
        }

        public Criteria andTaskStatusLessThan(Integer value) {
            addCriterion("task_status <", value, "taskStatus");
            return (Criteria) this;
        }

        public Criteria andTaskStatusLessThanOrEqualTo(Integer value) {
            addCriterion("task_status <=", value, "taskStatus");
            return (Criteria) this;
        }
        public Criteria andTaskStatusIn(List<Integer> values) {
            addCriterion("task_status in", values, "taskStatus");
            return (Criteria) this;
        }

        public Criteria andTaskStatusNotIn(List<Integer> values) {
            addCriterion("task_status not in", values, "taskStatus");
            return (Criteria) this;
        }

        public Criteria andTaskStatusBetween(Integer value1, Integer value2) {
            addCriterion("task_status between", value1, value2, "taskStatus");
            return (Criteria) this;
        }

        public Criteria andTaskStatusNotBetween(Integer value1, Integer value2) {
            addCriterion("task_status not between", value1, value2, "taskStatus");
            return (Criteria) this;
        }
        public Criteria andNatureOfEventIsNull() {
            addCriterion("nature_of_event is null");
            return (Criteria) this;
        }

        public Criteria andNatureOfEventIsNotNull() {
            addCriterion("nature_of_event is not null");
            return (Criteria) this;
        }

        public Criteria andNatureOfEventEqualTo(Integer value) {
            addCriterion("nature_of_event =", value, "natureOfEvent");
            return (Criteria) this;
        }

        public Criteria andNatureOfEventNotEqualTo(Integer value) {
            addCriterion("nature_of_event <>", value, "natureOfEvent");
            return (Criteria) this;
        }

        public Criteria andNatureOfEventGreaterThan(Integer value) {
            addCriterion("nature_of_event >", value, "natureOfEvent");
            return (Criteria) this;
        }

        public Criteria andNatureOfEventGreaterThanOrEqualTo(Integer value) {
            addCriterion("nature_of_event >=", value, "natureOfEvent");
            return (Criteria) this;
        }

        public Criteria andNatureOfEventLessThan(Integer value) {
            addCriterion("nature_of_event <", value, "natureOfEvent");
            return (Criteria) this;
        }

        public Criteria andNatureOfEventLessThanOrEqualTo(Integer value) {
            addCriterion("nature_of_event <=", value, "natureOfEvent");
            return (Criteria) this;
        }
        public Criteria andNatureOfEventIn(List<Integer> values) {
            addCriterion("nature_of_event in", values, "natureOfEvent");
            return (Criteria) this;
        }

        public Criteria andNatureOfEventNotIn(List<Integer> values) {
            addCriterion("nature_of_event not in", values, "natureOfEvent");
            return (Criteria) this;
        }

        public Criteria andNatureOfEventBetween(Integer value1, Integer value2) {
            addCriterion("nature_of_event between", value1, value2, "natureOfEvent");
            return (Criteria) this;
        }

        public Criteria andNatureOfEventNotBetween(Integer value1, Integer value2) {
            addCriterion("nature_of_event not between", value1, value2, "natureOfEvent");
            return (Criteria) this;
        }
        public Criteria andTaskTypeIsNull() {
            addCriterion("task_type is null");
            return (Criteria) this;
        }

        public Criteria andTaskTypeIsNotNull() {
            addCriterion("task_type is not null");
            return (Criteria) this;
        }

        public Criteria andTaskTypeEqualTo(Integer value) {
            addCriterion("task_type =", value, "taskType");
            return (Criteria) this;
        }

        public Criteria andTaskTypeNotEqualTo(Integer value) {
            addCriterion("task_type <>", value, "taskType");
            return (Criteria) this;
        }

        public Criteria andTaskTypeGreaterThan(Integer value) {
            addCriterion("task_type >", value, "taskType");
            return (Criteria) this;
        }

        public Criteria andTaskTypeGreaterThanOrEqualTo(Integer value) {
            addCriterion("task_type >=", value, "taskType");
            return (Criteria) this;
        }

        public Criteria andTaskTypeLessThan(Integer value) {
            addCriterion("task_type <", value, "taskType");
            return (Criteria) this;
        }

        public Criteria andTaskTypeLessThanOrEqualTo(Integer value) {
            addCriterion("task_type <=", value, "taskType");
            return (Criteria) this;
        }
        public Criteria andTaskTypeIn(List<Integer> values) {
            addCriterion("task_type in", values, "taskType");
            return (Criteria) this;
        }

        public Criteria andTaskTypeNotIn(List<Integer> values) {
            addCriterion("task_type not in", values, "taskType");
            return (Criteria) this;
        }

        public Criteria andTaskTypeBetween(Integer value1, Integer value2) {
            addCriterion("task_type between", value1, value2, "taskType");
            return (Criteria) this;
        }

        public Criteria andTaskTypeNotBetween(Integer value1, Integer value2) {
            addCriterion("task_type not between", value1, value2, "taskType");
            return (Criteria) this;
        }
        public Criteria andIncidentPlaceIsNull() {
            addCriterion("incident_place is null");
            return (Criteria) this;
        }

        public Criteria andIncidentPlaceIsNotNull() {
            addCriterion("incident_place is not null");
            return (Criteria) this;
        }

        public Criteria andIncidentPlaceEqualTo(Integer value) {
            addCriterion("incident_place =", value, "incidentPlace");
            return (Criteria) this;
        }

        public Criteria andIncidentPlaceNotEqualTo(Integer value) {
            addCriterion("incident_place <>", value, "incidentPlace");
            return (Criteria) this;
        }

        public Criteria andIncidentPlaceGreaterThan(Integer value) {
            addCriterion("incident_place >", value, "incidentPlace");
            return (Criteria) this;
        }

        public Criteria andIncidentPlaceGreaterThanOrEqualTo(Integer value) {
            addCriterion("incident_place >=", value, "incidentPlace");
            return (Criteria) this;
        }

        public Criteria andIncidentPlaceLessThan(Integer value) {
            addCriterion("incident_place <", value, "incidentPlace");
            return (Criteria) this;
        }

        public Criteria andIncidentPlaceLessThanOrEqualTo(Integer value) {
            addCriterion("incident_place <=", value, "incidentPlace");
            return (Criteria) this;
        }
        public Criteria andIncidentPlaceIn(List<Integer> values) {
            addCriterion("incident_place in", values, "incidentPlace");
            return (Criteria) this;
        }

        public Criteria andIncidentPlaceNotIn(List<Integer> values) {
            addCriterion("incident_place not in", values, "incidentPlace");
            return (Criteria) this;
        }

        public Criteria andIncidentPlaceBetween(Integer value1, Integer value2) {
            addCriterion("incident_place between", value1, value2, "incidentPlace");
            return (Criteria) this;
        }

        public Criteria andIncidentPlaceNotBetween(Integer value1, Integer value2) {
            addCriterion("incident_place not between", value1, value2, "incidentPlace");
            return (Criteria) this;
        }
        public Criteria andEventLevelIsNull() {
            addCriterion("event_level is null");
            return (Criteria) this;
        }

        public Criteria andEventLevelIsNotNull() {
            addCriterion("event_level is not null");
            return (Criteria) this;
        }

        public Criteria andEventLevelEqualTo(Integer value) {
            addCriterion("event_level =", value, "eventLevel");
            return (Criteria) this;
        }

        public Criteria andEventLevelNotEqualTo(Integer value) {
            addCriterion("event_level <>", value, "eventLevel");
            return (Criteria) this;
        }

        public Criteria andEventLevelGreaterThan(Integer value) {
            addCriterion("event_level >", value, "eventLevel");
            return (Criteria) this;
        }

        public Criteria andEventLevelGreaterThanOrEqualTo(Integer value) {
            addCriterion("event_level >=", value, "eventLevel");
            return (Criteria) this;
        }

        public Criteria andEventLevelLessThan(Integer value) {
            addCriterion("event_level <", value, "eventLevel");
            return (Criteria) this;
        }

        public Criteria andEventLevelLessThanOrEqualTo(Integer value) {
            addCriterion("event_level <=", value, "eventLevel");
            return (Criteria) this;
        }
        public Criteria andEventLevelIn(List<Integer> values) {
            addCriterion("event_level in", values, "eventLevel");
            return (Criteria) this;
        }

        public Criteria andEventLevelNotIn(List<Integer> values) {
            addCriterion("event_level not in", values, "eventLevel");
            return (Criteria) this;
        }

        public Criteria andEventLevelBetween(Integer value1, Integer value2) {
            addCriterion("event_level between", value1, value2, "eventLevel");
            return (Criteria) this;
        }

        public Criteria andEventLevelNotBetween(Integer value1, Integer value2) {
            addCriterion("event_level not between", value1, value2, "eventLevel");
            return (Criteria) this;
        }
        public Criteria andPublishTimeIsNull() {
            addCriterion("publish_time is null");
            return (Criteria) this;
        }

        public Criteria andPublishTimeIsNotNull() {
            addCriterion("publish_time is not null");
            return (Criteria) this;
        }

        public Criteria andPublishTimeEqualTo(LocalDateTime value) {
            addCriterion("publish_time =", value, "publishTime");
            return (Criteria) this;
        }

        public Criteria andPublishTimeNotEqualTo(LocalDateTime value) {
            addCriterion("publish_time <>", value, "publishTime");
            return (Criteria) this;
        }

        public Criteria andPublishTimeGreaterThan(LocalDateTime value) {
            addCriterion("publish_time >", value, "publishTime");
            return (Criteria) this;
        }

        public Criteria andPublishTimeGreaterThanOrEqualTo(LocalDateTime value) {
            addCriterion("publish_time >=", value, "publishTime");
            return (Criteria) this;
        }

        public Criteria andPublishTimeLessThan(LocalDateTime value) {
            addCriterion("publish_time <", value, "publishTime");
            return (Criteria) this;
        }

        public Criteria andPublishTimeLessThanOrEqualTo(LocalDateTime value) {
            addCriterion("publish_time <=", value, "publishTime");
            return (Criteria) this;
        }
        public Criteria andPublishTimeIn(List<LocalDateTime> values) {
            addCriterion("publish_time in", values, "publishTime");
            return (Criteria) this;
        }

        public Criteria andPublishTimeNotIn(List<LocalDateTime> values) {
            addCriterion("publish_time not in", values, "publishTime");
            return (Criteria) this;
        }

        public Criteria andPublishTimeBetween(LocalDateTime value1, LocalDateTime value2) {
            addCriterion("publish_time between", value1, value2, "publishTime");
            return (Criteria) this;
        }

        public Criteria andPublishTimeNotBetween(LocalDateTime value1, LocalDateTime value2) {
            addCriterion("publish_time not between", value1, value2, "publishTime");
            return (Criteria) this;
        }
        public Criteria andDisabledIsNull() {
            addCriterion("disabled is null");
            return (Criteria) this;
        }

        public Criteria andDisabledIsNotNull() {
            addCriterion("disabled is not null");
            return (Criteria) this;
        }

        public Criteria andDisabledEqualTo(Integer value) {
            addCriterion("disabled =", value, "disabled");
            return (Criteria) this;
        }

        public Criteria andDisabledNotEqualTo(Integer value) {
            addCriterion("disabled <>", value, "disabled");
            return (Criteria) this;
        }

        public Criteria andDisabledGreaterThan(Integer value) {
            addCriterion("disabled >", value, "disabled");
            return (Criteria) this;
        }

        public Criteria andDisabledGreaterThanOrEqualTo(Integer value) {
            addCriterion("disabled >=", value, "disabled");
            return (Criteria) this;
        }

        public Criteria andDisabledLessThan(Integer value) {
            addCriterion("disabled <", value, "disabled");
            return (Criteria) this;
        }

        public Criteria andDisabledLessThanOrEqualTo(Integer value) {
            addCriterion("disabled <=", value, "disabled");
            return (Criteria) this;
        }
        public Criteria andDisabledIn(List<Integer> values) {
            addCriterion("disabled in", values, "disabled");
            return (Criteria) this;
        }

        public Criteria andDisabledNotIn(List<Integer> values) {
            addCriterion("disabled not in", values, "disabled");
            return (Criteria) this;
        }

        public Criteria andDisabledBetween(Integer value1, Integer value2) {
            addCriterion("disabled between", value1, value2, "disabled");
            return (Criteria) this;
        }

        public Criteria andDisabledNotBetween(Integer value1, Integer value2) {
            addCriterion("disabled not between", value1, value2, "disabled");
            return (Criteria) this;
        }
        public Criteria andCreateByIsNull() {
            addCriterion("create_by is null");
            return (Criteria) this;
        }

        public Criteria andCreateByIsNotNull() {
            addCriterion("create_by is not null");
            return (Criteria) this;
        }

        public Criteria andCreateByEqualTo(Long value) {
            addCriterion("create_by =", value, "createBy");
            return (Criteria) this;
        }

        public Criteria andCreateByNotEqualTo(Long value) {
            addCriterion("create_by <>", value, "createBy");
            return (Criteria) this;
        }

        public Criteria andCreateByGreaterThan(Long value) {
            addCriterion("create_by >", value, "createBy");
            return (Criteria) this;
        }

        public Criteria andCreateByGreaterThanOrEqualTo(Long value) {
            addCriterion("create_by >=", value, "createBy");
            return (Criteria) this;
        }

        public Criteria andCreateByLessThan(Long value) {
            addCriterion("create_by <", value, "createBy");
            return (Criteria) this;
        }

        public Criteria andCreateByLessThanOrEqualTo(Long value) {
            addCriterion("create_by <=", value, "createBy");
            return (Criteria) this;
        }
        public Criteria andCreateByIn(List<Long> values) {
            addCriterion("create_by in", values, "createBy");
            return (Criteria) this;
        }

        public Criteria andCreateByNotIn(List<Long> values) {
            addCriterion("create_by not in", values, "createBy");
            return (Criteria) this;
        }

        public Criteria andCreateByBetween(Long value1, Long value2) {
            addCriterion("create_by between", value1, value2, "createBy");
            return (Criteria) this;
        }

        public Criteria andCreateByNotBetween(Long value1, Long value2) {
            addCriterion("create_by not between", value1, value2, "createBy");
            return (Criteria) this;
        }
        public Criteria andCreateTimeIsNull() {
            addCriterion("create_time is null");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIsNotNull() {
            addCriterion("create_time is not null");
            return (Criteria) this;
        }

        public Criteria andCreateTimeEqualTo(LocalDateTime value) {
            addCriterion("create_time =", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotEqualTo(LocalDateTime value) {
            addCriterion("create_time <>", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeGreaterThan(LocalDateTime value) {
            addCriterion("create_time >", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeGreaterThanOrEqualTo(LocalDateTime value) {
            addCriterion("create_time >=", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeLessThan(LocalDateTime value) {
            addCriterion("create_time <", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeLessThanOrEqualTo(LocalDateTime value) {
            addCriterion("create_time <=", value, "createTime");
            return (Criteria) this;
        }
        public Criteria andCreateTimeIn(List<LocalDateTime> values) {
            addCriterion("create_time in", values, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotIn(List<LocalDateTime> values) {
            addCriterion("create_time not in", values, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeBetween(LocalDateTime value1, LocalDateTime value2) {
            addCriterion("create_time between", value1, value2, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotBetween(LocalDateTime value1, LocalDateTime value2) {
            addCriterion("create_time not between", value1, value2, "createTime");
            return (Criteria) this;
        }
        public Criteria andUpdateByIsNull() {
            addCriterion("update_by is null");
            return (Criteria) this;
        }

        public Criteria andUpdateByIsNotNull() {
            addCriterion("update_by is not null");
            return (Criteria) this;
        }

        public Criteria andUpdateByEqualTo(Long value) {
            addCriterion("update_by =", value, "updateBy");
            return (Criteria) this;
        }

        public Criteria andUpdateByNotEqualTo(Long value) {
            addCriterion("update_by <>", value, "updateBy");
            return (Criteria) this;
        }

        public Criteria andUpdateByGreaterThan(Long value) {
            addCriterion("update_by >", value, "updateBy");
            return (Criteria) this;
        }

        public Criteria andUpdateByGreaterThanOrEqualTo(Long value) {
            addCriterion("update_by >=", value, "updateBy");
            return (Criteria) this;
        }

        public Criteria andUpdateByLessThan(Long value) {
            addCriterion("update_by <", value, "updateBy");
            return (Criteria) this;
        }

        public Criteria andUpdateByLessThanOrEqualTo(Long value) {
            addCriterion("update_by <=", value, "updateBy");
            return (Criteria) this;
        }
        public Criteria andUpdateByIn(List<Long> values) {
            addCriterion("update_by in", values, "updateBy");
            return (Criteria) this;
        }

        public Criteria andUpdateByNotIn(List<Long> values) {
            addCriterion("update_by not in", values, "updateBy");
            return (Criteria) this;
        }

        public Criteria andUpdateByBetween(Long value1, Long value2) {
            addCriterion("update_by between", value1, value2, "updateBy");
            return (Criteria) this;
        }

        public Criteria andUpdateByNotBetween(Long value1, Long value2) {
            addCriterion("update_by not between", value1, value2, "updateBy");
            return (Criteria) this;
        }
        public Criteria andUpdateTimeIsNull() {
            addCriterion("update_time is null");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeIsNotNull() {
            addCriterion("update_time is not null");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeEqualTo(LocalDateTime value) {
            addCriterion("update_time =", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeNotEqualTo(LocalDateTime value) {
            addCriterion("update_time <>", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeGreaterThan(LocalDateTime value) {
            addCriterion("update_time >", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeGreaterThanOrEqualTo(LocalDateTime value) {
            addCriterion("update_time >=", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeLessThan(LocalDateTime value) {
            addCriterion("update_time <", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeLessThanOrEqualTo(LocalDateTime value) {
            addCriterion("update_time <=", value, "updateTime");
            return (Criteria) this;
        }
        public Criteria andUpdateTimeIn(List<LocalDateTime> values) {
            addCriterion("update_time in", values, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeNotIn(List<LocalDateTime> values) {
            addCriterion("update_time not in", values, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeBetween(LocalDateTime value1, LocalDateTime value2) {
            addCriterion("update_time between", value1, value2, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeNotBetween(LocalDateTime value1, LocalDateTime value2) {
            addCriterion("update_time not between", value1, value2, "updateTime");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {
        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}

package com.stomato.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stomato.dao.AppDao;
import com.stomato.domain.App;
import com.stomato.domain.BaseParam;

@Service
public class AppService {
	
	Logger logger = Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private AppDao appDao;
	
//	@Autowired
//	private ReportDao reportDao;
//	
//	@Autowired
//	private ReportManager<List<ReportResult>> reportManager;
	
	public int addApp(App app) {
		return appDao.addApp(app);
	}

	public App getApp(App app) {
		return appDao.getApp(app);
	}
	
	public int listTotal(App app){
		return appDao.listTotal(app);
	}
	public List<App> listApps(BaseParam baseParam){
		return appDao.listApps(baseParam);
	}
	public List<App> getAppList(int uid) {
		return appDao.getAppList(uid);
	}
	
	public List<App> getLastedAppList(int uid) {
		return appDao.getLastedAppList(uid);
	}
	
	public void updateApp(App app) {
		appDao.updateApp(app);
	}
	
	public void deleteApp(App app) {
		appDao.deleteApp(app);
	}
	
	public boolean checkAppPackage(App app) {
		return appDao.checkAppPackage(app) == 1;
	}
	
	/*
	public List<java.util.Map<String, Object>> getSummaryReport(int uid) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("uid", uid);
		param.put("idate", ReportUtils.getCurrentIDate());
		return reportDao.getSummaryReport(param);
	}
	
	public List<ReportResult> getReportData(ReportParam rptParam) {
		return 
		reportManager.generateReport(new ReportEvent<List<ReportResult>>() {
			@Override
			public List<ReportResult> lookup(ReportParam rptParam) {
				switch (rptParam.getReportType()) {
				case Hourly:
					return reportDao.getHourlyReport(rptParam);
				case Daliy:
				case Weekly:
					return reportDao.getDailyReport(rptParam);
				case Monthly:
					return reportDao.getMonthlyReport(rptParam);
				default:
					return null;
				}
			}
			
			@Override
			public List<ReportResult> injectDefaults(List<ReportResult> results, ReportParam param) {
				ReportResult result = null;
				int size = 0;
				Calendar cal = Calendar.getInstance();
				Calendar cal2 = Calendar.getInstance();
				List<ReportResult> reportResults = new ArrayList<ReportResult>();
				//long rawOffset = java.util.TimeZone.getDefault().getRawOffset();
				
				switch (param.getReportType()) {
				case Hourly:
					size = 24;
					cal.setTime(param.getStartDate());
					cal.set(Calendar.HOUR_OF_DAY, -1);
					for (int i=0; i<=size; i++) {
						cal.add(Calendar.HOUR_OF_DAY, 1);
						boolean foundit = false;
						for (int j=0, len=results.size(); j<len; j++) {
							result = results.get(j);
							cal2.setTimeInMillis(result.getIdate() * 1000L);
							if ((cal2.get(Calendar.HOUR_OF_DAY) == cal.get(Calendar.HOUR_OF_DAY)) && (cal2.get(Calendar.DAY_OF_MONTH) == cal.get(Calendar.DAY_OF_MONTH))) {
								result.setIdate(cal.getTimeInMillis());
								reportResults.add(result);
								results.remove(j);
								foundit = true;
								break;
							}
						}
						if (!foundit) {
							result = new ReportResult();
							result.setIdate(cal.getTimeInMillis());
							result.setValue(0);
							reportResults.add(result);
						}
					}
					break;
				case Daliy:
				case Weekly:
					size = (int)((param.getEndDate().getTime() - param.getStartDate().getTime()) / (24 * 60 * 60 * 1000l));
					cal.setTime(param.getStartDate());
					cal.add(Calendar.DAY_OF_MONTH, -1);
					for (int i=0; i<=size; i++) {
						cal.add(Calendar.DAY_OF_MONTH, 1);
						boolean foundit = false;
						for (int j=0, len=results.size(); j<len; j++) {
							result = results.get(j);
							cal2.setTimeInMillis(result.getIdate() * 1000L);
							if ((cal2.get(Calendar.DAY_OF_MONTH) == cal.get(Calendar.DAY_OF_MONTH)) && (cal2.get(Calendar.MONTH) == cal.get(Calendar.MONTH))) {
								result.setIdate(cal.getTimeInMillis());
								reportResults.add(result);
								results.remove(j);
								foundit = true;
								break;
							}
						}
						if (!foundit) {
							result = new ReportResult();
							result.setIdate(cal.getTimeInMillis());
							result.setValue(0);
							reportResults.add(result);
						}
					}
					break;
				case Monthly:
					Calendar startCal = Calendar.getInstance();
					Calendar endCal = Calendar.getInstance();
					startCal.setTime(param.getStartDate());
					endCal.setTime(param.getEndDate());
					size = (endCal.get(Calendar.YEAR) - startCal.get(Calendar.YEAR)) * 12 + endCal.get(Calendar.MONTH) - startCal.get(Calendar.MONTH);
					cal.setTime(param.getStartDate());
					cal.add(Calendar.MONTH, -1);
					for (int i=0; i<=size; i++) {
						cal.add(Calendar.MONTH, 1);
						boolean foundit = false;
						for (int j=0, len=results.size(); j<len; j++) {
							result = results.get(j);
							cal2.setTimeInMillis(result.getIdate() * 1000L);
							if ((cal2.get(Calendar.MONTH) == cal.get(Calendar.MONTH)) && (cal2.get(Calendar.YEAR) == cal.get(Calendar.YEAR))) {
								result.setIdate(cal.getTimeInMillis());
								reportResults.add(result);
								results.remove(j);
								foundit = true;
								break;
							}
						}
						if (!foundit) {
							result = new ReportResult();
							result.setIdate(cal.getTimeInMillis());
							result.setValue(0);
							reportResults.add(result);
						}
					}
					break;
				}
				
				return reportResults;
			}

		}, rptParam);
	}*/
}

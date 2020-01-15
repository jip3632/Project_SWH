package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.SearchDAO;
import beans.StoreDTO;

public class StoreListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		SearchDAO sdao = new SearchDAO();
		StoreDTO[] arr = null;
		
		double lati;
		double longi;
		// parameter 가져오기 (유저 위치정보)
		if (request.getParameter("lati") != null && request.getParameter("lati") != null) {
			lati = Double.parseDouble(request.getParameter("lati"));
			longi = Double.parseDouble(request.getParameter("longi"));
		} else {
			lati = 0; longi = 0;
		}
		
		try {
			arr = sdao.selectAllStores();
			if (!(lati == 0 && longi == 0)) {
				calcDistToStore(lati, longi, arr);
			}
			sortByDist(arr);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("storeList", arr);
	}
	
	// 현위치와 상점사이의 거리 계산해서 각각의 dto에 set
	private void calcDistToStore(double lati, double longi, StoreDTO[] arr) {
		int length = arr.length;
		for (int i = 0; i < length; i++) {
			double st_lati = Double.parseDouble(arr[i].getSt_latitude());
			double st_longi = Double.parseDouble(arr[i].getSt_longitude());
			double dist = haversine(lati, st_lati, longi, st_longi);
			dist = Math.round(dist * 100) / 100.0;
			arr[i].setSt_dist(dist);
		} // for end
	} // calcDistToStore end
	
	// 두 좌표사이의 거리 계산 (haversine 방법)
	private double haversine(double lati1, double lati2, double longi1, double longi2) { 
		double dist = 0;
		double dLati = Math.toRadians(lati2 - lati1);
		double dLongi = Math.toRadians(longi2 - longi1);
		lati1 = Math.toRadians(lati1);
		lati2 = Math.toRadians(lati2);
		
		double a = Math.pow(Math.sin(dLati/2), 2) + Math.pow(Math.sin(dLongi/2), 2) * Math.cos(lati1) * Math.cos(lati2);
		double c = 2 * Math.asin(Math.sqrt(a));
		dist = 6327.8 * c;
		
		return dist;
	}// harversine end
	
	// 거리순으로 내림차순 정렬 (bubble sort)
	private void sortByDist(StoreDTO[] arr) {
		StoreDTO temp = null;
		int length = arr.length;
		
		for (int i = 0; i < length; i++) {
			for (int j = 0; j < length - i - 1; j ++) {
				if (arr[j].getSt_dist() > arr[j + 1].getSt_dist()) {
					temp = arr[j];
					arr[j] = arr[j+1];
					arr[j+1] = temp;
				}
			}
		}//sort end
	}// sortByDist end
}// class end

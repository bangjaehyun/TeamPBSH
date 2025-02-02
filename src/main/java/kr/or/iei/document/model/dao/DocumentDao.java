package kr.or.iei.document.model.dao;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.or.iei.document.model.vo.Business;
import kr.or.iei.document.model.vo.Cooperate;
import kr.or.iei.document.model.vo.Document;
import kr.or.iei.document.model.vo.DocumentFile;
import kr.or.iei.document.model.vo.DocumentReference;
import kr.or.iei.document.model.vo.DocumentSelectDay;
import kr.or.iei.document.model.vo.DocumentSign;
import kr.or.iei.document.model.vo.DocumentType;
import kr.or.iei.document.model.vo.Estimate;
import kr.or.iei.document.model.vo.Spending;
import kr.or.iei.document.model.vo.VacationHalf;
import kr.or.iei.emp.model.vo.Alarm;
import kr.or.iei.emp.model.vo.Commute;
import kr.or.iei.emp.model.vo.DevelopPrice;
import kr.or.iei.emp.model.vo.Emp;

@Repository("documentDao")
public class DocumentDao {
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;


	public List<Document> apiDocumentList(String empCode) {
		
		return sqlSession.selectList("document.apiDocumentList",empCode);
	}

	public List<Emp> filterEmp(HashMap<String, String> srchMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("emp.filterEmp",srchMap);
	}


	//documentCode 생성
	public String selectDocumentCode() {
		// TODO Auto-generated method stub
		
		return sqlSession.selectOne("document.selectDocumentCode");
	}

	//공통 문서작성 부분
		public int insertDocument(Document document) {
			// TODO Auto-generated method stub
			return sqlSession.insert("document.insertDocument", document);
		}
		
		//반차 적용시
		public int insertVacationHalf(VacationHalf vacHalf) {
			// TODO Auto-generated method stub
			return sqlSession.insert("document.insertVacationHalf", vacHalf);
		}
		
		//연차적용시 
		public int insertVacationAnnual(DocumentSelectDay selDay) {
			// TODO Auto-generated method stub
			return sqlSession.insert("document.insertVacationAnnual", selDay);
		}

		public int insertFile(DocumentFile file) {
			// TODO Auto-generated method stub
			return sqlSession.insert("document.inserDocumentFile",file);
		}

		public int insertDocumentSign(DocumentSign sign) {
			// TODO Auto-generated method stub
			return sqlSession.insert("document.insertDocumentSign",sign);
		}

		public int insertDocumentRef(DocumentReference ref) {
			// TODO Auto-generated method stub
			return sqlSession.insert("document.insertDocumentRef", ref);
		}

	public Document viewDocOne(HashMap<String, Object> map) {
		
		return sqlSession.selectOne("document.viewDocOne",map);
	}


	public List<DocumentType> apiPageDocType(String empCode) {
		return sqlSession.selectList("document.apiPageDocType",empCode);
	}

	public int insertSpending(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert("document.insertSpending",map);
	}

	public String getSpendingCode() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("document.selectSpendingCode");

	}


	public List<DocumentFile> selectFileList(HashMap<String, Object> map) {
		return sqlSession.selectList("document.selectFileList",map);
	}

	public List<DocumentSign> selectSignList(HashMap<String, Object> map) {
		
		return sqlSession.selectList("document.viewSignList",map);
	}


	public List<Document> selectDocList(String type) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("document.selectDocList",type);
	}

	

	public List<DocumentType> selectDocType() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("document.selectDocType");
	}

	public List<DocumentSign> selectDocSign(String documentCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("document.selectSignList",documentCode);
	}


	public Document selectOneDoc(String documentCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("document.selectOneDoc", documentCode);
	}

	public List<Spending> selectOneDocSpending(String documentCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("document.selectOneDocSpending", documentCode);
	}

	public List<DocumentFile> selectOneDocFile(String documentCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("document.selectOneDocFile", documentCode);
	}

	public DocumentSelectDay selectAnnual(String documentCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("document.selectAnnual",documentCode);
	}

	public VacationHalf selectHalf(String documentCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("document.selectHalf", documentCode);
	}

	public int approveDoc(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return sqlSession.update("document.approveDoc", map);
	}

	
	public int useAnnual(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		
		return sqlSession.update("emp.useAnnual", map);
	}

	public int insertAttVacation(Commute commute) {
		// TODO Auto-generated method stub
		return sqlSession.insert("emp.insertAttVacation", commute);
	}

	public int insertAlarm(Alarm alarm) {
		// TODO Auto-generated method stub
		return sqlSession.insert("vote.insertAlarm", alarm);
		
	}

	public int useHalf(String writer) {
		// TODO Auto-generated method stub
		return sqlSession.update("emp.useHalf", writer);
	}

	public int insertAttHalf(Commute commute) {
		// TODO Auto-generated method stub
		return sqlSession.insert("emp.insertAttHalf", commute);
	}

	public double selectRemainRealVac(String empCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("emp.selectRemainRealVac", empCode);
	}

	public List<DocumentReference> selectRefList(String documentCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("document.selectRefList", documentCode);
	}

	public int insertBusiness(Business business) {
		// TODO Auto-generated method stub
		return sqlSession.insert("document.insertBusiness", business);
	}

	public Business selectOneBt(String documentCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("document.selectOneBt",documentCode);
	}

	public int insertAttBt(Commute commute) {
		// TODO Auto-generated method stub
		return sqlSession.insert("emp.insertAttBt", commute);
	}

	public List<DevelopPrice> selectPriceList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("emp.selectDevPrice");
	}

	public String getEstimateCode() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("document.selectEstimateCode");
	}

	public int insertEstimate(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert("document.insertEstimate", map);
	}

	public List<Estimate> selectOneEstimateList(String documentCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("document.selectEstimate", documentCode);
	}

	public int insertCooperate(Cooperate cooperate) {
		// TODO Auto-generated method stub
		return sqlSession.insert("document.insertCooperate",cooperate);
	}

	public List<Cooperate> selectCooperate(String documentCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("document.selectCoop",documentCode);
	}



	public int approveSpending(String documentCode) {
		// TODO Auto-generated method stub
		return sqlSession.update("document.approveSpending",documentCode);
	}

	public int insertSales(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert("document.insertSales", map);
	}

	


	

	

	

	

	

	

	
	



}

package com.green.repository;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.green.domain.Member;
import com.green.mapper.AnswerRowMapper;
import com.green.mapper.BlogRowMapper;
import com.green.mapper.QuestionRowMapper;

@Repository
public class SearchRepositoryImpl implements SearchRepository {

	private JdbcTemplate template;

	@Autowired
	public void setJdbctemplate(DataSource dataSource) {
		this.template = new JdbcTemplate(dataSource);
	}

	enum CodeType {
		chosung, jungsung, jongsung
	}

	String ignoreChars = "`1234567890-=[]\\;',./~!@#$%^&*()_+{}|:\"<>? ";

	/** * 영어를 한글로... */
	public String engToKor(String eng) {

		StringBuffer sb = new StringBuffer();
		int initialCode = 0, medialCode = 0, finalCode = 0;
		int tempMedialCode, tempFinalCode;
		for (int i = 0; i < eng.length(); i++) { // 숫자특수문자 처리
			if (ignoreChars.indexOf(eng.substring(i, i + 1)) > -1) {
				sb.append(eng.substring(i, i + 1));
				continue;
			}
			
			// 초성코드 추출
			if (eng.substring(i, i+1).matches("[rRseEfaqQtTdwWczxvg]")) {
				initialCode = getCode(CodeType.chosung, eng.substring(i, i + 1));
				i++; // 다음문자로
			} else {
				initialCode = getCode(CodeType.chosung, eng.substring(i, i + 1).toLowerCase());
				i++; // 다음문자로
			}
			
			// 자음이 없다면
			if (initialCode == -1) {
				initialCode = 11*21*28;
				i--;
			}

			// 중성코드 추출
			tempMedialCode = getDoubleMedial(i, eng); // 두 자로 이루어진 중성코드 추출

			if (tempMedialCode != -1) {
				medialCode = tempMedialCode;
				i+=2;
			} else { // 없다면,
				medialCode = getSingleMedial(i, eng); // 한 자로 이루어진 중성코드 추출
				i++;
			}
			
			//모음이 없다면
			if (medialCode == -1) {
				i-=2;
			}

			if (medialCode != -1) {
				// 종성코드 추출
				tempFinalCode = getDoubleFinal(i, eng); // 두 자로 이루어진 종성코드 추출

				if (tempFinalCode != -1) {
					finalCode = tempFinalCode; // 그 다음의 중성 문자에 대한 코드를 추출한다.
					tempMedialCode = getSingleMedial(i + 2, eng);

					if (tempMedialCode != -1) { // 코드 값이 있을 경우
						finalCode = getSingleFinal(i, eng); // 종성 코드 값을 저장한다.
					} else {
						i++;
					}
				} else { // 코드 값이 없을 경우 ,
					tempMedialCode = getSingleMedial(i + 1, eng); // 그 다음의 중성 문자에 대한 코드 추출.

					if (tempMedialCode != -1) { // 그 다음에 중성 문자가 존재할 경우,
						finalCode = 0; // 종성 문자는 없음.
						i--;
					} else {
						finalCode = getSingleFinal(i, eng); // 종성 문자 추출
						if (finalCode == -1) {
							finalCode = 0;
							i--;
							// 초성,중성 + 숫자,특수문자,
							// 기호가 나오는 경우 index를 줄임.
						}
					}
				}
			}
			// 추출한 초성 문자 코드,
			// 중성 문자 코드, 종성 문자 코드를 합한 후 변환하여 스트링버퍼에 넘김
			
			if (medialCode != -1) {
				sb.append((char) (0xAC00 + initialCode + medialCode + finalCode));
			} else {
				sb.append((char) (0xAC00 + initialCode));
			}
		}
		return sb.toString();
	}

	/**
	 * * 해당 문자에 따른 코드를 추출한다. * * @param type * 초성 : chosung, 중성 : jungsung, 종성 :
	 * jongsung 구분 * @param char 해당 문자
	 */
	private int getCode(CodeType type, String c) {
		// 초성
		String init = "rRseEfaqQtTdwWczxvg";
		// 중성
		String[] mid = { "k", "o", "i", "O", "j", "p", "u", "P", "h", "hk", "ho", "hl", "y", "n", "nj", "np", "nl", "b",
				"m", "ml", "l" };
		// 종성
		String[] fin = { "r", "R", "rt", "s", "sw", "sg", "e", "f", "fr", "fa", "fq", "ft", "fx", "fv", "fg", "a", "q",
				"qt", "t", "T", "d", "w", "c", "z", "x", "v", "g" };
		switch (type) {
		case chosung:
			int index = init.indexOf(c);
			if (index != -1) {
				return index * 21 * 28;
			}
			break;
		case jungsung:
			for (int i = 0; i < mid.length; i++) {
				if (mid[i].equals(c)) {
					return i * 28;
				} else if (mid[i].equals(c.toLowerCase())){
					return i * 28;
				}
			}
			break;
		case jongsung:
			for (int i = 0; i < fin.length; i++) {
				if (fin[i].equals(c)) {
					return i + 1;
				} else if (fin[i].equals(c.toLowerCase())){
					return i + 1;
				}
			}
			break;
		default:
			System.out.println("잘못된 타입입니다.");
		}
		return -1;
	}

	// 한 자로 된 중성값을 리턴한다
	// 인덱스를 벗어낫다면 -1을 리턴
	private int getSingleMedial(int i, String eng) {
		if ((i + 1) <= eng.length()) {
			return getCode(CodeType.jungsung, eng.substring(i, i + 1));
		} else {
			return -1;
		}
	}

	// 두 자로 된 중성을 체크하고, 있다면 값을 리턴한다.
	// 없으면 리턴값은 -1
	private int getDoubleMedial(int i, String eng) {
		int result;
		if ((i + 2) > eng.length()) {
			return -1;
		} else {
			result = getCode(CodeType.jungsung, eng.substring(i, i + 2));
			if (result != -1) {
				return result;
			} else {
				return -1;
			}
		}
	}

	// 한 자로된 종성값을 리턴한다
	// 인덱스를 벗어낫다면 -1을 리턴
	private int getSingleFinal(int i, String eng) {
		if ((i + 1) <= eng.length()) {
			return getCode(CodeType.jongsung, eng.substring(i, i + 1));
		} else {
			return -1;
		}
	}

	// 두 자로된 종성을 체크하고, 있다면 값을 리턴한다.
	// 없으면 리턴값은 -1
	private int getDoubleFinal(int i, String eng) {
		if ((i + 2) > eng.length()) {
			return -1;
		} else {
			return getCode(CodeType.jongsung, eng.substring(i, i + 2));
		}
	}

	@Override
	public List<Member> blog(String bloContent) {
		// TODO Auto-generated method stub

		List<Member> blogList = new ArrayList<Member>();

		String SQL = "select * from blog a join member b ON a.MEM_NO=b.MEM_NO WHERE BLO_CONTENT LIKE '%" + bloContent + "%' ORDER BY BLO_NO DESC";

		blogList = template.query(SQL, new BlogRowMapper());

		return blogList;
	}

	@Override
	public List<Member> blogIn(String bloIn) {
		// TODO Auto-generated method stub

		List<Member> blogList = new ArrayList<Member>();

		String SQL = "select * from blog a join member b ON a.MEM_NO=b.MEM_NO WHERE BLO_CONTENT LIKE '%" + bloIn
				+ "%' ORDER BY BLO_IN DESC";

		blogList = template.query(SQL, new BlogRowMapper());

		return blogList;
	}

	@Override
	public List<Member> blogTitle(String bloTitle) {
		// TODO Auto-generated method stub

		List<Member> blogList = new ArrayList<Member>();

		String SQL = "select * from blog a join member b ON a.MEM_NO=b.MEM_NO WHERE BLO_TITLE LIKE '%" + bloTitle
				+ "%' ORDER BY BLO_NO DESC";

		blogList = template.query(SQL, new BlogRowMapper());

		return blogList;
	}

	@Override
	public List<Member> blogContent(String bloContent) {
		// TODO Auto-generated method stub

		List<Member> blogList = new ArrayList<Member>();

		String SQL = "select * from blog a join member b ON a.MEM_NO=b.MEM_NO WHERE BLO_CONTENT LIKE '%" + bloContent
				+ "%' or BLO_TITLE LIKE '%" + bloContent + "%' ORDER BY BLO_NO DESC";

		blogList = template.query(SQL, new BlogRowMapper());

		return blogList;
	}

	@Override
	public List<Member> question(String queContent) {
		// TODO Auto-generated method stub

		List<Member> questionList = new ArrayList<Member>();

		String SQL = "select * from question a join member b ON a.MEM_NO=b.MEM_NO WHERE QUE_CONTENT LIKE '%"
				+ queContent + "%' ORDER BY QUE_NO DESC";

		questionList = template.query(SQL, new QuestionRowMapper());

		return questionList;
	}

	@Override
	public List<Member> questionIn(String queIn) {
		// TODO Auto-generated method stub

		List<Member> questionList = new ArrayList<Member>();

		String SQL = "select * from question a join member b ON a.MEM_NO=b.MEM_NO WHERE QUE_CONTENT LIKE '%" + queIn
				+ "%' ORDER BY QUE_IN DESC";

		questionList = template.query(SQL, new QuestionRowMapper());

		return questionList;
	}

	@Override
	public List<Member> questionTitle(String queTitle) {
		// TODO Auto-generated method stub

		List<Member> questionList = new ArrayList<Member>();

		String SQL = "select * from question a join member b ON a.MEM_NO=b.MEM_NO WHERE QUE_TITLE LIKE '%" + queTitle
				+ "%' ORDER BY QUE_NO DESC";

		questionList = template.query(SQL, new QuestionRowMapper());

		return questionList;
	}

	@Override
	public List<Member> questionContent(String queContent) {
		// TODO Auto-generated method stub

		List<Member> questionList = new ArrayList<Member>();

		String SQL = "select * from question a join member b ON a.MEM_NO=b.MEM_NO WHERE QUE_CONTENT LIKE '%"
				+ queContent + "%' or QUE_TITLE LIKE '%" + queContent + "%' ORDER BY QUE_NO DESC";

		questionList = template.query(SQL, new QuestionRowMapper());

		return questionList;
	}

	@Override
	public List<Member> answer(String ansContent) {
		// TODO Auto-generated method stub

		List<Member> answerList = new ArrayList<Member>();

		String SQL = "select * from answer a join member b ON a.MEM_NO=b.MEM_NO WHERE ANS_CONTENT LIKE '%" + ansContent
				+ "%' ORDER BY ANS_NO DESC";

		answerList = template.query(SQL, new AnswerRowMapper());

		return answerList;
	}

	@Override
	public List<Member> answerIn(String ansIn) {
		// TODO Auto-generated method stub

		List<Member> answerList = new ArrayList<Member>();

		String SQL = "select * from answer a join member b ON a.MEM_NO=b.MEM_NO WHERE ANS_CONTENT LIKE '%" + ansIn
				+ "%' ORDER BY ANS_IN DESC";

		answerList = template.query(SQL, new AnswerRowMapper());

		return answerList;
	}

	@Override
	public List<Member> answerTitle(String ansTitle) {
		// TODO Auto-generated method stub

		List<Member> answerList = new ArrayList<Member>();

		String SQL = "select * from answer a join member b ON a.MEM_NO=b.MEM_NO WHERE ANS_TITLE LIKE '%" + ansTitle
				+ "%' ORDER BY ANS_NO DESC";

		answerList = template.query(SQL, new AnswerRowMapper());

		return answerList;
	}

	@Override
	public List<Member> answerContent(String ansContent) {
		// TODO Auto-generated method stub

		List<Member> answerList = new ArrayList<Member>();

		String SQL = "select * from answer a join member b ON a.MEM_NO=b.MEM_NO WHERE ANS_CONTENT LIKE '%" + ansContent
				+ "%' or ANS_TITLE LIKE '%" + ansContent + "%' ORDER BY ANS_NO DESC";

		answerList = template.query(SQL, new AnswerRowMapper());

		return answerList;
	}
}

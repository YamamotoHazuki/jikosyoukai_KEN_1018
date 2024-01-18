package jp.ken.members.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import jp.ken.members.model.ListDataModel;
import jp.ken.members.model.MemberModel;

@Controller
public class MemberController {

	private List<ListDataModel> getNumberList(int start, int end){
		List<ListDataModel> numberList = new ArrayList<ListDataModel>();

		for(int i = start; i <= end; i++) {
			numberList.add(new ListDataModel(Integer.toString(i),Integer.toString(i)));
		}
		return numberList;
	}

	private Map<String, String> getMagazineMap(){
		Map<String, String> magazineMap = new LinkedHashMap<String, String>();
		magazineMap.put("made", "Javaって何ができちゃうの");
		magazineMap.put("worry", "Javaお悩み相談");
		magazineMap.put("technique", "Java裏ワザテク");
		magazineMap.put("case", "Springフレームワーク導入事例");
		magazineMap.put("strang", "Springフレームワークの七不思議");
		magazineMap.put("other", "その他のフレームワークについて");
		return magazineMap;
	}

	@RequestMapping(value = "/form",method = RequestMethod.GET)
	public String form(Model model) {
		MemberModel memberModel = new MemberModel();
		//yearsの初期値の設定
		//memberModel.setName("山本");
		memberModel.setBirthYear("2000");
		model.addAttribute("memberModel",memberModel);
		//カレンダーオブジェクトの取得
		//現在の日付を持ったCalendarオブジェクト
		Calendar calendar = Calendar.getInstance();
		//年、月、日のリストを生成してmodelオブジェクトに格納
		model.addAttribute("years",getNumberList(1900,calendar.get(Calendar.YEAR)));
		model.addAttribute("months",getNumberList(1,12));
		model.addAttribute("days",getNumberList(1,31));
		//メールマガジン項目をマップ形式で用意
		model.addAttribute("magazineMap",getMagazineMap());
		//JSPに転送
		return "memberRegistration";

	}

	@RequestMapping(value = "/form", method = RequestMethod.POST)
	//値の入ったMenberModelを引数として指定
	public String confirm(@ModelAttribute MemberModel memberModel,Model model) {
		//Genderでセットされている値を呼び出し
		String tmpGender = memberModel.getGender();
		//日本語で表示するためにmodelのなかにセットする
		if(tmpGender.equals("man")) {
			model.addAttribute("gender","男");
		}else {
			model.addAttribute("gender","女");
		}
		//メールマガジンの表示設定
		String mailMagazines = "";
		//メールマガジンの項目をマップ形式で用意
		Map<String, String> magazineMap = getMagazineMap();
		//選択されたチェックボックスから項目を取得して文字列連結
		for(String mailMagazine : memberModel.getMailMagazines()) {
			if(mailMagazines.length() > 0) {
				mailMagazines += "<br />";
			}
			mailMagazines += magazineMap.get(mailMagazine);
		}
		model.addAttribute("mailMagazines",mailMagazines);
		//備考(テキストエリア）の処理
		String comment = memberModel.getComment();
		//改行文字(\n)をbr要素に置き換え
		comment = comment.replaceAll("\n", "<br />");
		model.addAttribute("comment",comment);
		return "memberConfirm";

	}

}

package controller;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {

	@RequestMapping("/userHome")
	public String userHome(Principal principal) {

		System.out.println("in controller principle is " + principal);

		if (null == principal) {
			return "index";
		}
		return "userHome";
	}

	@RequestMapping(value = "/home")
	public String homee(Principal principal) {
		if (null == principal) {
			return "index";
		}
		return "userHome";
	}

	@RequestMapping(value = "/Main2")
	public String Main2(Principal principal) {
		if (null == principal) {
			return "index";
		}
		return "Main2";
	}

	@RequestMapping(value = "/audio")
	public String audio(Principal principal) {
		if (null == principal) {
			return "index";
		}
		return "audio";
	}

	@RequestMapping(value = "/text")
	public String text(Principal principal) {
		if (null == principal) {
			return "index";
		}
		return "text";
	}

	@RequestMapping(value = "/transliteration")
	public String transliteration(Principal principal) {
		if (null == principal) {
			return "index";
		}
		return "transliteration";
	}

	@RequestMapping(value = "/machTrans")
	public String machTrans(Principal principal) {
		if (null == principal) {
			return "index";
		}
		return "machTrans";
	}

	@RequestMapping(value = "/ocr")
	public String ocr(Principal principal) {
		if (null == principal) {
			return "index";
		}
		return "ocr";
	}

	@RequestMapping(value = "/speechToText")
	public String speechToText(Principal principal) {
		if (null == principal) {
			return "index";
		}
		return "speechToText";
	}

	@RequestMapping(value = "/speechTrans")
	public String speechTrans(Principal principal) {
		if (null == principal) {
			return "index";
		}
		return "speechTrans";
	}

	@RequestMapping(value = "/docTrans")
	public String docTrans(Principal principal) {
		if (null == principal) {
			return "index";
		}
		return "docTrans";
	}

	@RequestMapping(value = "/pdfToImg")
	public String pdfToImg(Principal principal) {
		if (null == principal) {
			return "index";
		}
		return "pdfToImg";
	}

	@RequestMapping(value = "/liveStreamingVoice")
	public String liveStreamingVoice(Principal p) {
		if (null == p) {
			return "index";
		}
		return "liveStreamingVoice";
	}

	@RequestMapping(value = "/imgsToPdf")
	public String imgsToPdf(Principal p) {
		if (null == p) {
			return "index";
		}
		return "imgsToPdf";
	}

	@RequestMapping(value = "/PdfMerger")
	public String PdfMerger(Principal p) {
		if (null == p) {
			return "index";
		}
		return "pdfMerger";
	}

	@RequestMapping(value = "/ilmDeskTest")
	public String ilmDeskTest() {
		return "ilmDeskTest";
	}

	@RequestMapping(value = "/chatBotQuery")
	public String chatBotQuery() {
		return "chatBotQuery";
	}
}

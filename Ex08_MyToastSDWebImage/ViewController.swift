/**
 Github 라이브러리 사용하기
Cocoa Pod 이용하기
 CLI(Command Line Interface) 방식 : 터미널 방식
 
 //Swift-Toast : 안드로이드 스ㅏ일의 토스트 팝업 구현
 SDWebImage : HTTP 통신으로 이미지를 다운로드하고, 이미지뷰에 이미지 로딩시켜줌, 캐시 지원
 
 깃허브 라이브러리(코코아팟) 이용순서
 0.기존 xcodeproj 프로젝트 닫기
1. 파인더에서 프로젝트 폴더 오른쪽 클릭해서 현재폴더에서 터미널 열기 실행
2. 코코아 팟 유틸 설치
  명령어 : sudo gem install cocoapods
   - cocoa pod 업데이트
    명령어 : pod repo update
 3.초기화
   명령어 : pod init
 4.라이브 러리 설치
   명령어 : pod install
 5.프로젝트 열기: 다시해야 함, 확장자 xcodeproj -> xcworkspace 열기
  - 워크스페이스 열기 : 더블클릭 하거나 터미널 open 프로젝트이름.xcworkspace
 6.Xcode에서 pod 파일을 편집하기(라이브러리 목록 기술)
 7. 터미널에서 pod install 한번 더 하기
 

 */

import UIKit
import Toast_Swift
import SDWebImage

class ViewController: UIViewController {

    @IBOutlet var img: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.makeToast("토스트 창입니다", duration: 5.0, position: .bottom)
        let url:URL = URL(string: "https://engproject-2d29e.firebaseapp.com/images/pic02.jpg")!
        self.img.sd_setImage(with: url, completed: {
            (img, error, cacheType, imageURL) in
            self.showAlert()
        })
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "알림화면", message: "이미지가 다운됐습니다.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: {
            (action) in
            print("확인 키가 눌렸습니다.")
        }))
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: {
            (action) in
            print("취소 키가 눌렸습니다.")
        }))
        self.present(alert, animated: true)
    }
}

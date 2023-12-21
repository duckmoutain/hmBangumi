import router from '@ohos.router';
import webview from '@ohos.web.webview';
import { CommonConstants } from '../constants/CommonConstants';

/**
 * User agreement page.
 */
@Entry
@Component
struct AgreementPage {
  webController: WebviewController = new webview.WebviewController();

  build() {
    Column() {
      this.Title()

      Image($r('app.media.ic_user_agreement'))
        .width($r('app.float.icon_length'))
        .height($r('app.float.icon_length'))
        .objectFit(ImageFit.Contain)
        .margin({
          top: $r('app.float.icon_margin_top'),
          bottom: $r('app.float.icon_margin_bottom')
        })
      Web({
        src: $rawfile('agreement.html'),
        controller: this.webController
      })
    }
  }

  @Builder Title() {
    Row() {
      Image($r('app.media.ic_back'))
        .width($r('app.float.image_size'))
        .height($r('app.float.image_size'))
        .margin({
          left: $r('app.float.image_margin_left'),
          right: $r('app.float.image_margin_right')
        })
        .onClick(() => {
          router.back();
        })
    }
    .width(CommonConstants.FULL_WIDTH_PERCENT)
    .height($r('app.float.title_height'))
  }
}
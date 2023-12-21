import router from '@ohos.router';
import { CommonConstants } from '../constants/CommonConstants';

/**
 * Privacy agreement and copyright statement page.
 */
@Component
export struct TechSupportComponent {
  build() {
    Column() {
      Row() {
        Text($r('app.string.user_protocol'))
          .fontSize($r('app.float.bottom_font_size'))
          .fontColor($r('app.color.text_link'))
          .onClick(() => this.openAgreementPage())
        Text($r('app.string.and'))
          .fontSize($r('app.float.bottom_font_size'))
          .fontColor($r('app.color.text_opacity'))
        Text($r('app.string.privacy_statement'))
          .fontSize($r('app.float.bottom_font_size'))
          .fontColor($r('app.color.text_link'))
          .onClick(() => this.openPrivacyPage())
      }

      Text($r('app.string.copyright'))
        .fontSize($r('app.float.bottom_font_size'))
        .fontColor($r('app.color.text_opacity'))
      Text($r('app.string.tech_support'))
        .fontSize($r('app.float.bottom_font_size'))
        .fontColor($r('app.color.text_opacity'))
    }
    .width(CommonConstants.TECH_COLUMN_WIDTH_PERCENT)
    .alignItems(HorizontalAlign.Center)
    .align(Alignment.Bottom)
    .margin({
      bottom: $r('app.float.bottom_padding_bottom'),
      top: $r('app.float.tech_support_margin_top')
    })
  }

  openAgreementPage(): void {
    router.pushUrl({
      url: CommonConstants.AGREEMENT_PAGE
    });
  }

  openPrivacyPage(): void {
    router.pushUrl({
      url: CommonConstants.PRIVACY_PAGE
    });
  }
}
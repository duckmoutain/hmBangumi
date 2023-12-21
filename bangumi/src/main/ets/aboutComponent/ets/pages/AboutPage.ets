import router from '@ohos.router';
import { TechSupportComponent } from '../view/TechSupportComponent';
import { AppInfoComponent } from '../view/AppInfoComponent';
import { LogoAndVersionComponent } from '../view/LogoAndVersionComponent';
import { CommonConstants } from '../constants/CommonConstants';
import AboutViewModel from '../viewmodel/AboutViewModel';

/**
 * This template implements the about function and contains three components.
 * The top is the LogoAndVersion component, the middle shows the relevant information of the application, and the
 * bottom is the privacy agreement and copyright statement.
 * Developers can enrich the application information and improve the relevant link information.
 */
@Entry
@Component
struct AboutPage {
  @State currentBreakPoint: string = CommonConstants.BREAK_POINT_SM;

  build() {
    Column() {
      this.Title()

      Scroll() {
        GridRow({
          columns: {
            sm: CommonConstants.GRID_ROW_SM,
            md: CommonConstants.GRID_ROW_MD,
            lg: CommonConstants.GRID_ROW_LG
          },
          gutter: { x: CommonConstants.GUTTER_X },
          breakpoints: { value: CommonConstants.BREAK_POINT }
        }) {
          GridCol({
            span: {
              sm: CommonConstants.SPAN_SM,
              md: CommonConstants.SPAN_MD,
              lg: CommonConstants.SPAN_LG
            },
            offset: {
              sm: CommonConstants.OFFSET_SM,
              md: CommonConstants.OFFSET_MD,
              lg: CommonConstants.OFFSET_LG
            }
          }) {
            Column() {
              Row() {
                LogoAndVersionComponent()
              }
              .layoutWeight(this.currentBreakPoint === CommonConstants.BREAK_POINT_LG ?
                CommonConstants.ROW_LG_WEIGHT : CommonConstants.ROW_WEIGHT)

              Flex({
                direction: FlexDirection.Column,
                justifyContent: FlexAlign.SpaceBetween
              }) {
                AppInfoComponent({
                  appInfoData: AboutViewModel.getAppInfo()
                })

                TechSupportComponent()
              }
              .layoutWeight(this.currentBreakPoint === CommonConstants.BREAK_POINT_LG ?
                CommonConstants.FLEX_LG_WEIGHT : CommonConstants.FLEX_WEIGHT)
            }
          }
        }
        .onBreakpointChange((point: string) => {
          this.currentBreakPoint = point;
        })
        .margin({
          left: $r('app.float.grid_row_margin_left'),
          right: $r('app.float.grid_row_margin_right')
        })
        .height(CommonConstants.SCROLL_HEIGHT_PERCENT)
        .constraintSize({ minHeight: $r('app.float.scroll_min_height') })
      }
      .scrollBar(BarState.Off)
      .layoutWeight(CommonConstants.SCROLL_WEIGHT)
    }
    .backgroundColor($r('app.color.page_background'))
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

      Text($r('app.string.title_name'))
        .fontSize($r('app.float.title_text_font_size'))
        .fontColor($r('app.color.title'))
        .fontWeight(CommonConstants.FONT_WEIGHT)
    }
    .width(CommonConstants.FULL_WIDTH_PERCENT)
    .height($r('app.float.title_height'))
  }
}
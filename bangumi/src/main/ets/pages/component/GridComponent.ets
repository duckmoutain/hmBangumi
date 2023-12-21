import { BreakPointType } from '../../common';
import router from '@ohos.router';
import { CommonConstants } from '../constants/CommonConstants';
import { myUserInfo } from '../../serve/serveutil';
import { collectionModel } from '../../viewmodel/subjectModel';

/**
 * Grid component.
 */
@Component
export struct GridComponent {
  @Prop data: Array<Number> = [0, 1, 2, 3, 4, 5, 6, 7, 8];
  @Prop collectionData: collectionModel[] | undefined = undefined;
  @Link userInfo: myUserInfo | undefined
  @StorageProp('mainBreakpoint') currentBreakpoint: string = CommonConstants.BREAKPOINTS_INITIALIZE_NAME;
  @State colTemplate: string = CommonConstants.INITIALIZE_TEMPLATE;

  aboutToAppear() {
    switch (this.currentBreakpoint) {
      case CommonConstants.BREAKPOINTS_SM_NAME:
        this.colTemplate = CommonConstants.SM_COL_TEMPLATE;
        break;
      case CommonConstants.BREAKPOINTS_MD_NAME:
        this.colTemplate = CommonConstants.MD_COL_TEMPLATE;
        break;
      case CommonConstants.BREAKPOINTS_LG_NAME:
        this.colTemplate = CommonConstants.LG_COL_TEMPLATE;
        break;
      case CommonConstants.BREAKPOINTS_XL_NAME:
        this.colTemplate = CommonConstants.XL_COL_TEMPLATE;
        break;
      default :
        this.colTemplate = CommonConstants.SM_COL_TEMPLATE;
        break;
    }
  }

  build() {
    Column() {
      Grid() {
        ForEach(this.collectionData, (item: collectionModel, index: number) => {
          GridItem() {
            Column() {
              Image(item?.subject?.images?.medium as string)
                .alt($r('app.media.app_icon'))
                .width(CommonConstants.ROW_WIDTH)
                .aspectRatio(CommonConstants.COLUMN_ASPECT_RATIO)
                .backgroundColor($r('app.color.grid_item_background'))
                .borderRadius($r('app.float.grid_row_border_radius'))

              Row() {
                Text(item?.subject?.name)
                  .margin({ top: $r('app.float.grid_text_top') })
                  .fontSize($r('app.float.grid_text_font_size'))
                  .fontWeight(CommonConstants.COLUMN_TEXT_FONT_WEIGHT)
                  .fontColor($r('app.color.grid_title_color'))
              }
              .padding({ left: $r('app.float.grid_text_padding_left') })
              .width(CommonConstants.ROW_WIDTH)
            }
          }
        })
      }
      .columnsGap($r('app.float.grid_column_gap'))
      .rowsGap($r('app.float.grid_row_gap'))
      .columnsTemplate(this.colTemplate)
      .onAreaChange(() => {
        this.colTemplate = new BreakPointType({
          sm: CommonConstants.SM_COL_TEMPLATE,
          md: CommonConstants.MD_COL_TEMPLATE,
          lg: CommonConstants.LG_COL_TEMPLATE,
          xl: CommonConstants.XL_COL_TEMPLATE
        }).getValue(this.currentBreakpoint)
      })
      .margin({
        left: $r('app.float.grid_margin_left'),
        right: $r('app.float.grid_margin_right')
      })
      .padding({ bottom: $r('app.float.grid_padding_bottom') })
      .scrollBar(BarState.Off)
    }
  }

  @Builder Title() {
    Row() {
      Image(this?.userInfo?.avatar?.large)
        .alt($r('app.media.app_icon'))
        .width(50)
        .height(50)
        .borderRadius(50)

      Text(this?.userInfo?.username)
        .height(50)
        .fontSize(18)
    }
    .width('100%')
    .height(50)
  }
}
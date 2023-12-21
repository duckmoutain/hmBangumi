import { collectionModel } from '../../../viewmodel/subjectModel';
import { CommonConstants } from '../constants/CommonConstants';
import { DataItem } from '../viewmodel/DataItem';
import data from '@ohos.telephony.data';

/**
 * This is the general detail page component that can add multiple items to the list.
 */
@Component
export struct DetailListComponent {
  private detailList: Array<DataItem> = [];
  @State data: collectionModel | undefined = undefined

  build() {
    Column() {
      Image(this?.data?.subject?.images?.large)
        .alt($r('app.media.bangumi_logo'))
        .width('100%')
        .autoResize(true)
      Text(this?.data?.subject?.name)
        .fontSize($r('app.float.name_text_size'))
        .fontColor($r('app.color.text'))
      Blank()
      Text(this?.data?.subject?.short_summary)
        .fontSize($r('app.float.app_info_sub_title_size'))
        .fontColor($r('app.color.text_opacity'))
    }
    .width(CommonConstants.DETAIL_LIST_WIDTH_PERCENT)
    .padding({
      top: $r('app.float.list_padding_top'),
      bottom: $r('app.float.list_padding_bottom'),
      left: $r('app.float.list_padding_left'),
      right: $r('app.float.list_padding_right')
    })
    .margin({ top: $r('app.float.name_text_padding_top') })
    .backgroundColor($r('app.color.start_window_background'))
    .borderRadius($r('app.float.detail_list_radius'))
  }
}
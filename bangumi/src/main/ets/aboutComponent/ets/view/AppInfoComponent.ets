import router from '@ohos.router';
import { DataItem } from '../viewmodel/DataItem';
import { CommonConstants } from '../constants/CommonConstants';
import AboutViewModel from '../viewmodel/AboutViewModel';

/**
 * AppInfo component shows the relevant information of the application.
 */
@Component
export struct AppInfoComponent {
  private appInfoData: Array<DataItem> = [];

  build() {
    Column() {
      List() {
        ForEach(this.appInfoData, (item: DataItem) => {
          ListItem() {
            Column() {
              AppInfoItem({
                appInfoItem: item
              })
              Divider()
                .color($r('app.color.divider'))
                .strokeWidth(CommonConstants.DIVIDER_STROKE_WIDTH)
                .margin({
                  left: $r('app.float.list_padding_left'),
                  right: $r('app.float.list_padding_left')
                })
            }
          }
        }, (item: DataItem, index?: number) => index + JSON.stringify(item))
      }
    }
    .backgroundColor(Color.White)
    .borderRadius($r('app.float.app_info_radius'))
  }
}

@Component
struct AppInfoItem {
  private appInfoItem: DataItem = new DataItem();

  build() {
    Flex({
      direction: FlexDirection.Row,
      alignItems: ItemAlign.Center,
      justifyContent: FlexAlign.SpaceBetween
    }) {
      Text(this.appInfoItem.title)
        .fontSize($r('app.float.app_info_title_size'))
        .fontColor($r('app.color.text'))
        .fontWeight(CommonConstants.FONT_WEIGHT)
      Image(this.appInfoItem.icon)
        .objectFit(ImageFit.Contain)
        .height($r('app.float.app_info_image_height'))
        .width($r('app.float.app_info_image_width'))
        .align(Alignment.End)
    }
    .margin({
      left: $r('app.float.list_padding_left'),
      right: $r('app.float.list_padding_right')
    })
    .height($r('app.float.list_height'))
    .onClick(() => this.openDetailPage(this.appInfoItem))
  }

  openDetailPage(itemData: DataItem): void {
    let listData: Array<DataItem> = [];
    switch (itemData.id) {
      case CommonConstants.ABOUT_US_ID:
        listData = AboutViewModel.getAboutUsInfo();
        break;
      case CommonConstants.CONTACT_ID:
        listData = AboutViewModel.getContactInfo();
        break;
      default:
        break;
    }
    router.pushUrl({
      url: CommonConstants.DETAIL_PAGE,
      params: {
        title: itemData.title,
        data: listData
      }
    });
  }
}

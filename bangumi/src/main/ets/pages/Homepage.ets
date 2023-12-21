import router from '@ohos.router';
import { loginModel } from '../viewmodel/loginmodel'
import { collectionModel } from '../viewmodel/subjectModel'
import { GetHomePageData, myUserInfo } from '../serve/serveutil'
import { ResponsiveLayout } from './component/tabComponent';
import TabsViewModel from '../pages/component/TabsViewModel';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State getUserInfo: string = 'getUserInfo'
  @State params: loginModel = router.getParams() as loginModel;
  @Prop accessToken: string | undefined = undefined
  @Prop tokenType: string | undefined = undefined
  @Prop UserInfo: myUserInfo | undefined = undefined
  @Prop CollectionModel: collectionModel[] | undefined = undefined

  onPageShow() {
    if(!this.accessToken) {
      GetHomePageData(this.params.code,  (token: string, type: string) => {
        this.accessToken = token
        this.tokenType = type
      }, (userInfo: myUserInfo) => {
        this.UserInfo = userInfo
      },(collectionData: collectionModel[]) => {
        this.CollectionModel = collectionData
      })
    }
  }

  build() {
    Column() {
      this.Title()
      ResponsiveLayout({ userinfo: this.UserInfo, collectionData: this.CollectionModel })
    }
    .height('100%')
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  @Builder Title() {
    Row() {
      Image(this?.UserInfo?.avatar?.large)
        .alt($r('app.media.app_icon'))
        .width(50)
        .height(50)
        .borderRadius(50)

      Text(this?.UserInfo?.username)
        .height(50)
        .fontSize(18)
    }
    .width('100%')
    .height('6%')
    .margin({ left: "12vp", top: "12vp", bottom : "12vp"})
    .onClick(() => {
      router.pushUrl({ url: "aboutComponent/ets/pages/PrivacyPage" })
    })
  }
}
import web_webview from '@ohos.web.webview';
import { extractCode } from '../jsutil/util';
import router from '@ohos.router';

@Entry
@Component
struct Index {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  build() {
    Row() {
      Column() {
          Web({ src: 'https://bgm.tv/oauth/authorize?client_id=bgm28816581579508ecc&response_type=code', controller: this.controller })
            .onPageBegin((event) => {
              console.log(JSON.stringify(event))
              const code: string = extractCode(event?.url)
              console.log(code)
              if(code) {
                router.replaceUrl({
                  url: 'pages/Homepage',
                  params: { code }
                })
              }
            })
      }
      .width('100%')
    }
    .height('100%')
  }

}
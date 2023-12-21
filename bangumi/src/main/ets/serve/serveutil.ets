import http from '@ohos.net.http'
import { BusinessError } from '@ohos.base';
import { collectionModel } from '../viewmodel/subjectModel';
import TabsViewModel from '../pages/component/TabsViewModel';


interface getUserInfoHeader {
  Authorization: string
}

const requestUtil = async (requestUrl: string, Options: http.HttpRequestOptions, callback?: (data: http.HttpResponse) => void) => {
  let httpRequest = http.createHttp();
  httpRequest.on('headersReceive', (header: Object) => {
    console.info('header: ' + JSON.stringify(header));
  });

  console.log(`request Opthons = ${JSON.stringify(Options)}`)

  httpRequest.request(
    requestUrl,
    Options,
    (err: BusinessError, data: http.HttpResponse) => {
      if (!err) {
        console.log(JSON.stringify(data))
        if (callback) {
          callback(data)
        }
        // 取消订阅HTTP响应头事件
        httpRequest.off('headersReceive');
        // 当该请求使用完毕时，开发者务必调用destroy方法主动销毁该JavaScript Object。
        httpRequest.destroy();
      } else {
        console.info('error:' + JSON.stringify(err));
        // 取消订阅HTTP响应头事件
        httpRequest.off('headersReceive');
        // 当该请求使用完毕时，开发者务必调用destroy方法主动销毁该JavaScript Object。
        httpRequest.destroy();
      }
    });
}

interface avatarInfo {
  large: string
  medium: string
  small: string
}

export interface myUserInfo {
  avatar: avatarInfo
  username: string
  id: number
  mainUrl: string
}

export const getUserInfoRequest = (header: getUserInfoHeader, setUserInfo: (userInfo: myUserInfo) => void, setCollection: (collectionData: collectionModel[]) => void) => {
  let path = `https://api.bgm.tv/v0/me`

  let requestUrl = path;
  const cb = (data: http.HttpResponse) => {
    let result = data?.result as string
    console.log(result)
    let userTmp: myUserInfo = JSON.parse(result)
    setUserInfo(userTmp as myUserInfo)
    TabsViewModel.UserInfo = userTmp
    getUserCollections(header.Authorization, userTmp.username, "2", setCollection);
    getUserCollections(header.Authorization, userTmp.username, "1", setCollection);
    getUserCollections(header.Authorization, userTmp.username, "3", setCollection);
    getUserCollections(header.Authorization, userTmp.username, "4", setCollection);
  }

  let Options: http.HttpRequestOptions = {
    header: {
      'Content-Type': 'application/json',
      'User-Agent': 'duckmoutain/ohosBangumi',
      Authorization: header.Authorization,
    },
    method: http.RequestMethod.GET,
    usingCache: false
  }

  requestUtil(requestUrl, Options, cb);
}

interface getTokenHeader {
  grant_type: string
  client_id: string
  client_secret: string
  code: string
  redirect_uri: string
}

export const GetHomePageData = (code: string, setToken: (token: string, type: string) => void, setUserInfo: (userInfo: myUserInfo) => void, setCollection: (collectionData: collectionModel[]) => void) => {
  let requestUrl = 'https://bgm.tv/oauth/access_token'

  const data: getTokenHeader = {
    grant_type: "authorization_code",
    client_id: "bgm28816581579508ecc",
    client_secret: "8910de6d57accaa34c6f2949067a5e86",
    code: code,
    redirect_uri: "hmBangumi"
  }

  let Options: http.HttpRequestOptions = {
    header: {
      'Content-Type': 'application/json',
      'User-Agent': 'duckmoutain/ohosBangumi',
    },
    method: http.RequestMethod.POST,
    usingCache: false,
    extraData: data,
  }


  const cb = (data: http.HttpResponse) => {
    const result = data?.result as string
    let token = JSON.parse(result)?.access_token as string
    let type = JSON.parse(result)?.token_type as string
    console.log('bgm token is : ', token)
    if (token && type) {
      setToken(token, type)
      TabsViewModel.tokenType = type
      TabsViewModel.accessToken = token
      getUserInfoRequest({Authorization: `${type} ${token}`}, setUserInfo, setCollection)
    }
  }

  requestUtil(requestUrl, Options, cb)
}

interface requestCollectionParams {
  /**
   * 条目类型
   - `1` 为 书籍
   - `2` 为 动画
   - `3` 为 音乐
   - `4` 为 游戏
   - `6` 为 三次元
   */
  subject_type?: string
  /**
   - `1`: 想看
   - `2`: 看过
   - `3`: 在看
   - `4`: 搁置
   - `5`: 抛弃
   */
  type?: string
}

export const getUserCollections = (Authorization: string, userName: string, subject_type: string, setCollection: (collectionData: collectionModel[]) => void) => {
  let path = `https://api.bgm.tv/v0/users/${userName}/collections`

  const data: requestCollectionParams = {
    subject_type: subject_type,
  }

  let Options: http.HttpRequestOptions = {
    header: {
      'Content-Type': 'application/json',
      'User-Agent': 'duckmoutain/ohosBangumi',
      Authorization,
    },
    method: http.RequestMethod.GET,
    usingCache: false,
    extraData: data
  }


  const cb = (data: http.HttpResponse) => {
    const result = data?.result as string
    setCollection(JSON.parse(result)?.data)
    TabsViewModel.setIndexData(Number(subject_type), JSON.parse(result)?.data)
    console.log('getUsercollerction result is', result.substring(0, 100));
  }

  console.log(path)
  requestUtil(path, Options, cb)
}
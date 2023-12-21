import { myUserInfo } from '../../serve/serveutil';
import { collectionModel } from '../../viewmodel/subjectModel';
import { CommonConstants } from '../constants/CommonConstants';
import { TabBarItem } from './TabBarItem';

const getTabName = (index: number) : string => {
  switch (index + 1) {
    case 1:
      return '书籍'

    case 2:
      return '动画'

    case 3:
      return '音乐'

    case 4:
      return '游戏'

    default :
      return 'ーへー'
  }
}

export class TabsViewModel {
  bookModel: collectionModel[] = []
  animeModel: collectionModel[] = []
  musicModel: collectionModel[] = []
  gameModel: collectionModel[] = []
  accessToken: string | undefined = undefined
  tokenType: string | undefined = undefined
  UserInfo: myUserInfo | undefined = undefined
  CollectionModel: collectionModel[] | undefined = undefined

  setIndexData(index: number, data: collectionModel[]) :void {
    switch (index) {
      case  1:
        this.bookModel = data
        return
      case  2:
        this.animeModel = data
        return
      case  3:
        this.musicModel = data
        return
      case 4:
        this.gameModel = data
        return
      default:

    }
  }


  getIndexData(index: number): collectionModel[] {
    switch (index) {
      case  1:
        return this.bookModel
      case  2:
        return this.animeModel
      case  3:
        return this.musicModel
      case 4:
        return this.gameModel
      default:
        return []
    }
  }

  getTabData(): Array<TabBarItem> {
    let tabItems: Array<TabBarItem> = [];
    for (let i = 0; i < CommonConstants.TAB_SIZE; i++) {
      let itemInfo: TabBarItem = new TabBarItem();
      itemInfo.name = getTabName(i);
      itemInfo.icon = $r('app.media.ic_tabs_icon');
      itemInfo.selectIcon = $r('app.media.ic_tabs_icon_selected');
      tabItems.push(itemInfo);
    }
    return tabItems;
  }
}

let tabsViewModel = new TabsViewModel();

export default tabsViewModel as TabsViewModel;
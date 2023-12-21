import { DataItem } from './DataItem';
import { CommonConstants } from '../constants/CommonConstants';

/**
 * About ability view model.
 */
class AboutViewModel {
  /**
   * Get application information.
   *
   * @return {Array<DataItem>} appInfo
   */
  getAppInfo(): Array<DataItem> {
    let appInfo: Array<DataItem> = [];
    let aboutUsData: DataItem = new DataItem();
    aboutUsData.id = CommonConstants.ABOUT_US_ID;
    aboutUsData.title = $r('app.string.about_us');
    aboutUsData.icon = $r('app.media.ic_arrow');
    appInfo.push(aboutUsData);
    let contactData: DataItem = new DataItem();
    contactData.id = CommonConstants.CONTACT_ID;
    contactData.title = $r('app.string.contact_customer_service');
    contactData.icon = $r('app.media.ic_arrow');
    appInfo.push(contactData);
    return appInfo;
  }

  /**
   * Get about us information.
   *
   * @return {Array<DataItem>} aboutUsInfo
   */
  getAboutUsInfo(): Array<DataItem> {
    let aboutUsInfo: Array<DataItem> = [];
    let officialWeb: DataItem = new DataItem();
    officialWeb.title = $r('app.string.home_page');
    officialWeb.summary = $r('app.string.home_weblink');
    aboutUsInfo.push(officialWeb);
    let publicAccount: DataItem = new DataItem();
    publicAccount.title = $r('app.string.public_account');
    publicAccount.summary = $r('app.string.account_name');
    aboutUsInfo.push(publicAccount);
    return aboutUsInfo;
  }

  /**
   * Get contact information.
   *
   * @return {Array<DataItem>} contactInfo
   */
  getContactInfo(): Array<DataItem> {
    let contactInfo: Array<DataItem> = [];
    let serviceHotline: DataItem = new DataItem();
    serviceHotline.title = $r('app.string.service_hotline');
    serviceHotline.summary = $r('app.string.hotline_number');
    contactInfo.push(serviceHotline);
    let emailAddress: DataItem = new DataItem();
    emailAddress.title = $r('app.string.email');
    emailAddress.summary = $r('app.string.email_address');
    contactInfo.push(emailAddress);
    return contactInfo;
  }

  /**
   * Get detail page default information.
   *
   * @return {Array<DataItem>} contactInfo
   */
  getDefaultDetailInfo(): Array<DataItem> {
    let defaultInfo: Array<DataItem> = [];
    for (let i = 0; i < CommonConstants.DETAIL_DEFAULT_ROW; i++) {
      let defaultData: DataItem = new DataItem();
      defaultData.title = $r('app.string.detail_item_title');
      defaultData.summary = $r('app.string.arrow_title');
      defaultInfo.push(defaultData);
    }
    return defaultInfo;
  }
}

let aboutViewModel = new AboutViewModel();

export default aboutViewModel as AboutViewModel;
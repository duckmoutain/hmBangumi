/**
 * Basic list item data bean.
 */
export class DataItem {
  /**
   * Indicates unique id for list item.
   */
  id: number = 0;
  
  /**
   * Indicates list item title.
   */
  title: Resource = $r('app.string.detail_item_title');

  /**
   * Indicates list item icon.
   */
  icon: Resource = $r('app.media.ic_arrow');

  /**
   * Indicates list item summary.
   */
  summary: Resource = $r('app.string.arrow_title');
}
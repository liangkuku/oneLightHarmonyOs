import homeViewModel from  '../viewModel/HomeViewModel'
import CommonConstants from '../common/constants/CommonConstants';
@Component
export default struct Login{
  private swiperController:SwiperController =new SwiperController()

  build(){
    // Scroll(){
      Column() {

        Column(){
          Swiper(this.swiperController) {
            ForEach(homeViewModel.getSwiperImages(), (img: Resource) => {
              Image(img).height(CommonConstants.FULL_PARENT).height(CommonConstants.FULL_PARENT)
            }, (img: Resource) => JSON.stringify(img.id))
          }
          .autoPlay(true)

          // Text($r('app.string.HomeWelcomeTitle_en'))
          //   .fontWeight(FontWeight.Medium)
          //   .fontSize($r('app.float.page_title_text_size'))
          //   .position({x:0,y:'60%'})
          //   .zIndex(1)
        }
        .width(CommonConstants.FULL_PARENT)
        .height(CommonConstants.FULL_PARENT)
        // .alignItems(HorizontalAlign.Start)

        // Column(){
        //   Text($r('app.string.HomeWelcomeTitle_en'))
        //       .fontWeight(FontWeight.Medium)
        //       .fontSize($r('app.float.page_title_text_size'))
        //
        //   Text($r('app.string.HomeWelcomeTitle_ch'))
        //     .fontWeight(FontWeight.Medium)
        //     .fontSize($r('app.float.page_title_text_size'))
        //   }.width('100%')
        //
        // Text($r('app.string.HomeWelcomeTooltip_1'))
        //   .fontWeight(FontWeight.Medium)
        //   .fontSize($r('app.float.page_title_text_size'))
        //
        // Text($r('app.string.HomeWelcomeTooltip_2'))
        //   .fontWeight(FontWeight.Medium)
        //   .fontSize($r('app.float.page_title_text_size'))
        //
        // Text($r('app.string.HomeWelcomeTooltip_3'))
        //   .fontWeight(FontWeight.Medium)
        //   .fontSize($r('app.float.page_title_text_size'))
        //
        // Text($r('app.string.HomeWelcomeTooltip_4'))
        //   .fontWeight(FontWeight.Medium)
        //   .fontSize($r('app.float.page_title_text_size'))
        //
        // Text($r('app.string.HomeWelcomeTooltip_5'))
        //   .fontWeight(FontWeight.Medium)
        //   .fontSize($r('app.float.page_title_text_size'))

      }.justifyContent(FlexAlign.Start)

      // }.height(CommonConstants.FULL_PARENT)
    }
}

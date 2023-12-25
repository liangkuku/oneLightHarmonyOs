import homeViewModel from  '../viewModel/HomeViewModel'
import CommonConstants from '../common/constants/CommonConstants';
@Component
export default struct Login{
  private swiperController:SwiperController =new SwiperController()

  @Builder
  customTitle(title:Resource,fontWeight:FontWeight,fontSize:Resource,fontColor?:Resource,click?:()=>void){
   Text(title)
      .fontWeight(fontWeight)
      .fontSize(fontSize)
      .fontColor(fontColor)
      .onClick(()=>{
        if(typeof click === 'function') click()
      })
  }

  build(){
    // Scroll(){
      Column() {

          Swiper(this.swiperController) {
            ForEach(homeViewModel.getSwiperImages(), (img: Resource) => {
              Image(img).height(CommonConstants.FULL_PARENT).height(CommonConstants.FULL_PARENT).width(CommonConstants.FULL_PARENT)
            }, (img: Resource) => JSON.stringify(img.id))
          }
          .autoPlay(true)
          .position({x:0,y:0})

          Column({space:20}){
            this.customTitle($r('app.string.HomeWelcomeTitle_en'),FontWeight.Medium,$r('app.float.page_main_title_text_size'))
            this.customTitle($r('app.string.HomeWelcomeTitle_ch'),FontWeight.Medium,$r('app.float.page_main_title_text_size'))

            this.customTitle($r('app.string.HomeWelcomeTooltip_1'),FontWeight.Medium,$r('app.float.page_second_title_text_size'))
            this.customTitle($r('app.string.HomeWelcomeTooltip_2'),FontWeight.Medium,$r('app.float.page_second_title_text_size'))

            Row(){
              this.customTitle($r('app.string.HomeWelcomeTooltip_3'),FontWeight.Medium,$r('app.float.page_second_title_text_size'))
              this.customTitle($r('app.string.HomeWelcomeTooltip_4'),FontWeight.Medium,$r('app.float.page_second_title_text_size'),$r('app.color.home_link_color'))
              this.customTitle($r('app.string.HomeWelcomeTooltip_5'),FontWeight.Medium,$r('app.float.page_second_title_text_size'))
            }

            Button('注册/登录', { type: ButtonType.Capsule, stateEffect: true }).backgroundColor(Color.Black).width(90)
          }
          .width('100%')
          .height('40%')
          .width(CommonConstants.FULL_PARENT)
          .padding({top:20})
          .backgroundColor("#d0c9c6")
          .opacity(0.95)
        }
        .width(CommonConstants.FULL_PARENT)
        .height(CommonConstants.FULL_PARENT)
        .justifyContent(FlexAlign.End)
    }
}


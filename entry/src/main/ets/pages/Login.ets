import CommonConstants from '../common/constants/CommonConstants';
import router from '@ohos.router';

@Extend(TextInput)
function inputStyle() {
  .placeholderColor($r('app.color.placeholder_color'))
  .height($r('app.float.login_input_height'))
  .fontSize($r('app.float.big_text_size'))
  .backgroundColor($r('app.color.background'))
  .width(CommonConstants.FULL_PARENT)
  .padding({ left: CommonConstants.INPUT_PADDING_LEFT })
  .margin({ top: $r('app.float.input_margin_top') })
}

@Extend(Text)
function textStyle(){
  .margin({
    top:14
  })
}

@Entry
@Component
export default struct Login{
  @State phoneNumber: string = '';
  @State password: string = '';
  @State seconds:number = CommonConstants.GET_MSG_CODE_INTERVAL

  validateMobileNum = (val: string) => {
    const reg = /^1[3,4,5,6,7,8,9][0-9]{9}$/;
    return reg.test(val);
  };

  countDown = ()=>{
    this.seconds = CommonConstants.GET_MSG_CODE_INTERVAL
    const timeId = setInterval(()=>{
        this.seconds = this.seconds - 1
        if(this.seconds === 0) {
          clearInterval(timeId)
          this.seconds = CommonConstants.GET_MSG_CODE_INTERVAL
        }
    },1000)
  }

  login = async()=>{
      if(!this.phoneNumber|| !this.password ) return
  }

  build(){
    Column(){

      Image($r('app.media.back'))
        .width($r('app.float.image_back_size'))
        .height($r('app.float.image_back_size'))
        .alignSelf(ItemAlign.Start)
        .margin({
          // left: CommonConstants.BACK_MARGIN_LEFT,
          top: CommonConstants.BACK_MARGIN_TOP
        })
        .onClick(() => {
          router.replaceUrl({ url: 'pages/Index' });
        })

      Image($r('app.media.appLogo')).width($r('app.float.login_page_logo_size'))

      Text('hi,oneLight').fontSize(26).fontWeight(500).margin({top:16})

      TextInput({ placeholder: '输入手机号（新号码自动注册）'})
        .maxLength(CommonConstants.INPUT_ACCOUNT_LENGTH)
        .type(InputType.Number)
        .inputStyle()
        .onChange((value: string) => {
          this.phoneNumber = value;
          this.validateMobileNum(value)
        })

        TextInput({ placeholder: '密码' })
          .maxLength(CommonConstants.INPUT_PASSWORD_LENGTH)
          .type(InputType.Password)
          .inputStyle()
          .onChange((value: string) => {
            this.password = value;
          })

        Text(`获取验证码${this.seconds<CommonConstants.GET_MSG_CODE_INTERVAL ? ` ${this.seconds}s`:''}`)
          .textStyle()
          .fontColor(this.seconds)
          .onClick(()=>{
            if(!this.validateMobileNum(this.phoneNumber) || this.seconds<30){
              return
            }
            this.countDown()
          })

      // Row(){
      //   Image($r('app.media.wechat'))
      //   Image($r('app.media.wechat'))
      // }

      Text($r('app.string.login')).margin({top:24}).onClick(()=>{
        this.login()
      })

    }.padding({
      top: $r('app.float.login_page_padding_top'),
      left: $r('app.float.page_padding_hor'),
      right: $r('app.float.page_padding_hor'),
      bottom: $r('app.float.login_page_padding_bottom')
    })
  }
}
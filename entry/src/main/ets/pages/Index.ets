import Home from "../view/Home"
import CommonConstants from '../common/constants/CommonConstants';
@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  build() {
    Column() {
      Home()
    }
    // .height(CommonConstants.FULL_PARENT)
  }
}
import { requireCJLib } from "libark_interop_loader.so"
import { hilog } from '@kit.PerformanceAnalysisKit';

interface CustomLib {
  testCJ(a: string): string
}

const cjLib: CustomLib = requireCJLib("libentry.so") as CustomLib

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    RelativeContainer() {
      Text(this.message)
        .id('HelloWorld')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .onClick(_ => {
          const result = cjLib.testCJ("Cangjie")
          hilog.info(0x0000, 'testTag', 'Test Cangjie: %{public}s', result);
        })
    }
    .height('100%')
    .width('100%')
  }
}
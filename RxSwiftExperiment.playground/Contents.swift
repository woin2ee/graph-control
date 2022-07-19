import UIKit
import RxSwift
import RxCocoa

let disposeBag = DisposeBag.init()

let publishRelay = PublishRelay<Int>.init()

publishRelay
    .subscribe(
        onNext: { value in
            print(value)
        }
    )
    .disposed(by: disposeBag)

publishRelay.accept(1)
publishRelay.accept(2)

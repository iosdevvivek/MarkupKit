//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import UIKit
import MarkupKit

class IntroductionViewController: UIViewController {
    var nameField: UITextField!
    var greetingLabel: UILabel!

    override func loadView() {
        var rootView = LMLayerView()

        rootView.addArrangedSubview(LMViewBuilder.viewWithName("IntroductionView", owner: self, root: nil))
        rootView.layoutMarginsRelativeArrangement = false

        view = rootView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Markup Example"

        edgesForExtendedLayout = UIRectEdge.None
    }

    func showGreeting() {
        let name = nameField.text
        let mainBundle = NSBundle.mainBundle()

        let greeting: String;
        if (name.isEmpty) {
            greeting = mainBundle.localizedStringForKey("unknownName", value: nil, table: nil)
        } else {
            greeting = String(format: mainBundle.localizedStringForKey("greetingFormat", value: nil, table: nil), name)
        }

        greetingLabel.text = greeting
    }
}

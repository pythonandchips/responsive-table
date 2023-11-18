import "@hotwired/turbo-rails"
import "./controllers"

import confirmMethod from "./confirm_method"

window.Turbo.setConfirmMethod(confirmMethod)

import { ApplicationController } from './application_controller'

export default class extends ApplicationController {
  connect() {
    console.log(88)
  }

  onCreate(event) {
    console.log(event.detail)
  }
}

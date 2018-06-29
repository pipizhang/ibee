package routers

import (
	"github.com/astaxie/beego"

	"ibee/controllers"
)

func init() {
	beego.Router("/", &controllers.MainController{})
}

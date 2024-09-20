package main

import (
	"github.com/gin-gonic/gin"
)

func main() {
	r := gin.Default()

	r.GET("/", func(c *gin.Context) {
		name := c.DefaultQuery("name", "Brandon")
		index := index(name, "Hi "+name)
		index.Render(c, c.Writer)
	})

	r.Run(":8081")
}

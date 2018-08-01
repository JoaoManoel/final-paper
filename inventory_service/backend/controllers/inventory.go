package controllers

import (
	"net/http"
	"strconv"

	"../models"
	"github.com/gin-gonic/gin"
)

//UpdateQuantity - Object with the quantity to update
type UpdateQuantity struct {
	Quantity int `json:"quantity" binding:"required"`
}

//CreateInventory - Creates a new inventory item
func CreateInventory(c *gin.Context) {
	i := &models.Inventory{}
	if err := c.ShouldBind(i); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"status": "ERROR",
			"msg":    err.Error(),
		})
	} else {
		if err := i.Create(); err != nil {
			c.JSON(http.StatusConflict, gin.H{
				"status": "ERROR",
				"msg":    "Código SKU já registrado",
			})
		} else {
			c.JSON(http.StatusCreated, gin.H{
				"status": "OK",
				"msg":    "Inventário criado com sucesso",
			})
		}
	}
}

//ListAllInventory - Fetch all inventory items
func ListAllInventory(c *gin.Context) {
	list, _ := models.ListAllInventory()
	if len(list) == 0 {
		list = []models.Inventory{}
	}

	c.JSON(http.StatusOK, gin.H{
		"status": "OK",
		"data":   list,
	})
}

//FindBySKU - Fetch a inventory by your SKU
func FindBySKU(c *gin.Context) {
	sku := c.Param("sku")
	i, err := models.FindBySKU(sku)

	if err == nil {
		c.JSON(http.StatusOK, gin.H{
			"status": "OK",
			"data":   i,
		})
	} else {
		c.JSON(http.StatusNotFound, gin.H{
			"status": "ERROR",
			"msg":    "Inventário não encontrado.",
		})
	}
}

/*UpdateInventoryProcessing - Update stock total and waiting
  Stock total will have one less item
  Stock Waiting will have one more item
*/
func UpdateInventoryProcessing(c *gin.Context) {
	var updateQuantity UpdateQuantity
	sku := c.Param("sku")
	if err := c.ShouldBind(&updateQuantity); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"status": "ERROR",
			"msg":    "quantity deve ser um número e maior que zero.",
		})

		return
	}

	err := models.UpdateInventoryProcessing(sku, updateQuantity.Quantity)
	if err == nil {
		c.JSON(http.StatusOK, gin.H{
			"status": "OK",
			"msg":    "Inventário atualizado com sucesso.",
		})
	} else {
		c.JSON(http.StatusBadRequest, gin.H{
			"status": "ERROR",
			"msg":    err.Error(),
		})
	}
}

/*UpdateInventoryCanceled - Update stock total and waiting
  Stock total will have one more item
  Stock Waiting will have one less item
*/
func UpdateInventoryCanceled(c *gin.Context) {
	var updateQuantity UpdateQuantity
	sku := c.Param("sku")
	if err := c.ShouldBind(&updateQuantity); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"status": "ERROR",
			"msg":    "quantity deve ser um número e maior que zero.",
		})

		return
	}

	err := models.UpdateInventoryCanceled(sku, updateQuantity.Quantity)
	if err == nil {
		c.JSON(http.StatusOK, gin.H{
			"status": "OK",
			"msg":    "Inventário atualizado com sucesso.",
		})
	} else {
		c.JSON(http.StatusBadRequest, gin.H{
			"status": "ERROR",
			"msg":    err.Error(),
		})
	}
}

/*UpdateInventoryConfirmed - Update stock total and waiting
  Stock Waiting will have one less item
*/
func UpdateInventoryConfirmed(c *gin.Context) {
	var updateQuantity UpdateQuantity
	sku := c.Param("sku")
	if err := c.ShouldBind(&updateQuantity); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"status": "ERROR",
			"msg":    "quantity deve ser um número e maior que zero.",
		})

		return
	}

	err := models.UpdateInventoryConfirmed(sku, updateQuantity.Quantity)
	if err == nil {
		c.JSON(http.StatusOK, gin.H{
			"status": "OK",
			"msg":    "Inventário atualizado com sucesso.",
		})
	} else {
		c.JSON(http.StatusBadRequest, gin.H{
			"status": "ERROR",
			"msg":    err.Error(),
		})
	}
}

//DeleteInventory - Deletes a inventory item
func DeleteInventory(c *gin.Context) {
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"status": "ERROR",
			"msg":    "ID inválido!",
		})
	} else {
		i := models.Inventory{ID: id}

		if res, err := i.Delete(); err != nil {
			c.JSON(http.StatusBadRequest, gin.H{
				"status": "ERROR",
				"msg":    err.Error(),
			})
		} else {
			if r, _ := res.RowsAffected(); r > 0 {
				c.JSON(http.StatusCreated, gin.H{
					"status": "OK",
					"msg":    "Inventário removido com sucesso",
				})
			} else {
				c.JSON(http.StatusNotFound, gin.H{
					"status": "OK",
					"msg":    "Inventário não encontrado",
				})
			}

		}
	}
}

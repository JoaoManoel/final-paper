package models

import (
	"database/sql"
	"errors"

	"../db"
)

//Inventory Model
type Inventory struct {
	ID            int    `db:"id" json:"id"`
	StockTotal    int    `db:"stock_total" json:"stock_total" binding:"required"`
	StockReserved int    `db:"stock_reserved" json:"stock_reserved"`
	SKU           string `db:"sku" json:"sku" binding:"required"`
}

//Create - Create a inventory item
func (i Inventory) Create() error {
	_, err := db.GetDB().Exec("INSERT INTO inventory (stock_total, stock_reserved, sku) VALUES ($1, $2, $3)", i.StockTotal, i.StockReserved, i.SKU)

	return err
}

//Delete - Delete a inventory item
func (i Inventory) Delete() (sql.Result, error) {
	return db.GetDB().Exec("DELETE FROM inventory WHERE id = $1", i.ID)
}

//ListAllInventory - List All Inventory items
func ListAllInventory() ([]Inventory, error) {
	var list []Inventory
	err := db.GetDB().Select(&list, "SELECT * FROM inventory ORDER BY id")
	return list, err
}

//FindBySKU - Find a inventory by your SKU
func FindBySKU(sku string) (*Inventory, error) {
	i := &Inventory{}
	err := db.GetDB().Get(i, "SELECT * FROM inventory where sku = $1", sku)
	return i, err
}

/*UpdateInventoryProcessing - Update a inventory item
  Stock total will have less items
  Stock Reserved will have more items
*/
func UpdateInventoryProcessing(sku string, quantity int) error {
	var count int
	db := db.GetDB()
	err := db.QueryRow("SELECT stock_total FROM inventory WHERE sku = $1", sku).Scan(&count)
	if err == nil {
		if (count - quantity) > -1 {
			res, _ := db.Exec(`UPDATE inventory 
			    SET stock_total = stock_total - $2,
			    stock_reserved = stock_reserved + $2 
			    WHERE SKU = $1`, sku, quantity)

			res.RowsAffected()
			return nil
		}
		return errors.New("sem estoque ou ultrapassa a quantidade disponível em estoque")
	}

	return errors.New("Inventário não encontrado")
}

/*UpdateInventoryCanceled - Update a inventory item
  Stock total will have more items
  Stock Reserved will have less items
*/
func UpdateInventoryCanceled(sku string, quantity int) error {
	var count int
	db := db.GetDB()
	// se não encontrar o SKU já vai dar erro aqui
	// ai nao precisa checar qd executar res.RowsAffected()
	err := db.QueryRow("SELECT stock_reserved FROM inventory WHERE sku = $1", sku).Scan(&count)
	if err == nil {
		if (count - quantity) > -1 {
			res, _ := db.Exec(`UPDATE inventory 
			    SET stock_total   = stock_total + $2,
			    stock_reserved = stock_reserved - $2 
			    WHERE SKU = $1`, sku, quantity)

			res.RowsAffected()
			return nil
		}
		return errors.New("sem estoque reservada ou ultrapassa a quantidade reservada em estoque")
	}

	return errors.New("Inventário não encontrado")
}

/*UpdateInventoryConfirmed - Update a inventory item
  Stock Reserved will have less items
*/
func UpdateInventoryConfirmed(sku string, quantity int) error {
	var count int
	db := db.GetDB()
	err := db.QueryRow("SELECT stock_reserved FROM inventory WHERE sku = $1", sku).Scan(&count)
	if err == nil {
		if (count - quantity) > -1 {
			res, _ := db.Exec(`UPDATE inventory 
			    SET stock_reserved = stock_reserved - $2
			    WHERE SKU = $1`, sku, quantity)

			res.RowsAffected()
			return nil
		}
		return errors.New("sem estoque reservado ou ultrapassa a quantidade reservada em estoque")
	}

	return errors.New("Inventário não encontrado")
}

package models

// Order - Order Struct
type Order struct {
	Status   string    `json:"status"`
	Products []Product `json:"products"`
}

// Product - Product Struct
type Product struct {
	Name        string  `json:"name"`
	Description string  `json:"description"`
	Detail      string  `json:"detail"`
	Price       float32 `json:"price"`
	Weight      float32 `json:"weight"`
	Category    struct {
		ID     int    `json:"id"`
		Name   string `json:"name"`
		Gender string `json:"gender"`
	} `json:"category"`
	Model struct {
		ID       int    `json:"id"`
		SKU      string `json:"sku"`
		Quantity int    `json:"quantity"`
		Size     string `json:"size"`
		Color    string `json:"color"`
	} `json:"model"`
}

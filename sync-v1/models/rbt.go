package models

type AccountAPIResponse struct {
	Data struct {
		Response struct {
			TotalTxn int     `json:"totalTxn"`
			Wid      string  `json:"wid"`
			Balance  float64 `json:"balance"`
			Credits  struct {
				SpentCredits   int `json:"spentCredits"`
				UnspentCredits int `json:"unspentCredits"`
			} `json:"credits"`
			AvailableBalance float64 `json:"available balance"`
			ReceiverTxn      int     `json:"receiverTxn"`
			StakedToken      int     `json:"staked token"`
			Did              string  `json:"did"`
			SenderTxn        int     `json:"senderTxn"`
		} `json:"response"`
	} `json:"data"`
	Message string `json:"message"`
	Status  string `json:"status"`
}

type CreateAPIResponse struct {
	ExecutionTime string `json:"executionTime"`
	Status        string `json:"status"`
}


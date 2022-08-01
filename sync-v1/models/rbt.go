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

type InitTxnAPIResponse struct {
	Data struct {
		Response struct {
			Receiver   string   `json:"receiver"`
			Totaltime  int      `json:"totaltime"`
			Quorumlist []string `json:"quorumlist"`
			Message    string   `json:"message"`
			Tid        string   `json:"tid"`
			Did        string   `json:"did"`
			Status     string   `json:"status"`
		} `json:"response"`
	} `json:"data"`
	Message string `json:"message"`
	Status  string `json:"status"`
}

type InitTxnAPIRequest struct {
	Receiver   string  `json:"receiver"`
	TokenCount float64 `json:"tokenCount"`
	Comment    string  `json:"comment"`
	Type       int     `json:"type"`
}

// Read implements io.Reader
func (*InitTxnAPIRequest) Read(p []byte) (n int, err error) {
	panic("unimplemented")
}

type CreateAPIResponse struct {
	ExecutionTime string `json:"executionTime"`
	Status        string `json:"status"`
}

type RubixConfig []interface{}

type DirPaths struct {
	TokensPath     string `json:"TOKENS_PATH"`
	TokenchainPath string `json:"TOKENCHAIN_PATH"`
	PaymentsPath   string `json:"PAYMENTS_PATH"`
	WalletDataPath string `json:"WALLET_DATA_PATH"`
	DataPath       string `json:"DATA_PATH"`
	LoggerPath     string `json:"LOGGER_PATH"`
	CommitPath     string `json:"COMMIT_PATH"`
}

type TxHistoryAPIResponse struct {
Data struct {
		Response []struct {
			SenderDID   string   `json:"senderDID"`
			Amount      float32      `json:"amount"`
			Role        string   `json:"role"`
			TotalTime   int      `json:"totalTime"`
			// QuorumList  []string `json:"quorumList"`
			Tokens      []string `json:"tokens"`
			Comment     string   `json:"comment"`
			Txn         string   `json:"txn"`
			AmountSpent float32      `json:"amount-spent"`
			ReceiverDID string   `json:"receiverDID"`
			Date        string   `json:"Date"`
		} `json:"response"`
		Count int `json:"count"`
	} `json:"data"`
	Message string `json:"message"`
	Status  string `json:"status"`
}

type SyncAPIResponse struct {
	Data struct {
		Response string `json:"response"`
	} `json:"data"`
	Message string `json:"message"`
	Status  string `json:"status"`
}
